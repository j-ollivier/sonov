# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-03-16 08:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sonovsite', '0005_auto_20170315_1900'),
    ]

    operations = [
        migrations.AddField(
            model_name='galery',
            name='thumbnail',
            field=models.ImageField(blank=True, null=True, upload_to='static/sonovsite/article'),
        ),
        migrations.AddField(
            model_name='son',
            name='is_visible',
            field=models.BooleanField(default=False),
        ),
        migrations.AlterField(
            model_name='article',
            name='is_visible',
            field=models.BooleanField(default=False),
        ),
    ]
