from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

#####################################################################
class Article(models.Model):
    '''
        Defines the content of the blog posts.
    '''
    prepopulated_fields= {"slug": ("title",)}

    uid= models.AutoField(primary_key = True , db_index = True)
    slug= models.SlugField()
    title= models.CharField(max_length = 255)
    corpus = models.TextField()
    short_desc= models.CharField(max_length = 78, blank=True, null=True)
    thumbnail= models.ImageField(upload_to='static/sonovsite/article', )
    is_visible= models.BooleanField(default= False)
    tags= models.ManyToManyField('Tag', related_name='tags', blank=True)
    created_date = models.DateTimeField(default=timezone.now)
    modified_date = models.DateTimeField(auto_now=True)
    posted_by= models.ForeignKey(User, related_name= 'article_author')
    # Methods
    def __str__(self):
        return str(self.title)

#####################################################################
class Son(models.Model):
    '''
        Defines the informations about a video displayed on the site.
    '''
    # choice vars 
    video_source_choices=(
        ('youtube', 'youtube'),
        ('soundcloud', 'soundcloud'),
        ('vimeo', 'vimeo'),
        ('other', 'iframe'),
    )
    # attributes
    uid= models.AutoField(primary_key = True , db_index = True)
    title= models.CharField(max_length = 255)
    source_site= models.CharField(max_length = 50, choices= video_source_choices)
    source_id_string= models.CharField(max_length = 100)
    thumbnail= models.ImageField(upload_to='static/sonovsite/son')
    start_video_at= models.CharField(
        max_length = 50, default=0)
    tags= models.ManyToManyField('Tag', related_name='video_tags', blank=True)
    is_visible= models.BooleanField(default=False)
    created_date = models.DateTimeField(default=timezone.now)
    modified_date = models.DateTimeField(auto_now=True)
    short_desc= models.CharField(max_length = 78, blank=True, null=True)
    posted_by= models.ForeignKey(User, related_name= 'son_author')
    # Methods
    def __str__(self):
        return str(self.title)
    def colorbox_link(self):
        if self.source_site== 'soundcloud':
            complete_link= '/soundcloud_iframe/{}'.format(self.source_id_string)
        elif self.source_site== 'youtube':
            complete_link= 'https://www.youtube.com/embed/{}?vq=hd720'.format(self.source_id_string, self.start_video_at)
        elif self.source_site== 'vimeo':
            complete_link= 'https://player.vimeo.com/video/{}'.format(self.source_id_string)
        return complete_link

#####################################################################
class Image(models.Model):
    '''
        Images are a large part of this site. This table keeps track
        of every game image to make their use easy and flexible.
    '''
    uid= models.AutoField(
        primary_key = True , db_index = True)
    title= models.CharField(
        max_length = 255)
    thumbnail= models.ImageField(
    	upload_to='static/sonovsite/image')
    full_img= models.ImageField(
    	upload_to='static/sonovsite/image')
    external_link= models.CharField(
        max_length = 500, blank=True, null=True)
    legend= models.CharField(
        max_length = 500, blank=True, null=True)
    # Methods
    def __str__(self):
        return str(self.title)

#####################################################################
class Tag(models.Model):
    uid= models.AutoField(primary_key = True , db_index = True)
    title= models.CharField(max_length = 100, unique=True)
    # Methods
    def __str__(self):
        return str(self.title)

#####################################################################
class Galery(models.Model):
    uid= models.AutoField(primary_key = True , db_index = True)
    title= models.CharField(max_length = 100)
    slug= models.SlugField()
    thumbnail= models.ImageField(upload_to='static/sonovsite/galery', blank=True, null=True)
    is_visible= models.BooleanField(default=False)
    created_date = models.DateTimeField(default=timezone.now)
    modified_date = models.DateTimeField(auto_now=True)
    content= models.ManyToManyField(
        'Image', related_name= 'galery_content', blank= True)
    posted_by= models.ForeignKey(User, related_name= 'galery_author')
    # Methods
    def __str__(self):
        return str(self.title)