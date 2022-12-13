import http
from django.shortcuts import render,redirect
from django.contrib.auth.models import User, Group, Permission
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render,redirect,reverse
from django.contrib.auth.decorators import login_required,user_passes_test,permission_required
from .models import *
from django.http import HttpResponse, JsonResponse
from . import forms
from datetime import datetime
from django.core.files.storage import FileSystemStorage
from django.conf import settings
import os
import requests
import shutil


base_url = 'https://masak-apa-tomorisakura.vercel.app/api/'
# Create your views here.
def home(request):
    url_kategori = f'{base_url}/category/recipes/'
    kategori = requests.get(url_kategori)
    data = kategori.json()
    kategori_resep = data['results']

    satu_resep_new = f'{base_url}/recipes-length/?limit=1'
    satu_resep = requests.get(satu_resep_new)
    resep_baru = satu_resep.json()
    new_resep = resep_baru['results']
    resep_by_yommies = Resep.objects.filter(is_from_api=0)[:9]

    search = request.GET.get('search')
    if request.GET.get('search'):
        # Cari dari api
        url_cari = f'{base_url}/search/?q={search}'
        cari = requests.get(url_cari)
        data = cari.json()
        resep_cari_api = data['results']
        resep_cari_yommies = Resep.objects.filter(title__icontains=request.GET.get('search'),is_from_api=0)[:9]
        context = {'kategori_resep':kategori_resep,'new_resep':new_resep,'resep_by_yommies':resep_by_yommies,'media_url':settings.MEDIA_URL,'resep_cari_api':resep_cari_api,'resep_cari_yommies':resep_cari_yommies,'search':search}
    else:
        context = {'kategori_resep':kategori_resep,'new_resep':new_resep,'resep_by_yommies':resep_by_yommies,'media_url':settings.MEDIA_URL,'search':search}
    return render(request, 'frontend/home.html', context)


def resepFull(request):
    url_kategori = f'{base_url}/category/recipes/'
    kategori = requests.get(url_kategori)
    data = kategori.json()
    kategori_resep = data['results']

    # Resep
    url_resep = f'{base_url}/recipes'
    reseps = requests.get(url_resep)
    data_resep = reseps.json()
    api_resep = data_resep['results']

    # for resep in api_resep:
    #     if Resep.objects.filter(key=resep['key']).exists() == False:
    #         Resep.objects.create(
    #             title=resep['title'],
    #             key=resep['key'],
    #             thumb=resep['thumb'],
    #             serving=resep['serving'],
    #             times=resep['times'],
    #             difficulty=resep['difficulty'],
    #             is_from_api=1
    #         )
    #     else:
    #         Resep.objects.filter(key=resep['key']).update(
    #             title=resep['title'],
    #             key=resep['key'],
    #             thumb=resep['thumb'],
    #             serving=resep['serving'],
    #             times=resep['times'],
    #             difficulty=resep['difficulty'],
    #             is_from_api=1
    #         )

    kategoris = KategoriResep.objects.all()

    context = {'api_resep':api_resep,'media_url':settings.MEDIA_URL,'kategori_resep':kategori_resep,'kategoris':kategoris}
    return render(request, 'frontend/resep.html', context)

def resepByKategori(request, key):
    nama_kategori = key.replace('-',' ')
    # Resep
    kategori = KategoriResep.objects.filter(key=key).exists()
    if kategori == False:
        url_resep_by_kategori = f'{base_url}/category/recipes/{key}'
        reseps = requests.get(url_resep_by_kategori)
        data_resep = reseps.json()
        api_resep = data_resep['results']
    else:
        kategori_resep = KategoriResep.objects.get(key=key)
        api_resep = Resep.objects.filter(kategori_resep_id=kategori_resep.id)

    context = {'api_resep':api_resep,'media_url':settings.MEDIA_URL,'nama_kategori':nama_kategori,'kategori':kategori}
    return render(request, 'frontend/resep_by_kategori.html', context)


@login_required(login_url='login')
def dashboard(request):
    return render(request,'operator/dashboard.html')

