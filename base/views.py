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

    context = {'kategori_resep':kategori_resep,'new_resep':new_resep,'resep_by_yommies':resep_by_yommies,'media_url':settings.MEDIA_URL}
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

    context = {'api_resep':api_resep,'media_url':settings.MEDIA_URL,'kategori_resep':kategori_resep}
    return render(request, 'frontend/resep.html', context)

def resepByKategori(request, key):
    nama_kategori = key.replace('-',' ')
    # Resep
    url_resep_by_kategori = f'{base_url}/category/recipes/{key}'
    reseps = requests.get(url_resep_by_kategori)
    data_resep = reseps.json()
    api_resep = data_resep['results']

    context = {'api_resep':api_resep,'media_url':settings.MEDIA_URL,'nama_kategori':nama_kategori}
    return render(request, 'frontend/resep_by_kategori.html', context)


# @login_required(login_url='login')
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


# Produk Views
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
        if request.FILES.get('gambar'):
            upload = request.FILES['gambar']
            gambar = upload.name
            Resep.objects.create(
                title=request.POST.get('title'),
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
        resep.title  = request.POST.get('title')
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

    context = {'resep':resep,'media_url':settings.MEDIA_URL,'ingredient':ingredient,'step':step,'url_youtube':url_youtube,'from_api':from_api}
    return render(request, 'frontend/detail_resep.html', context)

def tentang(request):
    context = {}
    return render(request, 'frontend/tentang.html', context)

def profilUser(request):
    user = request.user
    context = {}
    return render(request, 'frontend/tentang.html', context)
