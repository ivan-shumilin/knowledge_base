Шпаргалка
https://www.reg.ru/blog/shpargalka-po-python-dlya-django/
Документация по фильтрам .
https://docs.djangoproject.com/en/3.2/ref/templates/language/#filters
Тег if .
https://docs.djangoproject.com/en/3.2/ref/templates/builtins/#if
Тег for .
https://docs.djangoproject.com/en/3.2/ref/templates/builtins/#for
Тег url .
https://docs.djangoproject.com/en/3.2/ref/templates/builtins/#url
Тег extends .
https://docs.djangoproject.com/en/3.2/ref/templates/builtins/#extends
Тег includse .
https://docs.djangoproject.com/en/3.2/ref/templates/builtins/#include
Тег load .
https://docs.djangoproject.com/en/3.2/ref/templates/builtins/#load
БД [base_date.xi].
Метод .all() .
Метод .get() .
. только для одной записи
Метод filter() .
  __gt больше .
  | Movie.objects.filter(budget__gt=1000000)
  __lt меньше .
  | Movie.objects.filter(budget__gt=1000000)
  __isnull .
  | Movie.objects.filter(budget__isnull=True)
  AND .
  | Movie.objects.filter(budget__isnull=False, name='Avatar')

Метод exclude .
  . Исключение, не равно 
  Movie.objects.exclude(budget=1000000)

  


https://django.fun/docs/django/ru/3.2/ref/models/querysets/


. Перечень команд
| django-admin
. Создаем новый проект c  именем  memory
|  django-admin startproject memory
. Создаем новое приложение color
| python3 manage.py startapp horoscope

Добавление новой страницы .
. в horoscope.urls
from django.urls import path
from horoscope import views

urlpatterns = [
    path('e/', views.get_elements),
]
. в views.py
def get_elements(request):
    return HttpResponse('Элементы')

/ - в конце роута, без него не работает. как избавиться?

templates .
. Чтобы создать шаблон нужно:
* создать папку(`templates`) в дериктороии приложения( название приложения horoscope),
  в этой дериктороии создать дериктороию с названим приложения,
  и создать name_file.html
  пример: horoscope/templates/horoscope/info_zodiac.html
* зарегистрировать приложение в `settings.py`
| INSTALLED_APPS = [
|     'django.contrib.admin',
|     'django.contrib.auth',
|     'django.contrib.contenttypes',
|     'django.contrib.sessions',
|     'django.contrib.messages',
|     'django.contrib.staticfiles',
|     'horoscope',
| ]
* поставить флаг `True` settings/TEMPLATES
| 'APP_DIRS': True,
* во `views.py` 
| from django.template.loader import render_to_string
|
| def info_about_sing_zodiac(request, url:str):
|     response = render_to_string('horoscope/info_zodiac.html')
|     return HttpResponse(response)  
. Пишит сообщение, если пустая коллекция |for … empty| .
| <ul>
| {% for athlete in athlete_list %}
|     <li>{{ athlete.name }}</li>
| {% empty %}
|     <li>Sorry, no athletes in this list.</li>
| {% endfor %}
| </ul>

Добавление css .
  В index.html .
  | {% load static %}
  | {% block cssadd %}
  | <link rel="stylesheet" href="{% static 'horoscope/css/index.css' %}">
  | {% endblock %}
  В base.html .
  | <head>
  |   <meta charset="UTF-8">
  |   <title>{% block title %} {% endblock %}</title>
  |   {% block cssadd %}{% endblock %}
  | </head>
  В дериктороии приложения создать струкруру .
  | horoscope/static/horoscope/css/index.css
  |                           /js
  |                           /img
Добавление css глобально .
* В корне прокта создаем структуру:
| static/css/base.css
* В base.html в <html> добавляем:
| <link rel="stylesheet" href="{% static 'css/base.css' %}">
* В ProjectCity2/settings.py  добавляем:
| STATICFILES_DIRS = [
|     BASE_DIR /  'static'
| ]
Создаем свой фильтр .
* создаем структуру 
| templatetags/
| ├── __init__.py
| ├── my_filter.py
* в фаил my_filter 
| from django import template
|  
| register = template.Library()
| #  Навешиваем декоратор 
| @register.filter(name='split')
| def split(value, key=' '):
|     return value.split(key)
* в фаил info_zodiac 
| {% load my_filter %}  #название файла с фильтрами





