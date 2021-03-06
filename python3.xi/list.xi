. [Best Practices]
. [slise] `срезы`
. [list methods] `методы списка`
. [#Nested List] `вложенные списки` 

list .
. Список в Python – это массив указателей на элементы, размещенные в памяти
Создание списка .
  Через литерал .
  | elements = []
  Через функцию list() .
  | elements = list()
  | elements = list(range(5))  # [0, 1, 2, 3, 4]
  | elements = list("hello")  # ['h', 'e', 'l', 'l', 'o']
  Генераторы списков .
  . Cпособ построения списка с применением выражения к каждому элементу,
    входящему в последовательность.
  | c = [c * 3 for c in 'list']
  | print(c)  # ['lll', 'iii', 'sss', 'ttt']
  . Таким образом мы получили отдельно взятые утроенные буквы слова,
    введённого в кавычки. 
  . Пример генератора списка:  
  | nums = [i for i in range(1, 15)]
  | print(nums)  # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14] 
  . Пример посложнее:
  | c = [c + d for c in 'list' if c != 'i' for d in 'spam' if d != 'a']
  | print(c)  # ['ls', 'lp', 'lm', 'ss', 'sp', 'sm', 'ts', 'tp', 'tm']
  Генерация вложенных списков .
  . [#1] [#Generating nested lists]
Обращение к элементу списка в Python .
  | list = [1, 2, 3, 4]
  | list[0]  # 1
  | list[-1]  # 4 
Добавление в список .
  Добавление в конец списка .
  . |list.append(x)|
  | elements = [1, 2, 3, 'word']
  | elements.append('meow')
  | print(elements)  # [1, 2, 3, 'word', 'meow']
  Добавление в список на указанную позицию .
  . |list.insert(i, x)|
  | elements = [1, 2, 3]
  | elements.insert(2, 'x')
  | print(elements)  # [1, 2, 'x', 3]
Изменение элементов списка .
. Нужно выбрать элемент по индексу и присвоить новое значение.
| elements = [1, 2, 3]
| elements[2] = 'x'  
| print(elements)  # [1, 2, 'x']
Удаление элемента из списка №1 (по индексу) .
. |del list[i]|
| elements = [1, "test", 5, 7]
| del elements[1]
| print(elements)  # [1, 5, 7]
. Удалять можно как из текущего списка, так и из вложенных списков:
| my_list = ["hello", "world", "!"]
| elements = [1, my_list, "ok"]
| del elements[1][2]  
| print(elements)  # [1, ['hello', 'world'], 'ok']
. Можно удалять целыми диапазонами:
| elements = [2, 4, 6, 8, 12]
| del elements[2:]  # удаляем все элементы после 2-го элемента (включительно)
| print(elements)  # [2, 4]
 
| elements = [2, 4, 6, 8, 12]
| del elements[:3]  # удаляем все элементы до 3-го элемента
| print(elements)  # [8, 12]
 
| elements = [2, 4, 6, 8, 12]
| del elements[1:3]  # удаляем от 1-го элемента включительно до 3-го элемента
| print(elements)  # [2, 8, 12]
Удаление элемента из списка №2 (по контенту) .
. |list.remove(x)|
| elements = [2, "test", 4]
| elements.remove("test")
| print(elements)  # [2, 4]
Проверить наличие элемента в списке .
. |in|
| elements = ['слон', 'кот', 'лошадь', 'змея', 'рыба']
| if 'кот' in elements:
|     print('meow')  # meow
Объединение списков .
  Оператор |+| .
  | a = [5, 5, 5]
  | b = [9, 9, 9, 9]
  | print(a + b)  # [5, 5, 5, 9, 9, 9, 9]
  Метод |extend| .
  |extend|
  | hello = ["h", "e", "l", "l", "o"]
  | world = ["w", "o", "r", "l", "d"]
  | hello.extend(world)  # extends не возвращает новый список, а дополняет текущий
  | print(hello)  # ['h', 'e', 'l', 'l', 'o', 'w', 'o', 'r', 'l', 'd']
Копирование списка Python .
  Оператор |=| .
  . Если вы захотите скопировать список оператором |=| , 
    вы скопируете не сам список, а только его ссылку.
    | a = [1, 2, 3]
    | b = a  # переменно b присваивается не значение списка a, а его адрес
    | print(id(a), id(b)) #  56466376 56466376  # a и b ссылаются на один и тот же список
     
    | b.append(4)
    | print(a, b)  # [1, 2, 3, 4] [1, 2, 3, 4]
  list.copy() – встроенный метод copy (доступен с Python 3.3) .
  . |list.copy()|
  | a = ["кот", "слон", "змея"]
  | b = a.copy()
  | print(id(a), id(b), a, b)  # 56467336 56467016 
  |                            # ['кот', 'слон', 'змея'] ['кот', 'слон', 'змея']
  list(elements) – через встроенную функцию list() .
  . |list(list)|
  | d = list(a)
  | print(id(a), id(d), a, d)  # 56467336 60493768 
  |                            # ['кот', 'слон', 'змея'] ['кот', 'слон', 'змея']
  copy.copy(list) – функция copy() из пакета copy .
  . |copy.copy(list)|
  . Важно: copy.copy(a) делает поверхностное копирование. Объекты внутри списка 
    будут скопированы как ссылки на них (как в случае с оператором = ). 
    Если необходимо рекурсивно копировать всех элементов в списке, 
    используйте copy.deepcopy(a)
  | import copy
  | b = copy.copy(a)  # 
  | print(id(a), id(e), a, b)  # 56467336 60491304 
  |                            # ['кот', 'слон', 'змея'] ['кот', 'слон', 'змея']
  . |copy.deepcopy(a)|
  | import copy
  | f = copy.deepcopy(a) 
  | print(id(a), id(f), a, f)  # 56467336 56467400 
  |                            # ['кот', 'слон', 'змея'] ['кот', 'слон', 'змея']
  list[:] – через создание среза [slise] (устаревший синтаксис) .
  . |list[:]|
  | c = a[:]  # устаревший синтаксис
  | print(id(a), id(c), a, c)  # 56467336 60458408 
  |                            # ['кот', 'слон', 'змея'] ['кот', 'слон', 'змея']
    Варианты использования: .
    | a = ["кот", "слон", "змея"]
    . C 2-го элемента (включительно) до конца списка 
    | b = a[2:]
    | print(b)  # ['змея']
    . C начала списка по 2-й элемент
    | c = a[:2]  #  с начала списка по 2-й элемент
    | print(c)  # ['кот', 'слон']
    . C 1-го элемента (включительно) по 2-й элемент
    | d = a[1:2] 
    | print(d)  # ['слон']
    . c 0-го элемента по 8-й элемент с шагом 2
    | a = [1, 2, 3, 4, 5, 6, 7, 8]
    | e = a[0:8:2] 
    | print(e)  # [1, 3, 5, 7]
Цикл for по списку .
. |for|
| list = [1, 2, 3, "meow"]
| for el in list:
|     pint(el)  
Вложенные списки [Nested List#] .
. Список может содержать объекты разных типов: числовые, буквенные, 
  а также списки. Список списков выглядит следующим образом:
 | elements = [1, 2, [0.1, 0.2, 0.3]]
. Для обращения к элементу вложенного списка нужно использовать 
  два индекса: первый указывает на индекс главного списка, 
  второй — индекс элемента во вложенном списке. Вот пример:
 | elements = [["яблоки", 50], ["апельсины", 190], ["груши", 100]]
 | print(elements[0])  # ['яблоки', 50]
 | print(elements[1][0])  # апельсины  
Генерация вложенных списков [#1] [Generating nested lists#] .
. Cоздание двумерной матрицы с размерностью 
  3×3 при помощи генератора двумерного списка.
  Переменные i и j пошагово увеличиваются в циклах на единицу и 
  перемножаются между собой.
 | data = [[i * j for i in range(0, 3)] for j in range(0, 3)]
 | print(data)  # [[0, 0, 0], [0, 1, 2], [0, 2, 4]]
. Достаточно часто при создании вложенного списка Python используется генератор
  матрицы нулей. В качестве примера создадим матрице 3×2: 
  | data = [[0 for x in range(2)] for y in range(3)]
  | print(data)  # [[0, 0], [0, 0], [0, 0]]
Генератор списка с lambda .
  | data = [(lambda i: i*i)(i) for i in range(0, 10)]
  | print(data)  # [0, 1, 4, 9, 16, 25, 36, 49, 64, 81]



[https://pythonchik.ru/osnovy/spiski-v-python] - источник
[https://all-python.ru/osnovy/generator-spiska.html] [1#] генерация вложенных списков  



