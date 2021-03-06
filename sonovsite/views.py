from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from .models import *
import operator #for sorting objects from different tables in one aggregated list
from .forms import SearchAll
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

#####################################################################
def SearchSite(request):
    '''
        Function called when someone uses the search functionality 
        in the banner's site. Every view displays it.
    '''
    form= SearchAll(request.POST)
    if form.is_valid():
        # Get the search_terms in a variable with a simple name
        search_terms= form.cleaned_data['search']
        # Search for tags containing search_terms
        matching_tags= [i for i in Tag.objects.filter(
            title__search=search_terms)]
        # Search for sons containing search_terms in title
        matching_sons= [i for i in Son.objects.filter(
            is_visible= True,
            title__search= search_terms)] + [i for i in Son.objects.filter(
                is_visible=True,
                 tags__pk__in=[i.pk for i in matching_tags]
                 )]
        for i in matching_sons:
            i.type= 'son'
        # Search for articles containing search_terms in title
        matching_articles= [i for i in Article.objects.filter(
            is_visible= True,
            title__search= search_terms)]
        for i in matching_articles:
            i.type= 'article'
        # Search for galeries containing search_terms in title
        matching_galeries= [i for i in Galery.objects.filter(
            is_visible= True,
            title__search= search_terms)]
        for i in matching_galeries:
            i.type= 'galery'
        # merge lists and remove duplicates
        matchings_posts= list(set(matching_sons) | set(matching_articles) | set(matching_galeries))
        context={
            'search': search_terms,
            'content': matchings_posts,
            'form': SearchAll(),
        }
    else:
        context={}
    return context

#####################################################################
def handler404(request):
    response = render_to_response('404.html', {},
        context_instance=RequestContext(request)
        )
    response.status_code = 404
    return response

#####################################################################
def handler500(request):
    response = render_to_response('404.html', {},
        context_instance=RequestContext(request)
        )
    response.status_code = 500
    return response

