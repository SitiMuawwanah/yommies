# Generated by Django 4.1.3 on 2022-11-14 12:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0004_kategoriartikel_kategoriproduk_produk_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='produk',
            name='harga',
            field=models.IntegerField(default=0),
        ),
    ]
