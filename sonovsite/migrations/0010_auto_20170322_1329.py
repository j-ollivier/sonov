# -*- coding: utf-8 -*-
# Generated by Django 1.10 on 2017-03-22 12:29
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sonovsite', '0009_auto_20170320_1242'),
    ]

    operations = [
        migrations.AlterField(
            model_name='son',
            name='short_desc',
            field=models.CharField(blank=True, max_length=72, null=True),
        ),
        migrations.AlterField(
            model_name='son',
            name='source_site',
            field=models.CharField(choices=[('youtube', 'youtube'), ('soundcloud', 'soundcloud'), ('vimeo', 'vimeo'), ('other', 'iframe')], max_length=50),
        ),
    ]
