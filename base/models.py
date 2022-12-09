from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.urls import reverse
import datetime

# Create your models here.

class KategoriResep(models.Model):
    judul = models.CharField(max_length=255)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    # class Meta:
    #     ordering = ['-updated', '-created']

    def __str__(self):
        return self.judul

class Resep(models.Model):
    judul         = models.CharField(max_length=255)
    isi           = models.TextField()
    kategori_resep     = models.ForeignKey(KategoriResep, on_delete=models.SET_NULL, null=True)
    author              = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    gambar              = models.ImageField(upload_to='images_resep/',null=True)
    url_youtube         = models.CharField(max_length=255, null=True)
    created             = models.DateTimeField(auto_now_add=True)
    updated             = models.DateTimeField(auto_now=True)
    slug                = models.SlugField(blank=True, editable=False)

    def save(self, **kwargs):
        self.slug = slugify(self.judul)
        super().save()

    def get_absolute_url(self):
        url_slug = {'slug':self.slug}
        return reverse('blog', kwargs = url_slug)
        
    def __str__(self):
        return self.judul