# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-03-15 15:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sonovsite', '0002_galery_slug'),
    ]

    operations = [
        migrations.AddField(
            model_name='son',
            name='source_site',
            field=models.CharField(choices=[('youtube', 'youtube'), ('youndcloud', 'soundcloud'), ('vimeo', 'vimeo'), ('other', 'iframe')], default='youtube', max_length=50),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='article',
            name='thumbnail',
            field=models.ImageField(blank=True, null=True, upload_to='static/sonovsite/article'),
        ),
        migrations.AlterField(
            model_name='image',
            name='full_img',
            field=models.ImageField(upload_to='static/sonovsite/image'),
        ),
        migrations.AlterField(
            model_name='image',
            name='thumbnail',
            field=models.ImageField(upload_to='static/sonovsite/image'),
        ),
        migrations.AlterField(
            model_name='son',
            name='thumbnail',
            field=models.ImageField(upload_to='static/sonovsite/son'),
        ),
    ]
