from django.http import HttpResponse, HttpResponseRedirect
from django.template import loader
from .models import *
import operator #for sorting objects from different tables in one aggregated list
from .forms import SearchAll
from django.shortcuts import render_to_response
from django.template import RequestContext

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
            'created_date').reverse()][:5]
        for i in last_sons:
            i.type= 'son'
        last_articles= [i for i in Article.objects.select_related(
            ).filter(is_visible=True).order_by(
            'created_date').reverse()][:5]
        for i in last_articles:
            i.type= 'article'
        last_galeries= [i for i in Galery.objects.select_related(
            ).filter(is_visible=True).order_by(
            'created_date').reverse()][:5]
        for i in last_galeries:
            i.type= 'galery'
        # Merge the lists and order them by posted date
        merged_items= last_sons + last_articles + last_galeries
        sorted_items = sorted(
            merged_items, 
            key=operator.attrgetter('created_date'), 
            reverse=True
            )

        context={
            'content': sorted_items,
            'form': SearchAll(),
        }
        template = loader.get_template('frontpage.html')
        return HttpResponse(template.render(context, request))
    else: # if request.method== 'POST'
        form= SearchAll(request.POST)
        if form.is_valid():
            # Get the search_terms in a variable with a simple name
            search_terms= form.cleaned_data['entry']
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
                'entry': search_terms,
                'content': matchings_posts,
                'search_visible': True,
            }
            template = loader.get_template('search_results.html')
            return HttpResponse(template.render(context, request))
        else:
            return HttpResponseRedirect('/')

#####################################################################
def ArticleIndex(request):
    '''
        Index of articles.
    '''
    context={
        'articles': Article.objects.filter(is_visible=True),
        'all_tags': Tag.objects.all(),
        'form': SearchAll(),
    }
    template = loader.get_template('article_index.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def ArticleView(request, article_slug):
    '''
        View a single article.
    '''
    context={
        'article': Article.objects.select_related().get(
            slug= article_slug),
        'form': SearchAll(),
    }
    template = loader.get_template('article_view.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def GaleryIndex(request):
    '''
        Index of articles.
    '''
    context={
        'galeries': Galery.objects.select_related().filter(
            is_visible=True),
        'form': SearchAll(),
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
        'form': SearchAll(),
    }
    template = loader.get_template('galery_view.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def SonsIndex(request):
    '''
        Index of sounds.
    '''
    sons= Son.objects.select_related().filter(
        is_visible= True).order_by('created_date').reverse()
    for son in sons:
        son.colorbox_link= son.colorbox_link()
    context={
        'sons': sons,
        'form': SearchAll(),
    }
    template = loader.get_template('sons_index.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def SearchByTag(request, tag_searched):
    '''
        Search items from 3 categories by tag. It's safer, simpler
        and infintely faster than plain text search from frontpage so
        I didn't merge the two functionalities.
    '''
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

    # WIP
    # galeries= [i for i in Galery.objects.select_related().filter(is_visible=True, tags__in=tag_searched).order_by('created_date').reverse()]
    # for i in galeries:
    #     i.type= 'galery'

    # Merge the lists and order them by posted date
    merged_items= sons + articles
    sorted_items = sorted(merged_items, key=operator.attrgetter(
        'created_date'), reverse=True)
    context={
        'tag_searched': tag_searched,
        'content': sorted_items,
        'form': SearchAll(),
        # 'galeries': galeries,
    }
    template = loader.get_template('search_by_tag.html')
    return HttpResponse(template.render(context, request))

#####################################################################
def SiteInfo(request):
    '''
        View the website informations and random facts.
    '''
    context={
        'form': SearchAll(),
    }
    template = loader.get_template('site_info.html')
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