# publish_posts.py

from sonovsite.models import Son, Article, Galery
from django.utils import timezone

###############################################################################
def publish_posts():
    '''
    This script scans every post of sonovsite (son, article, galery) and checks 
    two values: created_date and is_visible.
    If present time is more recent than created_date, is_visible becomes true.
    '''
    present = timezone.now()
    # for sons
    sons= [i for i in Son.objects.all()]
    for son in sons:
        if present > son.created_date:
            son.is_visible= True
            son.save()
        else:
            pass
    # for articles
    articles= [i for i in Article.objects.all()]
    for article in articles:
        if present > article.created_date:
            article.is_visible= True
            article.save()
        else:
            pass
    # for galeries
    galeries= [i for i in Galery.objects.all()]
    for galery in galeries:
        if present > galery.created_date:
            galery.is_visible= True
            galery.save()
        else:
            pass
    return True

###############################################################################
###############################################################################
publish_posts()