#####################################################################
def FrontPage(request):
    '''
        Landing page for the whole blog. It has a search form which
        looks up titles, tags, article texts.
    '''
    if request.method== 'GET':
        # Hit the db 3 times (hurr) to get 3 lists of 3 last items posted
        last_sons= [i for i in Son.objects.select_related(
            ).filter(is_visible=True).order_by(
            'created_date').reverse()]
        for i in last_sons:
            i.type= 'son'
        last_articles= [i for i in Article.objects.select_related(
            ).filter(is_visible=True).order_by(
            'created_date').reverse()]
        for i in last_articles:
            i.type= 'article'
        last_galeries= [i for i in Galery.objects.select_related(
            ).filter(is_visible=True).order_by(
            'created_date').reverse()]
        for i in last_galeries:
            i.type= 'galery'
        # Merge the lists and order them by posted date
        merged_items= last_sons + last_articles + last_galeries
        sorted_items = sorted(
            merged_items, 
            key=operator.attrgetter('created_date'), 
            reverse=True
            )[:12]

        context={
            'content': sorted_items,
            'form': SearchAll(),
        }
        template = loader.get_template('frontpage.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        context= SearchSite(request) # returns context
        template = loader.get_template('search_results.html')
        return HttpResponse(template.render(context, request))

#####################################################################
def ArticleIndex(request):
    '''
        Index of articles.
    '''
    if request.method== 'GET':
        context={
            'articles': Article.objects.filter(is_visible=True),
            'all_tags': Tag.objects.all(),
            'form': SearchAll(),
        }
        template = loader.get_template('article_index.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        context= SearchSite(request) # returns context
        template = loader.get_template('search_results.html')
        return HttpResponse(template.render(context, request))

#####################################################################
def ArticleView(request, article_slug):
    '''
        View a single article.
    '''
    if request.method== 'GET':
        context={
            'article': Article.objects.select_related().get(
                slug= article_slug),
            'form': SearchAll(),
        }
        template = loader.get_template('article_view.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        context= SearchSite(request) # returns context
        template = loader.get_template('search_results.html')
        return HttpResponse(template.render(context, request))

#####################################################################
def GaleryIndex(request):
    '''
        Index of articles.
    '''
    if request.method== 'GET':
        context={
            'galeries': Galery.objects.select_related().filter(
                is_visible=True),
            'form': SearchAll(),
        }
        template = loader.get_template('galery_index.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        context= SearchSite(request) # returns context
        template = loader.get_template('search_results.html')
        return HttpResponse(template.render(context, request))

#####################################################################
def GaleryView(request, galery_pk):
    '''
        View a single galery and its content.
    '''
    if request.method== 'GET':
        context={
            'galery': Galery.objects.select_related().get(pk=galery_pk),
            'form': SearchAll(),
        }
        template = loader.get_template('galery_view.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        context= SearchSite(request) # returns context
        template = loader.get_template('search_results.html')
        return HttpResponse(template.render(context, request))

#####################################################################
def SonsIndex(request):
    '''
        Index of sounds.
    '''
    if request.method== 'GET':
        sons_list= Son.objects.select_related().filter(
            is_visible= True).order_by('created_date').reverse()
        # paginate sons
        sons_paginated= Paginator(sons_list, 12)
        page = request.GET.get('page')
        try:
            sons= sons_paginated.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            sons = sons_paginated.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            sons = sons_paginated.page(paginator.num_pages)
        for son in sons:
            son.colorbox_link= son.colorbox_link()
        context={
            'sons': sons,
            'form': SearchAll(),
        }
        template = loader.get_template('sons_index.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        context= SearchSite(request) # returns context
        template = loader.get_template('search_results.html')
        return HttpResponse(template.render(context, request))

#####################################################################
def SearchByTag(request, tag_searched):
    '''
        Search items from 3 categories by tag. It's safer, simpler
        and infintely faster than plain text search from frontpage so
        I didn't merge the two functionalities.
    '''
    if request.method== 'GET':
        sons= [i for i in Son.objects.filter(
            is_visible=True, 
            tags__pk=tag_searched)]
        for i in sons:
            i.type= 'son'
        articles= [i for i in Article.objects.filter(
            is_visible=True, 
            tags__pk=tag_searched)]
        for i in articles:
            i.type= 'article'

        # Merge the lists and order them by posted date
        merged_items= sons + articles
        sorted_items = sorted(merged_items, key=operator.attrgetter(
            'created_date'), reverse=True)
        context={
            'tag_searched': tag_searched,
            'content': sorted_items,
            'form': SearchAll(),
        }
        template = loader.get_template('search_by_tag.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        context= SearchSite(request) # returns context
        template = loader.get_template('search_results.html')
        return HttpResponse(template.render(context, request))

#####################################################################
def SiteInfo(request):
    '''
        View the website informations and random facts.
    '''
    if request.method== 'GET':
        context={
            'form': SearchAll(),
        }
        template = loader.get_template('site_info.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        context= SearchSite(request) # returns context
        template = loader.get_template('search_results.html')
        return HttpResponse(template.render(context, request))

#####################################################################
def SoundcloudIframe(request, soundcloud_id):
    '''
        Test for embedding soundcloud within colorbox
    '''
    context={
        'soundcloud_id': soundcloud_id,
    }
    template = loader.get_template('soundcloud_iframe.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def YoutubeIframe(request, youtube_id):
    '''
        Test for embedding soundcloud within colorbox
    '''
    context={
        'youtube_id': youtube_id,
    }
    template = loader.get_template('youtube_iframe.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def VimeoIframe(request, vimeo_id):
    '''
        Test for embedding soundcloud within colorbox
    '''
    context={
        'vimeo_id': vimeo_id,
    }
    template = loader.get_template('vimeo_iframe.html')
    return HttpResponse(template.render(context, request))
