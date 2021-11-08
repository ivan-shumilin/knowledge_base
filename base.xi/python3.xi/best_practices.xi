Best Practices .

Как получить список в обратном порядке .
. Изменить порядок размещения элементов в списке помогает функция |list.reverse()|:
| elements = [1, 2, 3, 4, 5, 6]
| elements.reverse()
| print(elements)  # [6, 5, 4, 3, 2, 1]
Как перевести список в другой формат? .
. Иногда требуется перевести список в строку, в словарь или в JSON. 
  Для этого нужно будет вывести список без скобок.
  Перевод списка в строку осуществляется с помощью функции |join()|.
  В данном случае в качестве разделителя используется запятая.
  На примере это выглядит так:
| fruits = ["яблоко", "груша", "ананас"]
| print(', '.join(fruits))  # яблоко, груша, ананас
. Словарь в Python – это такая же встроенная структура данных, 
  наряду со списком. Преобразование списка в словарь — задача тоже несложная.
  Для этого потребуется воспользоваться функцией dict() . Вот пример преобразования:
| elements = [['1', 'a'],['2', 'b'],['3', 'c']]
| my_dict = dict(elements)
| print(my_dict)  # {'1': 'a', '2': 'b', '3': 'c'}
. JSON – это JavaScript Object Notation. В Python находится встроенный модуль json 
  для кодирования и декодирования данных JSON. С применением метода |json.dumps(x)|
  можно запросто преобразовать список в строку JSON.
| import json
| json.dumps(['word', 'eye', 'ear'])
  '["word", "eye", "ear"]'

Как узнать индекс элемента в списке? .
. Узнать позицию элемента в последовательности списка бывает необходимым, когда
  элементов много, вручную их не сосчитать, и нужно обращение по индексу. 
  Для того чтобы узнать индекс элемента, используют функцию |list.index(x)|
| elements = [1, 3, 6, 9, 55]
| print(elements.index(9))  # 3
. В качестве аргумента передаем значение, а на выходе получаем его индекс.
Как посчитать количество уникальных элементов в списке? .
. Самый простой способ – приведение списка к set (множеству). После этого 
  останутся только уникальные элементы, которые мы посчитаем функцией |len()|:
| words = ["one", "two", "one", "three", "one"]
| len(set(words))  # 3
Как проверить список на пустоту? .
| a = []
| if not a:
|   print("список пуст!")  # список пуст!
Как создать список числовых элементов с шагом .
. Создание списка числовых элементов с шагом может понадобиться не так и часто,
  но мы рассмотрим пример построения такого списка.
. Шагом называется переход от одного элемента к другому. Если шаг отрицательный,
  произойдёт реверс массива, то есть отсчёт пойдёт справа налево.
  Вариант #1 .
    Вот так выглядит список с шагом.
  | elements = [1, 2, 3, 4, 5, 8, 9, 10, 11, 14, 20]
  | print(elements[0:11:2])  # [1, 3, 5, 9, 11, 20]
  Вариант #2 .
  . Еще один вариант –  воспользоваться генератором списков:
  | elements = [c for c in range(0, 10, 2)]  # от 0 (включительно) до 10 с шагом 2
  | print(elements)  # [0, 2, 4, 6, 8]