[https://python-poetry.org/] официальная страница
. Настройте poetry так, чтобы тот создавал виртуальные окружения в директории
  проекта (выполните команду poetry config virtualenvs.in-project true).
. Может так случиться, что у вас возникнут проблемы с запуском poetry.
  Это может быть связано с тем, что на вашей ОС недоступна команда python
  ("/usr/bin/env: ‘python’: No such file or directory"). Если вы тоже столкнётесь 
  с данной проблемой, то почитайте эту статью:
  [https://ru.hexlet.io/blog/posts/ispolzovanie-neskolkih-versiy-python-na-unix-podobnyh-operatsionnyh-sistemah]
. Инициализация python-пакета внутри корневой директории проекта, используя команду
| poetry init.
  При инициализации задайте имя пакета - hexlet-code. 
  Остальную информацию можно не указывать. 
  В итоге в директории проекта должен появиться файл pyproject.toml — ключевой файл проекта.
  Пример инициализации пакета с помощью poetry.  
  [ttps://asciinema.org/a/yk0Sljz3EYPJeX453IhIOBzik]
. Так как название пакета и имя директории с исходным кодом не совпадают,
  нужно подсказать poetry, где находится код пакета. Для этого в pyproject.toml
  в секцию [tool.poetry] допишите следующий код:
| packages = [
|   { include = "brain_games" },
| ]  
. Добавьте в pyproject.toml строчки:
| [tool.poetry.scripts]
| brain-games = "brain_games.scripts.brain_games:main"
  Так описываются скрипты, для вызова которых при установке пакета пользователем
  создадутся исполняемые файлы. Они в свою очередь позволят запускать программы
  пакета с помощью простых команд.
. |poetry| создаст виртуальное окружение и установит пакет в него  
| poetry install   
. для использования пакетов и модулей нужно добавиять их в poetry
| poetry add prompt
. Удаление зависимостей
| poetry remove ИМЯ
| poetry remove --dev ИМЯ
Poetry и управление зависимостями .
. https://ru.hexlet.io/courses/python-setup-environment/lessons/poetry-and-dependencies/theory_unit



Публикация .
. Код, лежащий на гитхабе – это уже хорошо, но ещё недостаточно для того,
  чтобы другие могли им воспользоваться. Одной из функций poetry является публикация
  (обновление) пакетов в каталоге PyPI. PyPI (Python Package Index)
  – это большой каталог (принято говорить "индекс") пакетов для Python.
  Каждый раз, когда вы набираете |pip install <package>|, то по умолчанию
  установка производится именно из этого каталога.
  
  Для отладки публикации мы будем использовать аргумент |--dry-run|,
  чтобы не добавлять пакет в каталог PyPI.
  
  На протяжении всего проекта используйте команду |poetry build|,
  чтобы собрать пакет и убедиться, что вы его правильно настроили.
  
  Для установки пакета из операционной системы, используйте команду
  |python3 -m pip install --user dist/*.whl|. Её необходимо запускать
  из корневой директории проекта.
  build .
  | poetry build
  publish .
  | poetry publish --dry-run	
  package-install .
  | python3.7 -m pip install --user dist/*.whl
