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


url_api = 'https://masak-apa-tomorisakura.vercel.app/api/'
# Create your views here.
def home(request):
    context = {}
    return render(request, 'frontend/home.html', context)


def resepByKategori(request, key):
    nama_kategori = key.replace('-',' ')
    # Resep
    url_resep_by_kategori = f'{url_api}/category/recipes/{key}'
    reseps = requests.get(url_resep_by_kategori)
    data_resep = reseps.json()
    api_resep = data_resep['results']

    context = {'api_resep':api_resep,'media_url':settings.MEDIA_URL,'nama_kategori':nama_kategori}
    return render(request, 'frontend/resep_by_kategori.html', context)

def detailResep(request, key):
    # Resep
    url_resep_by_kategori = f'{url_api}/recipe/{key}'
    reseps = requests.get(url_resep_by_kategori)
    data_resep = reseps.json()
    api_resep = data_resep['results']

    context = {'api_resep':api_resep,'media_url':settings.MEDIA_URL,'nama_kategori':nama_kategori}
    return render(request, 'frontend/detail_resep.html', context)

# @login_required(login_url='login')
def dashboard(request):
    return render(request,'operator/dashboard.html')

def loginPage(request):
    if request.user.is_authenticated:
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

def logout_view(request):
    logout(request)
    return redirect('login')


# Produk Views
@login_required(login_url='login')
def resepIndex(request):
    reseps = Resep.objects.all()
    context = {'reseps':reseps}
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
    kategoris = Resep.objects.all()
    if request.method == 'POST':
        if request.FILES.get('gambar'):
            upload = request.FILES['gambar']
            gambar = upload.name
            Resep.objects.create(
                nama_produk=request.POST.get('nama_produk'),
                deskripsi=request.POST.get('deskripsi'),
                kategori_produk_id=request.POST.get('kategori'),
                harga=request.POST.get('harga'),
                gambar=gambar,
                author=request.user,
            )
            fss = FileSystemStorage()
            file = fss.save(upload.name, upload)
            file_url = fss.url(file)
        else:
            Resep.objects.create(
                nama_produk=request.POST.get('nama_produk'),
                deskripsi=request.POST.get('deskripsi'),
                kategori_produk_id=request.POST.get('kategori'),
                harga=request.POST.get('harga'),
                author=request.user,
            )
        messages.success(request, "Sukses Menambah Produk." )
        return redirect('produk')
    context = {'kategoris':kategoris}
    return render(request,'operator/resep/tambah.html', context)

@login_required(login_url='login')
def resepEdit(request,pk):
    produk = Resep.objects.get(id=pk)
    kategoris = Resep.objects.all()
    if request.method == 'POST':
        produk.nama_produk  = request.POST.get('nama_produk')
        produk.deskripsi  = request.POST.get('deskripsi')
        produk.harga  = request.POST.get('harga')
        produk.kategori_produk_id  = request.POST.get('kategori')
        produk.save()
        if request.FILES.get('gambar'):
            if produk.gambar:
                if os.path.isfile(produk.gambar.path):
                    os.remove(produk.gambar.path)
            upload = request.FILES['gambar']
            produk.gambar = upload.name
            produk.save()
            fss = FileSystemStorage()
            file = fss.save(upload.name, upload)
            file_url = fss.url(file)
        messages.success(request, "Sukses Mengubah Produk." )
        return redirect('produk')

    context = {'produk':produk,'kategoris':kategoris,'media_url':settings.MEDIA_URL}
    return render(request, 'operator/resep/edit.html', context)

@login_required(login_url='login')
def resepDetail(request,pk):
    artikel = Resep.objects.get(id=pk)
    kategoris = Resep.objects.all()
    context = {'artikel':artikel,'kategoris':kategoris}
    return render(request, 'operator/resep/detail.html', context)