def loginPage(request):
    if request.user.is_authenticated:
        if request.user.is_superuser == 1:
            return redirect('dashboard')
        else:
            return redirect('home')
    
    if request.method == 'POST':
        username = request.POST.get('username')
        password =request.POST.get('password')

        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            user_profile = User.objects.get(username=username)
            login(request, user)
            if user_profile.is_superuser == 1:
                return redirect('dashboard')
            else:
                return redirect('home')
        else:
            messages.info(request, 'Username / Password Salah.')
            return redirect('login')
    return render(request, 'frontend/login.html')

def registerPage(request):
    if request.user.is_authenticated:
        if request.user.is_superuser == 1:
            return redirect('dashboard')
        else:
            messages.info(request, 'Anda Telah Login.')
            return redirect('home')
    
    form = forms.UserForm()

    if request.method == 'POST':
        form = forms.UserForm(request.POST)
        if request.POST.get('password1') == request.POST.get('password2'):
            if form.is_valid():
                user_new = form.save()
                messages.success(request, "Terimakasih Telah Registrasi, Sekarang Anda Telah Login.")
                new_user = authenticate(username=form.cleaned_data['username'],
                                        password=form.cleaned_data['password1'],
                                        )
                login(request, new_user)
                return redirect('home')
            else:
                messages.error(request, "Data Tidak Valid. Pastikan Data Benar. Password Minimal 8 Karakter Dengan Kombinasi Huruf, Angka & Simbol.", extra_tags="danger" )
                return redirect('register')
        else:
            messages.error(request, "Password & Konfirmasi Password Harus Sama.", extra_tags="danger" )
            return redirect('register')
       

    context = {'form':form}
    return render(request, 'frontend/register.html', context)

def logout_view(request):
    logout(request)
    return redirect('login')


# Resep Views
@login_required(login_url='login')
def resepIndex(request):
    reseps = Resep.objects.all()
    context = {'reseps':reseps,'media_url':settings.MEDIA_URL}
    return render(request,'operator/resep/index.html', context)

@login_required(login_url='login')
def resepHapus(request,pk):
    resep = Resep.objects.get(id=pk)
    if request.method == 'POST':
        if resep.gambar:
            if os.path.isfile(resep.gambar.path):
                os.remove(resep.gambar.path)
        resep.delete()
        messages.success(request, "Sukses Menghapus Resep." )
        return redirect('resep')
    else:
        messages.error(request, 'Terdapat Error Saat Hapus Resep. Pastikan Data Yang Ingin Dihapus Tidak Terkait Dengan Data Lain!', extra_tags="danger")
    return render(request, 'operator/resep/hapus.html', {'obj':resep})

@login_required(login_url='login')
def resepTambah(request):
    kategoris = KategoriResep.objects.all()
    if request.method == 'POST':
        key_slug = request.POST.get('title').replace(" ", "-").lower()
        if request.FILES.get('gambar'):
            upload = request.FILES['gambar']
            gambar = upload.name
            Resep.objects.create(
                title=request.POST.get('title'),
                key=key_slug,
                desc=request.POST.get('desc'),
                kategori_resep_id=request.POST.get('kategori_resep'),
                thumb=gambar,
                author=request.user,
                url_youtube=request.POST.get('url_youtube'),
                difficulty=request.POST.get('difficulty'),
                ingredient=request.POST.get('ingredient'),
                step=request.POST.get('step'),
                serving=request.POST.get('serving'),
                is_from_api=0,
            )
            fss = FileSystemStorage()
            file = fss.save(upload.name, upload)
            file_url = fss.url(file)
        else:
            Resep.objects.create(
                title=request.POST.get('title'),
                key=key_slugs,
                desc=request.POST.get('desc'),
                kategori_resep_id=request.POST.get('kategori_resep'),
                thumb=gambar,
                author=request.user,
                url_youtube=request.POST.get('url_youtube'),
                difficulty=request.POST.get('difficulty'),
                ingredient=request.POST.get('ingredient'),
                step=request.POST.get('step'),
                serving=request.POST.get('serving'),
                is_from_api=0,
            )
        messages.success(request, "Sukses Menambah Resep." )
        return redirect('resep')
    context = {'kategoris':kategoris}
    return render(request,'operator/resep/tambah.html', context)

