# Generated by Django 4.1.3 on 2022-12-08 03:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0013_resep_delete_artikel_delete_kategoriartikel'),
    ]

    operations = [
        migrations.AddField(
            model_name='resep',
            name='url_youtube',
            field=models.CharField(max_length=255, null=True),
        ),
    ]