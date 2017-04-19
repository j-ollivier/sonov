from django.contrib import admin
from .models import *

# Register your models here.
class AdminArticle(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("title",)}
    list_display =['uid', 'is_visible', 'title']
    ordering = ['uid']
admin.site.register(Article, AdminArticle)

class AdminSon(admin.ModelAdmin):
    list_display =['uid', 'is_visible', 'title', 'created_date', 'posted_by']
    ordering = ['created_date']
admin.site.register(Son, AdminSon)

class AdminTag(admin.ModelAdmin):
    list_display =['uid','title']
    ordering = ['uid']
admin.site.register(Tag, AdminTag)

class AdminImage(admin.ModelAdmin):
    list_display =['uid','title']
    ordering = ['uid']
admin.site.register(Image, AdminImage)

class AdminGalery(admin.ModelAdmin):
    prepopulated_fields = {"slug": ("title",)}
    list_display =['uid', 'is_visible', 'title']
    ordering = ['uid']
admin.site.register(Galery, AdminGalery)