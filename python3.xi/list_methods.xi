Методы списков .
. |list.append(x)|[#1] – позволяет добавлять элемент в конец списка;
. |list1.extend(list2)|[#2] – предназначен для сложения списков;
. |list.insert(i, x)|[#3] – служит для добавления элемента на указанную позицию( i – позиция, x – элемент);
. |list.remove(x)|[#4] – удаляет элемент из списка (только первое вхождение);
. |list.clear()|[#5] – предназначен для удаления всех элементов (после этой операции список становится пустым []);
. |list.copy()|[#6] – служит для копирования списков.
. |list.count(x)|[#7] – посчитает количество элементов x в списке;
. |list.index(x)|[#8] – вернет позицию первого найденного элемента x в списке;
. |list.pop(i)|[#9] - удалит элемент из позиции i ;
. |list.reverse()|[#10] – меняет порядок элементов в списке на противоположный;
. |list.sort()|[#11] – сортирует список;
. |.join| - из list  в string


Пример использования методов:

  append [1#] .
  | a = [1, 2, 3]
  | a.append(4)
  | print(a)  # [1, 2, 3, 4]
  extend [2#] .
  | elements = [1, 2, 3, "meow"]
  | elements.extend([4, 5, "gaf"])
  | print(elements)  # [1, 2, 3, 'meow', 4, 5, 'gaf']
  insert [3#] .
  | a = [1, 3, 4]
  | a.insert(1, 2)
  | print(a)  # [1, 2, 3, 4]
  remove [4#] .
  | elements = [1, "meow", 3, "meow"]
  | elements.remove("meow")
  | print(elements)  # [1, 3, 'meow']  # remove удаляет только первое вхождение
  clear [5#] .
  | a = [1, 2, 3]
  | a.clear()
  | print(a)  # []
  copy [6#] .
  | a = [1, 2, 3]
  | b = a.copy()
  | print(id(a), id(b), a, b)  # 60458408 60491880 
  |                            # [1, 2, 3] [1, 2, 3]
  count [7#] .
  | elements = ["one", "two", "three", "one", "two", "one"]
  | print(elements.count("one"))  # 3
  index [8#] .
  | elements = ["one", "two", "three", "one", "two", "one"]
  | print(elements.index("three"))  # 2
  pop [9#] .
  | elements = [1, "meow", 3, "meow"]
  | elements.pop(1)  # удаляем элемент с индексом 1
    'meow'  # pop возвращает удаленный элемент списка
  | print(elements)  # [1, 3, 'meow']
  | elements.pop()  # удаляем первый элемент списка
    'meow'
  | print(elements)  # [1, 3]
  | elements.pop(-1)  # 3  # удаляем последний элемент списка  
  | print(elements)  # [1]
  reverse [10#] .
  | a = [1, 2, 3]
  | a.reverse()
  | print(a)  # [3, 2, 1]
  sort [11#] .
    sort (по возрастанию)  .
    | elements = [3, 19, 0, 3, 102, 3, 1]
    | elements.sort()
    | print(elements)  # [0, 1, 3, 3, 3, 19, 102]
    sort (по убыванию) .
    | elements = [3, 19, 0, 3, 102, 3, 1]
    | elements.sort(reverse = True)
    | print(elements)  # [102, 19, 3, 3, 3, 1, 0]
  join [12#] .
  | myList = ['str1', 'str2', 'str3']
  | myString = ''.join(myList) # '' - разделитель между 
  |                                    элементами списка соответственно
  | >>> str1str2str3
  | myString = '_'.join(myList)
  | >>> str1_str2_str3  