Курс .
. https://www.youtube.com/watch?v=i-uvtDKeFgE
CRUD - создание, чтение, обравление, удаление.
  Методы save(), create() и update() класса Serializer .
  . https://www.youtube.com/watch?v=tW7Bg5zMyKI
  Класс ModelSerializer и представление ListCreateAPIView .
  . https://www.youtube.com/watch?v=-7NbLKn5L9w&list=TLPQMjMwMzIwMjLMDtBtJ6RmWg&index=2
    Документация официальная .
    . https://www.django-rest-framework.org/api-guide/generic-views/
  Представления UpdateAPIView и RetrieveUpdateDestroyAPIView .
  . https://www.youtube.com/watch?v=m7asgk5F0u8
    Рендеры .
    . https://www.django-rest-framework.org/api-guide/renderers/
    | REST_FRAMEWORK = {
    |     'DEFAULT_RENDERER_CLASSES': [
    |         'rest_framework.renderers.JSONRenderer',
    |         'rest_framework.renderers.BrowsableAPIRenderer', # отключить отображение в браузере
    |     ],
    |     'DEFAULT_PARSER_CLASSES': [
    |         'rest_framework.parsers.JSONParser',
    |     ],
    |    }
Аутентификация и авторизация .
  Аутентификация на основе сессий и cookies .
  . https://www.youtube.com/watch?v=8fKmAMLQGN8
    Документация официальная .
    . https://www.django-rest-framework.org...
    Djoser .
    . https://djoser.readthedocs.io/en/latest/
  Аутентификация по токенам. Пакет Djoser .
  . https://www.youtube.com/watch?v=8_wR-PIsS2c

  