@login_required(login_url='login')
def resepEdit(request,pk):
    resep = Resep.objects.get(id=pk)
    kategoris = KategoriResep.objects.all()
    if request.method == 'POST':
        key_slug = request.POST.get('title').replace(" ", "-").lower()
        resep.title  = request.POST.get('title')
        key          = key_slug
        resep.desc  = request.POST.get('desc')
        resep.url_youtube  = request.POST.get('url_youtube')
        resep.kategori_resep_id  = request.POST.get('kategori_resep')
        resep.difficulty  = request.POST.get('difficulty')
        resep.ingredient  = request.POST.get('ingredient')
        resep.step  = request.POST.get('step')
        resep.serving  = request.POST.get('serving')
        resep.save()
        if request.FILES.get('gambar'):
            if resep.gambar:
                if os.path.isfile(resep.gambar.path):
                    os.remove(resep.gambar.path)
            upload = request.FILES['gambar']
            resep.gambar = upload.name
            resep.save()
            fss = FileSystemStorage()
            file = fss.save(upload.name, upload)
            file_url = fss.url(file)
        messages.success(request, "Sukses Mengubah Resep." )
        return redirect('resep')

    context = {'resep':resep,'kategoris':kategoris,'media_url':settings.MEDIA_URL}
    return render(request, 'operator/resep/edit.html', context)

@login_required(login_url='login')
def resepDetail(request,pk):
    artikel = Resep.objects.get(id=pk)
    kategoris = Resep.objects.all()
    context = {'artikel':artikel,'kategoris':kategoris}
    return render(request, 'operator/resep/detail.html', context)

# Kategori Views
@login_required(login_url='login')
def kategoriIndex(request):
    kategoris = KategoriResep.objects.all()
    context = {'kategoris':kategoris}
    return render(request,'operator/kategori/index.html', context)

@login_required(login_url='login')
def kategoriHapus(request,pk):
    kategori = KategoriResep.objects.get(id=pk)
    if request.method == 'POST':
        kategori.delete()
        messages.success(request, "Sukses Menghapus Kategori." )
        return redirect('kategori')
    else:
        messages.error(request, 'Terdapat Error Saat Hapus Kategori. Pastikan Data Yang Ingin Dihapus Tidak Terkait Dengan Data Lain!', extra_tags="danger")
    return render(request, 'operator/kategori/hapus.html', {'obj':kategori})

@login_required(login_url='login')
def kategoriTambah(request):
    if request.method == 'POST':
        key_slug = request.POST.get('category').replace(" ", "-").lower()
        KategoriResep.objects.create(
            category=request.POST.get('category'),
            key=key_slug
        )
        messages.success(request, "Sukses Menambah Kategori." )
        return redirect('kategori')
    context = {}
    return render(request,'operator/kategori/tambah.html', context)

@login_required(login_url='login')
def kategoriEdit(request,pk):
    kategori = KategoriResep.objects.get(id=pk)
    if request.method == 'POST':
        key_slug = request.POST.get('category').replace(" ", "-").lower()
        kategori.category  = request.POST.get('category')
        kategori.key  = key_slug
        kategori.save()
        messages.success(request, "Sukses Mengubah Kategori." )
        return redirect('kategori')

    context = {'kategori':kategori}
    return render(request, 'operator/kategori/edit.html', context)

# EDIT PROFIl
@login_required(login_url='home')
def profil(request):
    user = request.user
    form = forms.UserForm(instance=user)

    if request.method == 'POST':
        form = forms.UserForm(request.POST, instance=user)
        user.first_name = request.POST.get('first_name')
        user.last_name = request.POST.get('last_name')
        user.username = request.POST.get('username')
        if request.POST.get('password1'):
            if request.POST.get('password1') == request.POST.get('password2'):
                user.set_password(request.POST.get('password1'))
            else:
                 messages.error(request, "Password & Konfirmasi Password Harus Sama.", extra_tags="danger" )
                 return redirect('profil')
        user.save()
        messages.success(request, "Sukses Mengubah Profil." )
        return redirect('profil')

    context = {'user':user,'form':form}
    return render(request, 'operator/profil.html', context)


