База данных .
  https://docs.djangoproject.com/en/4.0/ref/databases/
  https://django.fun/docs/django/ru/3.2/ref/models/querysets/
  Связь моделей .
  https://djbook.ru/rel3.0/topics/db/models.html#relationships

СУБД .
  SQL .
    . реляционные `relational`
    . SQL (structured query language — «язык структурированных запросов») — 
      декларативный язык программирования, применяемый для создания, модификации
      и управления данными в реляционной базе данных, управляемой соответствующей 
      системой управления базами данных.
    SQLite .
    ORM .
    . ORM (англ. Object-Relational Mapping, рус. объектно-реляционное отображение,
      или преобразование) — технология программирования, которая связывает
      базы данных с концепциями объектно-ориентированных языков программирования, 
      создавая «виртуальную объектную базу данных». Существуют как проприетарные, 
      так и свободные реализации этой технологии.
      Таблица - класс
      Запись в таблице - экземпляры класса 
  NoSQL .

Миграция in Django .
python3 manage.py makemigrations создание миграции
python3 manage.py migrate мигрирование 
python3 manage.py shell запуск терминала

Делаем shell  лучше .
. установить пакет django-extensions
. добавить
INSTALLED_APPS = (
    ...
    'django_extensions',
)
python3 manage.py shell_plus --print-sql
печатает sql-запрос

save() .
. https://docs.djangoproject.com/en/4.0/ref/models/instances/#django.db.models.Model.save
. метод чтобы сохранить объект обратно в базу данных
create() .
. чтобы создать и сохранить объект за один шаг, используйте `create()` метод.

INSERT .
Добавление данных в таблицу .
from movie_app.models import Movie
a = Movie(name='Matrix', rating=85)
a.save()
Второй способ .
Movie(name='XXX', rating=70).save()
SELECT .
. в models добавляем магический метод __str__
| class Movie(models.Model):
|     name = models.CharField(max_length=40)
|     rating = models.IntegerField()
|  
|     def __str__(self):
|         return f'{self.name} - {self.rating}%'
. SELECT in shell_plus
| In [15]: from movie_app.models import Movie
|  
| In [16]: Movie.objects.all()
| Out[16]: SELECT "movie_app_movie"."id",
|        "movie_app_movie"."name",
|        "movie_app_movie"."rating"
|   FROM "movie_app_movie"
|  LIMIT 21
|  
| Execution time: 0.000180s [Database: default]
| <QuerySet [<Movie: Matrix - 85%>, <Movie: Avatar - 80%>, <Movie: XXX - 70%>, <Movie: XXX 2 - 70%>]>
|  
| In [17]: a = Movie.objects.all()[1]
| SELECT "movie_app_movie"."id",
|        "movie_app_movie"."name",
|        "movie_app_movie"."rating"
|   FROM "movie_app_movie"
|  LIMIT 1
| OFFSET 1
|  
| Execution time: 0.000211s [Database: default]
|  
| In [18]: a.name
| Out[18]: 'Avatar'
|  
| In [19]: a.rating
| Out[19]: 80
. к отрицательному индексу обращаться нельзя
UPDATE .
| In [4]: a.name
| Out[4]: 'XXX 3'
|  
| In [5]: a.name = 'XXX 2'
|  
| In [6]: a.save()
| UPDATE "movie_app_movie"
|    SET "name" = 'XXX 2',
|        "rating" = 70,
|        "year" = NULL,
|        "budget" = 1000000
|  WHERE "movie_app_movie"."id" = 
DELETE .
| In [7]: a
| Out[7]: <Movie: XXX 2 - 70%>
| In [8]: a.delete()
| DELETE
|   FROM "movie_app_movie"
|  WHERE "movie_app_movie"."id" IN (4)
QuerySet .
. https://django.fun/docs/django/ru/3.2/ref/models/querysets/
  GET .
  . В чем отличие get() and filter() ?
  |  In [1]: Zodiak_sing.objects.get(id=1)
  |  SELECT "horoscope_zodiak_sing"."id",
  |         "horoscope_zodiak_sing"."name",
  |         "horoscope_zodiak_sing"."code",
  |         "horoscope_zodiak_sing"."description"
  |    FROM "horoscope_zodiak_sing"
  |   WHERE "horoscope_zodiak_sing"."id" = 1
  |   LIMIT 21
  |  
  |  Execution time: 0.000666s [Database: default]
  |  Out[1]: <Zodiak_sing: aries - Овен - первый знак зодиака, планета
  |  Марс (с 21 марта по 20 апреля).>
  . нельзя обращаться к несоответствующей колнке, строке
  . условие вернет один объект 
  FILTER .
Подготовить ответы на эти вопросы .
db_index - почитать в документации поиск по индексу. все ради скорости
MTV and MVC - спрашивают на собеседовании!

TextField() vs CharField()
декларативный язык программирования +
реляционные БД +
Как переименовать название модели в django ORM
Zodiak_sing ForeignKey (many to one) element
Zodiak_sing one_to_one calendar
https://djbook.ru/rel3.0/topics/db/models.html#relationships
ForeignKey(<ссылка на перичную модель>, on_delete <ограничения при удалении>)

ZodiakSing.objects.filter(date_from__day='21')
есть дата 10.10.2000 = date



filter(date >= date_from and date <= date_to)

ZodiakSing.objects.get(
    Q(date_from__day__gte=date__day) & Q(date_from__month__gte=date__month),
    Q(date_from__day__gte=date__day) & Q(date_from__month__gte=date__month)
)

2000-01-21	2000-02-19 date_from
2000-02-20	2000-03-20 date_to

02 27  date_from__month >= 2 and data_from__day <= 27
02 10



if ZodiakSing.objects.filter(Q(date_from__day__gte=15) & Q(date_from__month=5)):
    print(ZodiakSing.objects.filter(Q(date_from__day__gte=15) & Q(date_from__month=5)))
else:
    print(ZodiakSing.objects.filter(Q(date_from__day__gte=15) & Q(date_from__month=(5+1))))
0. сделать push
1. настроить gitigor
2. разобраться с бутстрап
3. посмотреть на хекслете что мы прикручивали к поекту
4. проверить нейминг




