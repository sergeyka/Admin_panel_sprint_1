from .base import *

DEBUG = True

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'movies',
        'USER': 'movies',
        'PASSWORD': 'movies',
        'HOST': '127.0.0.1',
        'PORT': '5432',
        # uncomment to use schema "content"
        # 'OPTIONS': {
        #     'options': '-c search_path=content'
        # }
    }

}
