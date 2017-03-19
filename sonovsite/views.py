from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from .models import *
import operator #for sorting objects from different tables in one aggregated list

#####################################################################
def FrontPage(request):
    '''
        Landing page for the whole blog.
    '''
    # Hit the db 3 times (hurr) to get 3 lists of 3 last items posted
    last_sons= [i for i in Son.objects.select_related().filter(is_visible=True).order_by('created_date').reverse()][:5]
    for i in last_sons:
        i.type= 'son'
    last_articles= [i for i in Article.objects.select_related().filter(is_visible=True).order_by('created_date').reverse()][:5]
    for i in last_articles:
        i.type= 'article'
    last_galeries= [i for i in Galery.objects.select_related().filter(is_visible=True).order_by('created_date').reverse()][:5]
    for i in last_galeries:
        i.type= 'galery'
    # Merge the lists and order them by posted date
    merged_items= last_sons + last_articles + last_galeries
    sorted_items = sorted(merged_items, key=operator.attrgetter('created_date'), reverse=True)

    context={
        'content': sorted_items,
    }
    template = loader.get_template('frontpage.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def ArticleIndex(request):
    '''
        Index of articles.
    '''
    context={
        'articles': Article.objects.filter(is_visible=True),
        'all_tags': Tag.objects.all(),
    }
    template = loader.get_template('article_index.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def ArticleView(request, article_slug):
    '''
        View a single article.
    '''
    context={
        'article': Article.objects.select_related().get(slug= article_slug),
    }
    template = loader.get_template('article_view.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def GaleryIndex(request):
    '''
        Index of articles.
    '''
    context={
        'galeries': Galery.objects.select_related().filter(is_visible=True),
    }
    template = loader.get_template('galery_index.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def GaleryView(request, galery_pk):
    '''
        View a single galery and its content.
    '''
    context={
        'galery': Galery.objects.select_related().get(pk=galery_pk),
    }
    template = loader.get_template('galery_view.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def SonsIndex(request):
    '''
        Index of sounds.
    '''
    sons= Son.objects.select_related().all().order_by('created_date').reverse()
    for son in sons:
        son.colorbox_link= son.colorbox_link()
    context={
        'sons': sons,
    }
    template = loader.get_template('sons_index.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def SearchByTag(request, tag_searched):
    '''
        Search items from 3 categories by tag
    '''
    sons= [i for i in Son.objects.filter(is_visible=True, tags__pk=tag_searched)]
    for i in sons:
        i.type= 'son'
    articles= [i for i in Article.objects.filter(is_visible=True, tags__pk=tag_searched)]
    for i in articles:
        i.type= 'article'
    # galeries= [i for i in Galery.objects.select_related().filter(is_visible=True, tags__in=tag_searched).order_by('created_date').reverse()]
    # for i in galeries:
    #     i.type= 'galery'

    # Merge the lists and order them by posted date
    merged_items= sons + articles
    sorted_items = sorted(merged_items, key=operator.attrgetter('created_date'), reverse=True)
    context={
        'tag_searched': tag_searched,
        'content': sorted_items
        # 'galeries': galeries,
    }
    template = loader.get_template('search_by_tag.html')
    return HttpResponse(template.render(context, request))