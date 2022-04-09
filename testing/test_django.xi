https://the-bosha.ru/2016/06/29/django-delaem-damp-bazy-dannykh-i-vosstanavlivaem-iz-nego-s-dumpdata-i-loaddata/
Создание fixture для тестирования .
. python3 manage.py dumpdata horoscope_app > db.json
Видео по тестированию апи и сериализатора, coverage .
. https://www.youtube.com/watch?v=FquXN0t_KbU
Coverage .
. Покрытие тестов 
| coverage run --source='.' ./manage.py test . 
| coverage report
| coverage html # отображает в html




