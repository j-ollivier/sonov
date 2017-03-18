# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-03-15 09:41
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('uid', models.AutoField(db_index=True, primary_key=True, serialize=False)),
                ('slug', models.SlugField()),
                ('title', models.CharField(max_length=255)),
                ('corpus', models.TextField(blank=True, null=True)),
                ('short_desc', models.CharField(blank=True, max_length=255, null=True)),
                ('thumbnail', models.ImageField(blank=True, null=True, upload_to='static/article')),
                ('is_visible', models.BooleanField(default=True)),
                ('created_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('modified_date', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Galery',
            fields=[
                ('uid', models.AutoField(db_index=True, primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=100)),
                ('is_visible', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('uid', models.AutoField(db_index=True, primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=255)),
                ('thumbnail', models.ImageField(upload_to='static/image')),
                ('full_img', models.ImageField(upload_to='static/image')),
                ('external_link', models.CharField(blank=True, max_length=500, null=True)),
                ('legend', models.CharField(blank=True, max_length=500, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Son',
            fields=[
                ('uid', models.AutoField(db_index=True, primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=255)),
                ('thumbnail', models.ImageField(upload_to='static/son')),
                ('start_video_at', models.CharField(default=0, max_length=50)),
                ('url', models.CharField(max_length=100)),
                ('created_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('short_desc', models.CharField(blank=True, max_length=255, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('uid', models.AutoField(db_index=True, primary_key=True, serialize=False)),
                ('title', models.CharField(max_length=100)),
            ],
        ),
        migrations.AddField(
            model_name='son',
            name='tags',
            field=models.ManyToManyField(blank=True, related_name='video_tags', to='sonovsite.Tag'),
        ),
        migrations.AddField(
            model_name='galery',
            name='content',
            field=models.ManyToManyField(blank=True, related_name='galery_content', to='sonovsite.Image'),
        ),
        migrations.AddField(
            model_name='article',
            name='tags',
            field=models.ManyToManyField(blank=True, related_name='tags', to='sonovsite.Tag'),
        ),
    ]