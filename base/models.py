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
    title               = models.CharField(max_length=255,null=True)
    key                 = models.SlugField(blank=True, editable=False)
    desc                = models.TextField(null=True)
    thumb               = models.ImageField(upload_to='images_resep/',null=True)
    ingredient          = models.CharField(max_length=255,null=True)
    step                = models.CharField(max_length=255,null=True)
    times               = models.CharField(max_length=255,null=True)
    serving             = models.CharField(max_length=255,null=True)
    difficulty          = models.CharField(max_length=255,null=True)
    needItem_itemName   = models.CharField(max_length=255,null=True)
    needItem_thumbItem  = models.CharField(max_length=255,null=True)
    author              = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    url_youtube         = models.CharField(max_length=255, null=True)
    created             = models.DateTimeField(auto_now_add=True)
    updated             = models.DateTimeField(auto_now=True)
    kategori_resep      = models.ForeignKey(KategoriResep, on_delete=models.SET_NULL, null=True)
    author_user         = models.CharField(max_length=255,null=True)
    author_datePublished = models.CharField(max_length=255,null=True)
    is_from_api         = models.BooleanField(null=True,default=0)


    def save(self, **kwargs):
        self.key = slugify(self.title)
        super().save()

    def get_absolute_url(self):
        url_slug = {'key':self.key}
        return reverse('blog', kwargs = url_slug)
        
    def __str__(self):
        return self.title