def detailResep(request, key):
    komentars = KomentarResep.objects.filter(key_resep=key)
    if request.user.is_authenticated:
        bookmark = Bookmarks.objects.filter(key_resep=key,user=request.user).exists()
    # Resep
    if Resep.objects.filter(key=key).exists() == False:
        from_api = 1
        url_detail_resep = f'{base_url}/recipe/{key}'
        reseps = requests.get(url_detail_resep)
        data_resep = reseps.json()
        resep = data_resep['results']
        ingredient = resep['ingredient']
        step = resep['step']
        url_youtube = ""
    else:
        from_api = 0
        resep = Resep.objects.get(key=key)
        ingredient = resep.ingredient.split(", ")
        step = resep.step.split(", ")
        if resep.url_youtube:
            yt = resep.url_youtube.split("v=")
            url_youtube = yt[1]
        else:
            url_youtube = ""

    if request.method == 'POST':
        if request.POST.get('komentar'):
            KomentarResep.objects.create(
                key_resep = key,
                user=request.user,
                komentar=request.POST.get('komentar')
            )
            messages.success(request, "Komentar Berhasil Dikirim.")
        elif request.POST.get('key_bookmarks'):
            url_resep_detail = f'{base_url}/recipe/{key}'
            resepnya = requests.get(url_resep_detail)
            datanya = resepnya.json()
            result = datanya['results']
            Bookmarks.objects.create(
                key_resep = key,
                title_resep=result['title'],
                times_resep=result['times'],
                difficulty_resep=result['difficulty'],
                thumb_resep=result['thumb'],
                serving_resep=result['servings'],
                user=request.user,
            )
            messages.success(request, "Bookmark Berhasil Ditambahkan ✅")
        elif request.POST.get('key_unbookmarks'):
            Bookmarks.objects.get(key_resep=key,user=request.user).delete()
            messages.success(request, "Bookmark Berhasil Dihapus.")
        return redirect(request.META.get('HTTP_REFERER'))
    if request.user.is_authenticated:
        context = {'resep':resep,'media_url':settings.MEDIA_URL,'ingredient':ingredient,'step':step,'url_youtube':url_youtube,'from_api':from_api,'komentars':komentars,'key':key,'bookmark':bookmark}
    else:
        context = {'resep':resep,'media_url':settings.MEDIA_URL,'ingredient':ingredient,'step':step,'url_youtube':url_youtube,'from_api':from_api,'komentars':komentars,'key':key}
    return render(request, 'frontend/detail_resep.html', context)

def tentang(request):
    context = {}
    return render(request, 'frontend/tentang.html', context)

@login_required(login_url='login')
def profilUser(request):
    user = request.user
    form = forms.UserForm(instance=user)

    if request.method == 'POST':
        form = forms.UserForm(request.POST, instance=user)
        user.first_name = request.POST.get('first_name')
        user.last_name = request.POST.get('last_name')
        user.username = request.POST.get('username')
        if request.POST.get('password1'):
            if request.POST.get('password1') == request.POST.get('password2'):
                user.set_password(request.POST.get('password1'))
            else:
                 messages.error(request, "Password & Konfirmasi Password Harus Sama.", extra_tags="danger" )
                 return redirect(request.META.get('HTTP_REFERER'))
        user.save()
        messages.success(request, "Sukses Mengubah Profil." )
        return redirect(request.META.get('HTTP_REFERER'))

    bookmarks = Bookmarks.objects.filter(user=request.user)
    context = {'bookmarks':bookmarks}
    return render(request, 'frontend/profil.html', context)


