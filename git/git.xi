. Pro Git - manual [https://git-scm.com/book/ru/v2]
Видео в котором показано все что нужно делать в git .
. https://www.youtube.com/watch?v=_AOr2RqvYB4 

Установка .
. Установка git Ubuntu.
| $ sudo apt update # на всякий случай смотрим новые версии
| $ sudo apt install git-all

Создаем новый проект .
| mkdir hexlet-git
| cd hexlet-git
.Выполняем инициализацию
| hexlet-git$ git init
| Initialized empty Git repository in /private/tmp/hexlet-git/.git/
Создание нового проекта .
1. создать на сайте new repository [https://github.com/ivan-shumilin]
2. склонировать его локально 
| git clone git@github.com:ivan-shumilin/name_project.git
3. задать |name| and |email|
| git config --global user.emil "shumilin.i.v@gmail.com"
| git config --global user.name "ivan-shumiln"

Полезное .
  Сокр. вывод git status .
  | git status -s 
  Добавить все файлы(новые, измененые) .
   | git add .


