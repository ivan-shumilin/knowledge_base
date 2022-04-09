Статья описывает связь моделей и как получить доступ к связанным моделям
https://ru.hexlet.io/courses/python-django-orm/lessons/relations/theory_unit

bob = User.objects.get(first_name='Bob')
# SELECT "blog_user"."id", ...
# Execution time: 0.000516s [Database: default]
bob.post_set
# <django.db.models.fields.related_descriptors.create_reverse_many_to_one_manager.<locals>.RelatedManager object at 0x7f220fb0d198>
for post in bob.post_set.all():
    print(post.id, post.title)

# SELECT "blog_post"."id", ...

# Execution time: 0.000427s [Database: default]
# => 1 Intro
# => 2 Update