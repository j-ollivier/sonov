"""sonov URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from sonovsite import views
from sonovsite.models import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.FrontPage),
    # blog articles
    url(r'^article/view/(?P<article_slug>[\w-]+)', views.ArticleView),
    url(r'^articles/', views.ArticleIndex),
    # galery
    url(r'^galerie/view/(?P<galery_slug>[\w-]+)', views.GaleryView),
    url(r'^galeries/', views.GaleryIndex),
    # sons
    url(r'^sons/', views.SonsIndex),
    # search by tag
    url(r'^sbytag/(?P<tag_searched>\d+)', views.SearchByTag),
    # site info
    url(r'^info/', views.SiteInfo),
    url(r'^soundcloud_iframe/(?P<soundcloud_id>\d+)', views.SoundcloudIframe),
]