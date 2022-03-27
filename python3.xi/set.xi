Links .
  Source .
  . https://ru.hexlet.io/courses/python-dicts/lessons/sets/theory_unit
  Video .
  . https://youtu.be/KMGRXDxUw18 
  Task .
    Подсчитать количество уникальных слов .
    . [number of unique words]
Множества [set] .
. Это неупорядоченные последовательности элементов,
  каждый из которых в множестве представлен ровно один раз.
  Создание множеств и манипуляция над ними .
  . Множество можно создать с помощью соответствующего литерала:
  | >>> s = {1, 2, 3, 2, 1}
  | >>> s
  | {1, 2, 3}
  | >>> type(s)
  | <class 'set'>
  . Литералы множеств записываются с применением фигурных скобок, как и литералы
    словарей. Однако внутри скобок через запятую перечисляются только "ключи"
    — элементы множества. Т.к. литерал |{}| уже занят словарями, пустое множество
    создаётся вызовом функции |set| без аргументов:
  | >>> set()
  | {}
  | >>> type(set())
  | <class 'set'>
  . Эту же функцию можно использовать, чтобы создать множество из элементов
    произвольного `iterable` или `iterator`:
  | >>> set('abracadabra')
  | {'c', 'd', 'a', 'r', 'b'}
  | >>> set([1, 2, 3, 2, 1])
  | {1, 2, 3}
  . Заметьте, что в множестве каждый уникальный элемент представлен ровно один раз,
    даже если в коллекции-источнике были повторы!
  Проверка на вхождение .
  . Чтобы проверить, является ли некое значение элементом множества — или, как ещё
    говорят, "входит в множество", "принадлежит множеству"
    — нужно использовать оператор |in|:
  | >>> 42 in set()
  | False
  | >>> 42 in set([42])
  | True
  | >>> 'a' in set('abracadabra')
  | True
  . Проверка на вхождение в множество выполняется очень `быстро`, гораздо быстрее,
    чем проверка на вхождение в строку, кортеж или список! Так же быстро работает
    поиск ключа в словаре — и словарь и множество используют один механизм хранения
    и поиска ключей. И если на небольших коллекциях это не так заметно, то уже при
    наличии пары десятков элементов и в условиях, когда проверка на вхождение
     делается часто, разница может быть колоссальной.
Изменение множеств .
  Изменение состава элементов множества .
  . Множества в Python — `изменяемые`. Добавлять и удалять элементы из множества 
    можно с помощью методов |add|, |discard| и |remove|:
  | >>> s = set()
  | >>> s.add(1)
  | >>> s.add(2)
  | >>> s.add(2)
  | >>> s
  | {1, 2}
  | >>> s.discard(1)
  | >>> s
  | {2}
  | >>> s.discard(1)
  | >>> s
  | {2}
  | >>> s.remove(1)
  | ...
  | KeyError: 1
  . При чтении кода в этом примере вы должны были заметить, что добавление 
    лишних элементов с помощью |add| и отбрасывание несуществующих с помощью 
    |discard| не приводят к ошибке. Такие вот множества терпеливые! Однако 
    вызов метода |remove| с несуществующим элементом приводит к ошибке.
  Копирование и очистка множеств .
  . Так как множества `изменяемы`, часто возникает необходимость сделать 
    копию перед изменением оригинала. Т.к. множества как и словари не 
    поддерживают операцию получения среза, для копирования приходится 
    использовать метод |copy|, создающий `поверхностную копию множества`:
  | >>> s1 = {1, 2, 3}
  | >>> s2 = s1.copy()
  | >>> s1 is s2
  | False
  | >>> s1 == s2
  | True
  | >>> s2.add(4)
  | >>> s1 == s2
  | False
  | >>> s2
  | {1, 2, 3, 4}
  . Очистить же множество без пересоздания можно с помощью метода |clear|:
  | >>> s = set("foobar")
  | >>> s
  | {'f', 'a', 'r', 'o', 'b'}
  | >>> s.clear()
  | >>> s
  | set()      
Операции над множествами .
. Наибольшую пользу приносят именно богатство и мощь средств по сопоставлению множеств!
  Проверка на равенство .
  . Давайте проверим два множества на равенство:
  | >>> set([1, 2, 3, 2, 1]) == {3, 1, 2}
  | True
  . Вы могли бы подумать, что два множества равны, если каждый отдельный элемент 
    одного множества содержится и во втором, и ваша догадка была бы близка к истине.
    Но вспомним, что коллекции в Python хранят только ссылки на объекты. Так что же,
    множества равны, если ссылаются на одни и те же объекты? Одинаковые ссылки 
    "равны" — это правда. Но могут быть и равны разные объекты!
  . Дело в том, что в Python есть специальный протокол проверки на равенство. Большинство 
    встроенных типов данных поддерживает этот протокол. Мы можем проверять на равенство 
    числа, строки, булевы значения. А ещё можем приравнивать кортежи, списки, словари. 
    И вот тут Python поступает очень разумно: если вы приравняете две коллекции одного типа, 
    то эти коллекции будут считаться равными, если их элементы попарно равны 
    (с точки зрения протокола, опять же). Посмотрите:
  | >>> [1, 2, ["foo", "bar"]] == [1, 2, ["foo"] + ["bar"]]
  | True
  | >>> (1, True, []) == (1, True, [])
  | True
  | >>> {"a": 1, "b": 2} == {"b": 2, "a": 1}
  | True
. Словари равны, если порядок ключей разный — лишь бы были равны значения по соответствующим 
  ключам и сами наборы ключей были одинаковыми!