def sinkron(request):
    # Sinkron Kategori Resep
    url_kategori = f'{base_url}/category/recipes/'
    kategori = requests.get(url_kategori)
    data = kategori.json()
    kategori_resep = data['results']
    for kategori in kategori_resep:
        key_kategori = kategori['key']
        if KategoriResep.objects.filter(key=kategori['key']).exists() == False:
            KategoriResep.objects.create(
                category=kategori['category'],
                key = kategori['key'],
                is_from_api = 1
            )
        else:
            KategoriResep.objects.filter(key=kategori['key']).update(category=kategori['category'],key=kategori['key'])

        get_kategori = KategoriResep.objects.get(key=key_kategori)
        url_resep_by_kategori = f'{base_url}/category/recipes/{key_kategori}'
        reseps = requests.get(url_resep_by_kategori)
        data_resep = reseps.json()
        api_resep = data_resep['results']

        for resep in api_resep:
            image_url = resep['thumb']
            filename = r"media/"+image_url.split("/")[-1]
            nama_file_diubah = image_url.split("/")[-1]
            r = requests.get(image_url, stream = True)
            if r.status_code == 200:
                r.raw.decode_content = True            
                with open(filename,'wb') as f:
                    shutil.copyfileobj(r.raw, f)
                print('Image sucessfully Downloaded: ',filename)
            else:
                print('Image Couldn\'t be retreived')

            key_resep = resep['key']
            # GET DETAIL DULU
            url_detail_resep = f'{base_url}/recipe/{key_resep}'
            detail_reseps = requests.get(url_detail_resep)
            json_resep = detail_reseps.json()
            data_detail_resep = json_resep['results']

            ingredient_join = ', '.join(data_detail_resep['ingredient'])
            step_join = ', '.join(data_detail_resep['step'])

            if Resep.objects.filter(key=resep['key']).exists() == False:
                Resep.objects.create(
                    title=resep['title'],
                    key=resep['key'],
                    thumb=nama_file_diubah,
                    serving=resep['serving'],
                    times=resep['times'],
                    difficulty=resep['difficulty'],
                    is_from_api=1,

                    author_datePublished=data_detail_resep['author']['datePublished'],
                    author_user=data_detail_resep['author']['user'],
                    desc = data_detail_resep['desc'],
                    ingredient = ingredient_join,
                    step = step_join,

                    kategori_resep_id=get_kategori.id,
                )
            else:
                Resep.objects.filter(key=resep['key']).update(
                    title=resep['title'],
                    key=resep['key'],
                    thumb=nama_file_diubah,
                    serving=resep['serving'],
                    times=resep['times'],
                    difficulty=resep['difficulty'],
                    is_from_api=1,

                    author_datePublished=data_detail_resep['author']['datePublished'],
                    author_user=data_detail_resep['author']['user'],
                    desc = data_detail_resep['desc'],
                    ingredient = ingredient_join,
                    step = step_join,

                    kategori_resep_id=get_kategori.id,
                )

    # Sinkron Resep Aja
    url_resep = f'{base_url}/recipes'
    reseps = requests.get(url_resep)
    data_resep = reseps.json()
    api_resep = data_resep['results']
    for resep in api_resep:
        image_url = resep['thumb']
        filename = r"media/"+image_url.split("/")[-1]
        nama_file_diubah = image_url.split("/")[-1]
        r = requests.get(image_url, stream = True)
        if r.status_code == 200:
            r.raw.decode_content = True            
            with open(filename,'wb') as f:
                shutil.copyfileobj(r.raw, f)
            print('Image sucessfully Downloaded: ',filename)
        else:
            print('Image Couldn\'t be retreived')

        key_resep = resep['key']
        # GET DETAIL DULU
        url_detail_resep = f'{base_url}/recipe/{key_resep}'
        detail_reseps = requests.get(url_detail_resep)
        json_resep = detail_reseps.json()
        data_detail_resep = json_resep['results']

        ingredient_join = ', '.join(data_detail_resep['ingredient'])
        step_join = ', '.join(data_detail_resep['step'])

        if Resep.objects.filter(key=resep['key']).exists() == False:
            Resep.objects.create(
                title=resep['title'],
                key=resep['key'],
                thumb=nama_file_diubah,
                serving=resep['serving'],
                times=resep['times'],
                difficulty=resep['difficulty'],
                is_from_api=1,

                author_datePublished=data_detail_resep['author']['datePublished'],
                author_user=data_detail_resep['author']['user'],
                desc = data_detail_resep['desc'],
                ingredient = ingredient_join,
                step = step_join,
            )
        else:
            Resep.objects.filter(key=resep['key']).update(
                title=resep['title'],
                key=resep['key'],
                thumb=nama_file_diubah,
                serving=resep['serving'],
                times=resep['times'],
                difficulty=resep['difficulty'],
                is_from_api=1,

                author_datePublished=data_detail_resep['author']['datePublished'],
                author_user=data_detail_resep['author']['user'],
                desc = data_detail_resep['desc'],
                ingredient = ingredient_join,
                step = step_join,
            )

    messages.success(request, "Sukses Sinkronisasi, Silakan Cek Data." )
    return redirect(request.META.get('HTTP_REFERER'))
    context = {}
    return render(request, 'frontend/tentang.html', context)