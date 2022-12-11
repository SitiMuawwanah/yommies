from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.urls import reverse
import datetime

# Create your models here.

class KategoriResep(models.Model):
    category = models.CharField(max_length=255,null=True)
    key = models.CharField(max_length=255,null=True)
    is_from_api = models.BooleanField(null=True)

    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    # class Meta:
    #     ordering = ['-updated', '-created']

    def save(self, **kwargs):
        self.key = slugify(self.category)
        super().save()

    def get_absolute_url(self):
        url_slug = {'key':self.key}
        return reverse('kategori', kwargs = url_slug)
        
    def __str__(self):
        return self.category

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


class KomentarResep(models.Model):
    key_resep = models.CharField(max_length=255,null=True)
    komentar = models.TextField(null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)

    created = models.DateTimeField(auto_now_add=True)

    # class Meta:
    #     ordering = ['-updated', '-created']
    def __str__(self):
        return self.key_resep

class Bookmarks(models.Model):
    key_resep = models.CharField(max_length=255,null=True)
    title_resep = models.CharField(max_length=255,null=True)
    thumb_resep = models.CharField(max_length=255,null=True)
    times_resep = models.CharField(max_length=255,null=True)
    serving_resep = models.CharField(max_length=255,null=True)
    difficulty_resep = models.CharField(max_length=255,null=True)
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)

    created = models.DateTimeField(auto_now_add=True)

    # class Meta:
    #     ordering = ['-updated', '-created']
    def __str__(self):
        return self.title_resep