. Вот и множества равны, если содержат одинаковые наборы равных попарно элементов.

  Объединение множеств .
  . Множества в Python, по аналогии с множествами в математике, поддерживают операцию 
    объединения (`union`). Эта операция не объединяет множества, как могло бы показаться,
    но возвращает такое множество — новый объект — которое содержит все элементы, 
    содержащиеся хотя бы в одном из оригинальных множеств. По смыслу объединение похоже 
    на операцию "`ИЛИ`" из булевой логики: элемент будет присутствовать в объединении
    , если он присутствует в первом исходном множестве ИЛИ во втором. Для объединения 
    множеств в Python используется оператор |||:
  | >>> visited_by_masha = {'Paris', 'London'}
  | >>> visited_by_kolya = {'Moscow', 'Paris'}
  | >>> visited_by_kolya | visited_by_masha
  | {'London', 'Moscow', 'Paris'}
  Пересечение множеств  .
  . Раз есть операция, похожая на "`ИЛИ`", то логично было бы предположить, что есть 
    и "операция И" . Да, есть и такая — пересечение (`intersection`) множеств. 
    В пересечение входят элементы, присутствующие в первом из оригинальных 
    множеств И во втором. Оператор пересечения — |&|. Пример:
  | >>> visited_by_masha = {'Paris', 'London'}
  | >>> visited_by_kolya = {'Moscow', 'Paris'}
  | >>> visited_by_kolya & visited_by_masha
  | {'Paris'}
  Разность множеств .
  . Разность (`difference`) множеств — такое множество, элементы которого содержатся в
    первом оригинальном множестве, но не содержатся во втором. Разность представлена 
    оператором |-| (уж очень смысл похож на вычитание из арифметики). Пример:
  | >>> visited_by_masha = {'Paris', 'London'}
  | >>> visited_by_kolya = {'Moscow', 'Paris'}
  | >>> visited_by_masha - visited_by_kolya
  | {'London'}
  | >>> visited_by_kolya - visited_by_masha
  | {'Moscow'}
  Симметрическая разность .
  . Симметрическая разность (`symmetric difference`) — множество, в которое входят элементы, 
    присутствующие ЛИБО в первом, ЛИБО во втором оригинальном множестве. По смыслу операция 
    похожа на исключающее `ИЛИ` (`xor`), поэтому и представлена оператором |^|. Пример:
  | >>> visited_by_masha = {'Paris', 'London'}
  | >>> visited_by_kolya = {'Moscow', 'Paris'}
  | >>> visited_by_kolya ^ visited_by_masha
  | {'London', 'Moscow'}
  Подмножества и надмножества .
  . Одно множество является `подмножеством` (`subset`) другого, если все элементы первого 
    входят во второе, но второе может содержать ещё и другие элементы. Второе в этом 
    случае является `надмножеством` (`superset`) для первого. Такое соотношение множеств 
    можно проверить с помощью методов |issubset| и |issuperset|:
  | >>> a = {1, 2, 3, 4}
  | >>> b = {3, 4}
  | >>> b.issubset(a)
  | True
  | >>> a.issuperset(b)
  | True
  . Равные множества являются друг для друга одновременно и подмножествами и надмножествами.
Методы объектов множеств .
  Операции над множествами как методы .
  . Вы уже узнали об операторах, позволяющих различными способами комбинировать множества. 
    Эти операторы максимально похожи на те, что применяются в теории множеств в математике и 
    эта похожесть — очень важное свойство. С теорией множеств любой уважающий себя программист 
    должен познакомиться хотя бы поверхностно — это тот самый пресловутый "фундамент". 
    Поэтому лично я придерживаюсь мнения, что множества нужно использовать 
    в сочетании с операторами.
  . Однако умолчать о том, что у каждого оператора есть и "словесный" метод-аналог,
    было бы неправильно. Так что знакомьтесь, методы:
  | a.union(b)                 # аналог "a | b"
  | a.intersection(b)          # аналог "a & b"
  | a.difference(b)            # аналог "a - b"
  | a.symmetric_difference(b)  # аналог "a ^ b"
  Обновление множеств "по месту" .
  . Есть ещё одна причина, по которой я рассказал про те четыре метода выше. 
    Помните, мы рассматривали метод |update| у словаря, обновляющий словарь 
    "по месту" с помощью данных из другого словаря? Так вот, для множеств 
    таких update-методов несколько.
    Метод difference_update  .
    . |difference_update| работает похоже на |-/difference|, а именно — удаляет
       из связанного множества все элементы, которые входят в множество-аргумент:
    | >>> a, b = {1, 2}, {2, 3}
    | >>> a.difference_update(b)
    | >>> a
    | {1}
    Метод intersection_update .
    . |intersection_update| (изменяющий аналог |&/intersection|) оставляет в 
       связанном множестве только те элементы, которые входят и в множество-аргумент:
    | >>> a, b = {1, 2}, {2, 3}
    | >>> a.intersection_update(b)
    | >>> a
    | {2}
    Метод symmetric_difference_update .
    . |symmetric_difference_update| (изменяющий аналог |^/symmetric_difference|)
       добавляет в связанное множество элементы, которые есть только в множестве-аргумента,
       и удаляет элементы, которые есть в обоих множествах:
    | >>> a, b = {1, 2}, {2, 3}
    | >>> a.symmetric_difference_update(b)
    | >>> a
    | {1, 3}
    Метод update .
    . |update| (изменяющий аналог ||/union|) дополняет связанное множество отсутствующими
       элементами из множества-аргумента:
    | >>> a, b = {1, 2}, {2, 3}
    | >>> a.update(b)
    | >>> a
    | {1, 2, 3}
    . Метод |update| с точки зрения единообразия надо было бы назвать `union_update`, 
      но выбрали более распространённое имя update, т.к. это имя часто используется 
      для сходных по смыслу методов других коллекций.
    
    
    