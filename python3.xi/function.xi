Позиционные аргументы
Именованные аргументы
[#Переменное количество аргументов]
Объекты первого класса
Анонимные функции
Декораторы
Функции высшего порядка (map/filter/reduce)
Функции .
. Функции, которые вы видели до этого, в основном имели `позиционные аргументы`.
  При вызове функций значения в такие аргументы подставляются согласно позиции
  имён аргументов в определении функции. Так, при вызове функции:
| def add(x, y):
|     return x + y
  с аргументами (10, 20) аргумент x получит значение 10, а y — 20.
[Переменное количество аргументов#] .
  . Использование `позиционных аргументов` выглядит просто, максимально похоже
    на использование функций в математике, и довольно удобно... пока вам не
    потребуется реализовать функцию, принимающую `произвольное количество аргументов`!
  . Вспомните, известная вам функция |print| принимает столько аргументов, сколько
    вы ей передадите. Она делает полезную работу даже тогда, когда вы вызываете её
    вообще без аргументов! Как же мы можем научить нашу собственную функцию так же
    терпимо относиться к количеству аргументов? Потребуется специальный синтаксис:
  | >>> def f(*args):
  | ...     print(type(args))
  | ...     print(args)
  | ...
  | >>> f()
  | tuple
  | ()
  | >>> f(1, 'a', None, False)
  | tuple
  | (1, 'a', None, False)
  . Здесь в заголовке функции (так называют строчку, в которой описываются имя функции
    и её аргументы) указан ровно один аргумент `args`, но записанный со звёздочкой
    впереди. Звездочка означает "эта переменная получит в виде кортежа все аргументы,
    от текущей позиции и до конца". Из чего следует, что такой "прожорливый" аргумент
    может быть только один (первый же "прожорливый" аргумент съест всё) и может
    располагаться только в конце списка аргументов (иначе последующим аргументам
    не достанется значений). А ещё пример показывает, что `*args` нормально переживает
    и отсутствие аргументов, обычные же аргументы всегда обязательны.
    Рассмотрим же пример посложнее:
  | >>> def greet(name, *args):
  | ...     for n in (name,) + args:
  | ...         print('Hello, {}!'.format(n))
  | ...
  | >>> greet('Tom', 'Ann')
  | Hello, Tom!
  | Hello, Ann!
  | >>> greet()
  | …
  | TypeError: greet() missing 1 required positional argument: 'name'
  . Здесь функция принимает несколько аргументов, но как минимум один аргумент должен быть
    передан всегда. Этот первый аргумент станет значением переменной `name`, а остальные
    сохранятся в `*args`. Подобным образом можно делать любое нужное количество
    обязательных аргументов.
  Передача аргументов в форме коллекции .
  . Иногда хочется сначала сформировать набор аргументов, а потом передать их функции.
    Скажем, прочитать аргументы из файла или получить каким-то другим программным способом.
    Здесь нам опять пригодится звёздочка:
  | >>> names = ['Tom', 'Ann']
  | >>> greet(*names)
  | Hello, Tom!
  | Hello, Ann!
  . Более того, часть аргументов можно передавать непосредственно и даже коллекции подставлять
    не только по одной:
  | >>> greet(
  | ...    'Bob', *['Mary', 'Clair'], 'Sam',
  | ...    *('Henry', 'John')
  | ... )
  | Hello, Bob!
  | Hello, Mary!
  | Hello, Clair!
  | Hello, Sam!
  | Hello, Henry!
  | Hello, John!
  Соглашения об именовании *args .
  . Напоследок отмечу, что среди питонистов принято называть упомянутый аргумент
    именно `*args` (от слова `"arguments"`). 
[Именованные аргументы#] .
. До этого момента мы вызывали функции в основном с `позиционными аргументами`.
  Но в Python функции могут иметь ещё и `именованные аргументы` (`keyword arguments`).
  Пример:
| >>> def bar(length, char1, char2):
| ...     return (char1 + char2) * length + char1
| ...
| >>> print(bar(5, '-', '*'))
| -*-*-*-*-*-
. Функция `bar` имеет три аргумента. Вызов функции тоже выглядит довольно понятно.
  Теперь предположим, что `char1` и `char2` чаще всего получают одни и те же значения.
  В такой ситуации удобно указать значения по умолчанию:
| >>> def bar(length, char1='-', char2='*'):
| ...     return (char1 + char2) * length + char1
| ...
| >>> print(bar(5))
| -*-*-*-*-*-
| >>> print(bar(3, '.'))
| .*.*.*.
| >>> print(bar(2, ':', '|'))
| :|:|:
. Выглядит удобно. Но что делать, если нас устраивает значение по умолчанию для `char1`,
  но мы хотим задать своё значение для `char2`? Придётся указывать оба? Не придётся,
  ведь за редким исключением любой позиционный аргумент может быть указан по имени:
| >>> print(bar(4, char2='#'))
| -#-#-#-#-
| >>> print(bar(char2='$', length=3))
| -$-$-$-
  Во втором вызове я даже порядок аргументов перепутал и ничего не сломалось! Да,
 `именованные аргументы` обладают таким свойством: `порядок именованных аргументов`
 `не имеет значения`!
. Однако имеет значение порядок групп аргументов: позиционные значения должны быть
  указаны до любых именованных! Иначе вы получите
  `ошибку SyntaxError: positional argument follows keyword argument.`
. Также в том случае, когда функция имеет `позиционные аргументы` без значений
  по умолчанию, значения для этих аргументов обязательно должны быть указаны так
  или иначе — либо в виде `позиционных значений`, либо в виде `именованных`.
  Нарушение этого правила приведёт к ошибке вида:
| >>> bar(char2='!')
| …
| TypeError: bar() missing 1 required positional argument: 'length'
. Внимание: нужно различать синтаксис объявления аргументов функции и синтаксис
  вызова функции. При вызове функции у вас больше свободы. Например, вы можете
  указывать именованные аргументы перед разворачиваемой группой позиционных:
| >>> def f(*args, x=None, y=None):
| ...     print('args =', args, ', x =', x, ', y =', y)
| ...
| >>> f(*(1, 2), x='a', *[3, 4], y='b', *(5, 6))
| args = (1, 2, 3, 4, 5, 6), x = a, y = b
  Когда стоит применять именованные аргументы .
  . Каких-то строгих правил на этот счёт не существует. Однако широко практикуется
    такой подход: если функция принимает больше трёх аргументов, нужно хотя бы
    часть из них указать по имени. Особенно важно именовать значения аргументов,
    если несколько значений имеют одинаковый тип. Потому что очень трудно понять,
    что делает функция с подобным вызовом:
  | make('circle', 300, 150, 10, None, 2.5, False)
  . Сравните с этим:
  | make(
  |     shape='circle',
  |     x=300, y=150, radius=10,
  |     line_pattern=None,
  |     line_width=2.5,
  |     fill=False
  | )
  . Такой код читать значительно проще!
  . Конечно, у вышеупомянутого правила есть пара исключений. 
    Первое: функции, назначение которых очевидно. Да, очевидность относительна, 
    но всё же обычно довольно легко понять, что скрывается за значениями в вызове
    point3d(10, 50, 21) или rgb(0, 255, 0). Тут, увы, работает только здравый смысл.
    Во-вторых, нет ни смысла, ни возможности, указать по именам аргументы,
    объявленные через "звёздочку":
  | >>> def sum(*args):
  | ...
  | >>> sum(x1=1, x2=2)
  | …
  | TypeError: sum() got an unexpected keyword argument 'x1'
  . В таких функциях имя `args` недоступно извне, ведь это не один аргумент,
    а получатель произвольного их количества.    
[Больше об именованных аргументах#] .
  Получение именованных аргументов в виде словаря .
  . Позиционные аргументы можно получать в виде `*args`, причём произвольное их
    количество. Для именованных аргументов существует подобная возможность.
    Только именованные аргументы получаются в виде словаря, что позволяет
    сохранить имена аргументов в ключах:
  | >>> def g(**kwargs):
  | ...     return kwargs
  | ...
  | >>> g(x=1, y=2, z=None)
  | {'x': 1, 'y': 2, 'z': None}
  . По соглашению аргумент, получающий подобный словарь, принято называть `kwargs`
    от словосочетания `"keyword arguments"`.
  . Аргумент `*args` в определении функции пишется после всех обычных позиционных
    аргументов перед первым аргументом со значением по умолчанию,
    а `**kwargs` пишется в самом конце, после последнего аргумента со значением
    по умолчанию. Давайте определим функцию, которая принимает все виды аргументов:
  | >>> def f(x, y, *args, kx=None, ky=42, **kwargs):
  | ...     return (x, y, args, kx, ky, kwargs)
  | ...
  | >>> f(1, 2, 3, 4, kx='a', ky='b', kz='c')
  | (1, 2, (3, 4), 'a', 'b', {'kz': 'c'})
  . Не нужно пугаться, в реальном коде редко какая функция использует все эти
    возможности одновременно! Но понимать, как каждая отдельная форма объявления
    аргументов работает и как такие формы можно сочетать — очень важно!
  Передача именованных аргументов с помощью словаря .
  . Как и в случае позиционных аргументов, именованные можно передавать в функцию
    "пачкой" в виде словаря. Для этого нужно перед словарём поставить… две звёздочки! Пример:
  | >>> def coords(x, y):
  | ...     return (x, y)
  | ...
  | >>> coords(x=1, **{'y': 2})
  | (1, 2)
  . Как вы видите, я и обычный именованный аргумент указал, и развернул в аргументы словарь
    — так тоже можно и это даже удобно! Попробуем функцию f из примера в начале урока вызвать
    с двумя наборами аргументов — одним для позиционных и вторым для именованных:
  | >>> positional = (2, 3)
  | >>> named = dict(ky='b', kz='c')
  | >>> f(1, *positional, 4, kx='a', **named)
  | (1, 2, (3, 4), 'a', 'b', {'kz': 'c'})
  . Обратите внимание на то, как я сконструировал словарь: я не написал литерал,
    а вместо этого вызвал функцию `dict` с несколькими именованными аргументами — так словарь
    ещё больше похож на "сохранённый набор аргументов"!
  . Также отметьте, что при подстановке аргументов "разворачивающиеся" наборы аргументов
    вроде *positional и **named можно указывать вперемешку с аргументами соответствующего типа:
    *positional с позиционными, а **named — с именованными. И конечно же,
    все именованные аргументы должны идти после всех позиционных!
  Keyword-only аргументы .
  . В Python 3 добавили возможность пометить именованные аргументы функции так, чтобы вызывать
    функцию можно было, только передав эти аргументы по именам. Такие аргументы называются
    keyword-only и их нельзя передать в функцию в виде позиционных.
    Выглядит функция с подобными аргументами так:
  | >>> def open_file(name, *, writable=False, binary=False):
  | ...     …
  | ...
  | >>> f1 = open_file('foo.txt', writable=True)
  | >>> f2 = open_file('bar.bin', binary=True)
  | >>> f3 = open_file('raw.dat', True, True)
  | …
  | TypeError: open_file() takes 1 positional argument but 3 were given
  . Здесь * выступает разделителем: отделяет "обычные" аргументы 
    (их можно указывать и по имени и позиционно) от "строго именованных". Такой разделитель
    можно использовать только один раз в одном определении. А ещё его нельзя применять
    в функциях с *args — да, не очень логично, но так уж вышло. Зато можно объявлять функции,
    у которых будут только строго именованные аргументы, для этого нужно поставить звёздочку
    в самом начале перечня аргументов.
  . Этот пример неплохо демонстрирует подход к описанию аргументов. Первый аргумент — 
    имя файла, который будет открыт. Имя файла всегда присутствует, ведь нужно же
    что-то открыть, и связано по смыслу с именем функции. Поэтому этот аргумент
    можно не именовать. А вот writable и binary — необязательные аргументы.
    Которые получают ещё и ничего не говорящие значения True/False. Вполне логично ожидать,
    что вызов вида open_file('raw.dat', True, True) мало кому понравится! Поэтому опции
    и объявлены так, что могут быть указаны только явно.
  Порядок аргументов при вызове функций .
  . Отдельно стоит отметить, что при вызове функций вы имеете чуть больше свободы для задания
    порядка аргументов. Одиночные именованные аргументы могут идти вперемешку
    с подстановками наборов позиционных. Вот пример такого вызова:
  | >>> foo = [1, 2, 3]
  | >>> bar = "abc"
  | >>> # функция f здеcь та же, что и в первом разделе урока
  | >>> f(kx=42, *foo, ky=100, *bar)
  | (1, 2, (3, 'a', 'b', 'c'), 42, 100, {})
  . Ещё одна особенность заключается в том, что вы не можете для функции с сигнатурой вида
    f(x, *args) указать одновременно аргумент x по имени и при этом развернуть набор
    параметров. То есть вы не сможете сделать так: f(*foo, x=42).
Знакомство с map, filter, reduce .
  Классические ФВП .
    map .
    . При работе со списками часто встаёт задача применить некоторое преобразование 
      (одно и то же) к каждому элементу. Конечно, мы всегда можем написать цикл.
      Однако этот цикл будет выглядеть одинаково практически во всех случаях:
    | def f(x):
    |     …
    |  
    | new_list = []
    | for item in old_list:
    |     new_item = f(item)
    |     new_list.append(new_item)
    . В таких случаях меняется только применяемая функция f. Так почему бы нам не 
      обобщить этот код так, чтобы функция была параметром? Так и сделаем:
    | def map(function, items):
    |     result = []
    |     for item in items:
    |         result.append(function(item))
    |     return result
    | map(str, range(5))
    | ["0", "1", "2", "3", "4"]
    . Функция называется "map", т.е. "отобразить". Название пришло из математики,
      где точно так же называется функция, которая отображает одно множество значений
      в другое путём преобразования всех элементов с помощью некоей трансформации
      (как правило, функции). В большинстве языков также используют это имя.
    filter .
    . Часто нужно не столько преобразовать элементы, а просто оставить одни элементы 
      списка, но отбросить другие — согласно некоторому критерию. Во многих языках 
      для решения этой задачи существует функция |filter|, код которой выглядит очень 
      похоже на код |map|:
    |  def filter(predicate, items):
    |      result = []
    |      for item in items:
    |          if predicate(item):
    |              result.append(item)
    |      return result
    |  
    |  def is_odd(x):
    |      return x % 2
    |  
    |  filter(is_odd, range(6))
    | [1, 3, 5]
    . Наша функция |filter| применяет предикат к каждому элементу и 
      добавляет в выходной список только те элементы, для которых 
      предикат вернул `True`.
    . У функции |filter| имя более "говорящее" и менее академичное, но такое
      же популярное — многие языки имеют аналогичную функцию с тем же именем.
    reduce .
    . И |map|, и |filter| работали с отдельными элементами независимо. 
      Но ведь встречаются и циклы, которые агрегируют результат — формируют
      результирующее значение (одно), комбинируя элементы между собой с
      использованием аргумента-аккумулятора.
    . Типичными примером агрегации может быть сумма всех элементов списка. 
      Или, скажем, произведение. Представим, что нам нужно сложить элементы
      списка [1, 2, 3, 4, 5]. С точки зрения математики сумма
    | 1 + 2 + 3 + 4 + 5
      Может быть выражена как
    | (((((0 + 1) + 2) + 3) + 4) + 5).
      Ноль здесь — тот самый аккумулятор (его начальное состояние). Он не добавляет
      к сумме ничего, но может служить отправной точкой. А ещё — будет результатом,
      если входной список пуст.
    . С помощью цикла мы бы суммировали так:
    | acc = 0
    | for item in items:
    |     acc = acc + item
    . А умножали бы так:
    | acc = 1
    | for item in items:
    |     acc = acc * item
    . Замечаете тенденцию? Циклы отличаются только начальным значением аккумулятора
      (0 и 1) и операцией, которая комбинирует элемент и аккумулятор (+ и *). Обобщаем!
    | >>> def reduce(operation, initial_value, items):
    | ...     acc = initial_value
    | ...     for item in items:
    | ...         acc = operation(acc, item)
    | ...     return acc
    | ...
    | >>> from operator import add, mul
    | >>> reduce(add, 0, [1, 2, 3, 4, 5])
    | 15
    | >>> reduce(mul, 1, [1, 2, 3, 4, 5])
    | 120
    . В примере я использовал функции |add| и |mul| из модуля |operator|. Так вот, это 
      аналоги + и * в виде функций, которые можно использовать в связке с ФВП.
      Возьмите этот модуль на заметку и поэкспериментируйте с его содержимым!
    . Функции, называемой в Python |reduce| не так повезло с именем, как двум предыдущим. 
      Уж как только эту функцию не называют — и `inject`, и `reduce`, и `aggregate`.
    . И лишь в математике всё однозначно: такая функция называется `левая свёртка`
      (`left fold`). И имя "свёртка" вполне себе говорящее — применяя эту функцию,
       мы сворачиваем список в одно значение!
    map/filter/reduce против цикла for .
    . Мы с вами реализовали целые три функции, каждая из которых имеет меньшую мощность,
      чем цикл for. Более того, цикл for позволяет гибко управлять процессом итерации
      с помощью команд break и continue. Зачем же тогда нужны эти отдельные маломощные
      версии, когда есть одна универсальная?
      А нужны эти функции затем, что каждая функция делает ровно одну работу,
      что `значительно упрощает рассуждение о коде, его чтение и написание`. С первого
      взгляда на имя функции мы можем понять, что filter — фильтрует, а map — преобразует
      элементы, но не наоборот! Более того, по построению filter не меняет элементы,
      а только лишь отбрасывает их часть. А map меняет значение элементов, но не меняет
      их количество и позиции. Это знание того, что код сделать не может, дорогого стоит!
      Имей же мы на руках цикл for, нам бы пришлось (и приходится!) "выполнить код в уме"
      (как ещё говорят, "поработать интерпретатором"), ведь цикл for может делать что
      угодно — и менять элементы, и отбрасывать их и агрегировать результат, и даже
      делать всё это одновременно!
    . И пусть все случаи применения цикла заменить на функции не получится. Но в тех 
      простых случаях, когда можно достигнуть нужного результата с применением менее
      мощного и вместе с тем более простого в понимании инструмента — стоит, как минимум,
      подумать об этой альтернативе!
Замыкания .
. Помните функцию `inner`, которую мы создавали в первом уроке по ФВП. Так вот, эта функция
  была замыканием! `Замыкание (closure)`, это такая функция, которая ссылается на
  локальные переменные (использует их в своём теле) в области видимости, в которой
  она была создана. Этим замыкание отличается от обычной функции, которая может
  использовать только свои аргументы и глобальные переменные. Рассмотрим пример,
  демонстрирующий замыкание, и уже на нём разберём что и чем является:
| G = 10
| def make_closure():
|     a = 1
|     b = 2
|     def inner(x):
|         return x + G + a
|     return inner
. В этом примере `inner` — замыкание. Переменная `b` не используется в теле `inner`
  и замыканием запомнена не будет. А вот переменная `a`, напротив, участвует в
  формировании результата вызова `inner` и поэтому её значение будет запомнено.
  А вот `G`, это глобальная переменная (если принять факт, что указанный код 
  находится на верхнем уровне модуля, т.е. не вложен ни в какие другие блоки).
. Кстати, функции, создаваемые на верхнем уровне модуля, т.е. не внутри каких-либо
  других функций, замыканиями не являются — им просто нечего замыкать, ведь все
  видимые таким функциям внешние имена (импорты и другие определения из этого
  модуля, находящиеся выше по строчкам кода) являются глобальными.
  Момент запоминания значений переменных .
  . Отмечу важную особенность: фактическое запоминание значения происходит в тот 
    момент, когда область видимости, в которой было создано замыкание, "заканчивается",
    например завершается выполнение текущей функции. Проще всего думать, что на момент
    создания функции замыкаемые переменные сначала записываются в некий список дел в
    виде пунктов "не забыть запомнить текущее значение переменной xyz", а выполняются
    эти пункты после завершения тела функции, создавшей замыкание. Вот пример,
    демонстрирующий это самое позднее запоминание:
  | def make_closure():
  |     y = 1
  |     def inner(x):
  |         return x + y
  |     y = 42
  |     return inner
  | make_closure()(100)
  | 142
  Здесь `inner` получает в качестве запомненного значения 42, пусть даже присваивание
  этого значения переменной y происходит и после объявления функции! Ещё "забавнее"
  выглядит замыкание переменной цикла:
  | printers = []
  | for i in range(10):
  |     def printer():
  |         print(i)
  |     printers.append(printer)
  | printers[0]()
  | 9
  | printers[5]()
  | 9
  | printers[9]()
  | 9
  | i = 42
  | printers[0]()
  | 42
  . Казалось бы, мы создали десяток функций, каждая из которых должна печатать своё число,
    но все функции печатают последнее значение переменной цикла! Здесь тоже фактическое
    запоминание происходит при выходе из области видимости в которой определена переменная i,
    вот только эта область видимости на момент вызова замыканий ещё не завершилась
    (в этом REPL-примере она завершится только при выходе из REPL)! Поэтому после выхода
    из цикла все замыкания выводят 9, а после изменения значения переменной i выводимое
    значение также меняется!
  Борем замыкания! .
  . Как же запоминать то, что нужно и когда нужно? Как же нам починить пример с циклом,
    чтобы каждая функция печатала своё значение и не реагировала на дальнейшие изменения
    переменной цикла? Отвечаю: нужно замкнуть переменную в области видимости, которая
    завершится сразу же после создания замыкания! Этого можно добиться, завернув создание
    функции в… другую функцию! Вот код:
  | printers = []
  | for i in range(10):
  |     def make_printer(arg):
  |         def printer():
  |             print(arg)
  |         return printer
  |     p = make_printer(i)
  |     printers.append(p)
  | printers[0]()
  | 0
  | printers[5]()
  | 5
  . Результат положительный! Но как же этот код работает? Заметьте, в этот раз printer
    замыкает значение переменной arg, а она принадлежит функции make_printer и видна
    только пока выполняется тело функции. А ведь это именно то, что нам нужно: когда
    происходит выход из тела make_printer, возвращаемое замыкание получает-таки
    своё значение. А раз функция make_printer вызывается с разными аргументами,
    то и замыкания получают разные значения!
    Зачем нужно замыкание??? .
    . Чтобы переносить переменную из функции в область глобального видения.
Декораторы .
. Представьте, что вам захотелось иметь возможность выводить на печать все
  результаты вызова некой функции. Однако саму функцию модифицировать не хочется,
  а вместо этого вы желаете получить универсальный инструмент,
  пригодный для использования с любыми функциями.
. Давайте реализуем такую функцию, для чего воспользуемся ФВП (функцией высшего порядка):
| def printing(function):
|     def inner(*args, **kwargs):
|         result = function(*args, **kwargs)
|         print('result =', result)
|         return result
|     return inner
| def add_one(x):
|     return x + 1
| add_one = printing(add_one)
| y = add_one(10)
| result = 11
| y
| 11
. Сначала разберёмся с функцией `printing`. Эта функция создаёт замыкание `inner`,
  которое принимает любые аргументы, применяет к ним функцию, печатает результат
  и тут же возвращает его. Заметьте, в определении `inner` я использовал аргументы
  `*args`, `**kwargs`, которые функция без изменения передаёт замкнутой функции
  `function` — именно так в Python объявляют "всеядные" функции, которые "пробрасывают"
   любые комбинации аргументов.
. Теперь посмотрим на пример применения `printing`. В примере я заменил функцию
  `обёрнутым` (`wrapped`) вариантом через присваивание старому имени функции нового
  значения. Да, функции в Python — обычные переменные в той области видимости,
  где были объявлены!
. Имя "printing" ("печатающий") я выбрал неспроста — подобные обёртки над функциями
  часто называют в похожей манере. Ведь и по смыслу поведение, которое добавляет
  обёртка к исходной функции, служит дополнением для этой функции. И читается
  printing(add_one) практически по-человечески: 
  "добавить единицу, печатая на экран (результат)".
. Подобное оборачивание — довольно частая операция в коде, широко использующем
  функции высшего порядка. Авторы языка Python даже завели для удобного
  использования функций-обёрток специальный синтаксис! Вот эти самые
  функции-обёртки вместе с синтаксисом оборачивания называются `декораторами`.
  Синтаксис применения декоратора .
  . Применения декоратора `printing` к функции `add_one` с использованием
    специального синтаксиса можно записать так:
  | @printing
  | def add_one(x):
  |     return x + 1
   Имя декоратора пишется на строчке, предшествующей заголовку функции,
   а перед именем пишется символ `@`. После такого применения декоратора
   нам уже не нужно "`переприсваивать`" функцию (|add_one = printing(add_one)|)!
  . Применение даже одного декоратора становится удобнее с таким синтаксисом,
    но применять подобным образом можно сколько угодно декораторов! 
    Выглядеть это будет так:
  | @logging
  | @printing
  | @cached
  | def foo():
  |     # …
  . Что будет равнозначно коду
  | foo = cached(foo)
  | foo = printing(foo)
  | foo = logging(foo)
  . Или в одну строку
  | foo = logging(printing(cached(foo)))
  . `Обратите внимание и запомните:` оборачивание происходит сначала в ближайшие
     к имени функции обёртки, как бы "`изнутри наружу`" — `cached`, затем `printing`
     и в конце `logging`.
  Декораторы с параметрами .
  . Давайте пофантазируем вновь: представим, что нам хочется иметь возможность
    валидировать аргументы (проверять соответствие их значений неким правилам) функций.
    И хочется это делать с помощью декораторов, которые можно применять раз за разом.
    Парочку таких декораторов мы и реализуем к концу урока.
    Но для начала нужно слегка отвлечься.
  . Что будет, если аргументы функции не проходят нашу проверку? Нам нужно показывать
    ошибку. Но как это сделать? Подробнее о работе с ошибками будет расказано в
    последующих курсах, а пока просто покажу, как спровоцировать ошибку:
  | >>> raise ValueError('Value too low!')
  | Traceback (most recent call last):
  |   File "<stdin>", line 1, in <module>
  | ValueError: Value too low!
  . Вот такую ошибку мы и будем показывать, если значение аргумента не проходит валидацию!
    Можно приступать к созданию декораторов.
  . Пусть у некой функции числовой аргумент должен быть больше нуля и не равен некоторым
    "плохим" значениям. Конечно, мы могли бы сделать специальные декораторы вида
  | @greater_than_zero
  | @not_bad
  | def function(arg):
  |     # …
    Вот только на все случаи жизни таких узкоспециализированных декораторов не напасёшься!
    Хочется как-то отделить оборачивание функции и сами проверки, чтобы в роли последних
    могли выступать обычные предикаты. Но как декоратор узнает о предикате, если всегда
    принимает единственный параметр — оборачиваемую функцию? Ответ: через замыкание!
    Нам нужна функция, которая примет в качестве аргумента функцию-предикат и
    вернёт функцию-обёртку, а та потом тоже примет в качестве аргумента функцию и вернёт
    функцию же! Напишем же этот слоёный пирог из функций:
  | def checking_that_arg_is(predicate, error_message):
  |     def wrapper(function):
  |         def inner(arg):
  |             if not predicate(arg):
  |                 raise ValueError(error_message)
  |             return function(arg)
  |         return inner
  |     return wrapper
    Функция `checking_that_arg_is` принимает предикат и возвращает `wrapper`. 
    Вот `wrapper` — это уже наш декоратор с привычным уже `inner` внутри. Который
    проверяет аргумент предикатом, и, если условие соблюдено, вызывает function.
    Выглядит сложновато, но вы со временем научитесь сразу писать и читать такой код,
    ведь декораторы — в т.ч. и с параметрами — частые гости в коде на Python.
  . Применение декоратора с параметрами выглядит так:
  | @checking_that_arg_is(condition, "Invalid value!")
  | def foo(arg):
  |     # …
    Думаю, что вы и сами сможете проследить, что и с какими аргументами здесь вызывается!
    Теперь у нас есть то, чем оборачивать. Сейчас я напишу несколько замыканий,
    которые выступят проверками:
  | def greater_than(value):
  |     def predicate(arg):
  |         return arg > value
  |     return predicate
  |  
  | def in_(*values):
  |     def predicate(arg):
  |         return arg in values
  |     return predicate
  |  
  | def not_(other_predicate):
  |     def predicate(arg):
  |         return not other_predicate(arg)
  |     return predicate
  . Функции `not_` и `in_` имеют в конце названия символ |_|. Именно так принято называть
    переменные, имена которых совпадают с ключевыми словами или именами встроенных функций.
    Эти ФВП принимают параметры и возвращают предикаты, которые удобно использовать с
    описанным выше декоратором. Вспомним: нам нужно проверять, что аргумент функции имеет
    значение, большее нуля и не равное некоторым плохим значениям. Вот как эти условия
    будут выглядеть в коде:
  | >>> @checking_that_arg_is(greater_than(0), "Non-positive!")
  | ... @checking_that_arg_is(not_(in_(5, 15, 42)), "Bad value!")
  | ... def foo(arg):
  | ...     return arg
  | ...
  | >>> foo(0)
  | Traceback (most recent call last):
  |   File "<stdin>", line 1, in <module>
  |   File "<stdin>", line 5, in inner
  | ValueError: Non-positive!
  | >>> foo(5)
  | Traceback (most recent call last):
  |   File "<stdin>", line 1, in <module>
  |   File "<stdin>", line 6, in inner
  |   File "<stdin>", line 5, in inner
  | ValueError: Bad value!
  | >>> foo(6)
  | 6
  . Условия выглядят почти как фразы на разговорном английском, не правда ли?!
    Каждая "`фабрика предикатов`" (ФВП, возвращающая предикат) получилась
    достаточно абстрактной, чтобы быть применимой для валидации разных значений.
    А ещё наши предикаты `композируемы` — удобны для создания комбинаций из
    существующих функций без написания новых (мне лично нравится not_(in_(…))!).
  Оборачиваем функции правильно .
  . Когда мы объявляем функцию, то функция получает имя. А ещё функция может
    иметь строку документации или `docstring`. Эту документацию показывают
    разные инструменты, например IDE. Или функция |help()| в Python REPL:
  | >>> def add_one(arg):
  | ...     """
  | ...     Add one to argument.
  | ...
  | ...     Argument should be a number.
  | ...     """
  | ...     return arg + 1
  | ...
  | >>> add_one
  | <function add_one at 0x7f105936cd08>
  | >>> # ^ вот и имя у объекта функции!
  | >>>
  | >>> help(add_one)
  | …
  |     add_one(arg)
  |     Add one to argument.
  |  
  |     Argument should be a number.
  | …
    Но что будет, если мы обернём функцию с помощью декоратора? Посмотрим:
  | >>> def wrapped(function):
  | ...     def inner(arg):
  | ...         return function(arg)
  | ...     return inner
  | ...
  | >>> add_one = wrapped(add_one)
  | >>> add_one
  | <function wrapped.<locals>.inner at 0x7f1056f041e0>
  | >>> help(add_one)
  | …
  | inner(arg)
  | …
    Функция потеряла и имя (теперь это wrapped.<locals>.inner) и документацию!
    Но как же сохранить и то и другое? Можно сделать это вручную — скопировать
    у оригинальной функции атрибуты __name__ и __doc__. Но есть способ лучше!
    Перепишем наш декоратор с помощью декоратора |wraps| из модуля |functools|:
  | >>> from functools import wraps
  | >>> def wrapped(function):
  | ...     @wraps(function)
  | ...     def inner(arg):
  | ...         return function(arg)
  | ...     return inner
  | ...
  | >>> def foo(_):
  | ...     """Bar."""
  | ...     return 42
  | ...
  | >>> foo = wrapped(foo)
  | >>> foo
  | <function foo at 0x7f1057b15048>
  | >>> help(foo)
  | …
  | foo()
  |     Bar.
  | …
  . Мы обернули функцию `foo`, но обёртка сохранила документацию и имя! Кстати, вы
    заметили, что |wraps| — тоже декоратор с параметром? Думаю, что вы даже сможете
    представить, как он реализован!
  . У обёрток, созданных с применением |wraps|, есть ещё одно полезное свойство:
    до обёрнутой функции можно всегда "достучаться" впоследствии: ссылка на
    оригинальную функцию хранится у обёртки в атрибуте __wrapped__:
  | >>> foo.__wrapped__
  | <function foo at 0x7f1056f04158>
  . Декоратор |wraps| сделает ваши декораторы достойными представителями вида,
    всегда используйте его!
Рекурсия .
. Чтобы понять рекурсию, нужно сначала понять рекурсию!" (расхожая шутка).
. Рекурсия в программировании — это возможность дать определение функции, используя
  в процессе саму определяемую функцию. В математике многие функции определены
  именно таким образом, поэтому и большинство языков программирования берёт на
  вооружение этот подход. Python здесь не является исключением: обычно в
  определении функции вы можете использовать только определения, данные ранее,
  но есть одно исключение — функция в своём теле может вызывать себя.
  Выглядит это так:
| def factorial(n):
|     if n <= 0:
|         return 1
|     return n * factorial(n - 1)
  Эта функция, вычисляет факториал числа n через умножение числа на факториал
  числа n - 1.
  Условие завершения рекурсии .
  . Рассмотренный пример демонстрирует использование условия, прекращающего
    рекурсию. Если в этой функции убрать условие, проверяющее аргумент на
    неотрицательность, то первый же вызов этой функции заставит программу
    "зациклиться" — функция продолжит вызывать себя снова и снова.
  . В определениях рекурсивных функций практически всегда присутствует подобное
    условие. Оно позволяет вычислению пойти по одной из веток:
    по `рекурсивной` — в этой ветке произойдёт вызов себя (а то и не один!), и 
    `терминальной`, которая закончит вычисление и вернёт результат.
  . Есть даже такое правило: какой-то из аргументов рекурсивной функции должен
    обязательно "убывать". Убывание может означать уменьшение счётчика,
    отбрасывание "головы" списка при движении к его хвосту, вызов себя для части
    исходной структуры при обработке древовидных структур данных. К сожалению,
    в общем случае понять, что программа не зациклится, можно только методом
    "пристального взгляда" и применением тестов. Особенно важно проверять
    срабатывание условия завершения рекурсии!
  Переполнение стека .
  . В большинстве программ, написанных на языках, которые поддерживают вызов
    функций, этот самый вызов устроен так: перед вызовом функции текущее место
    в программе запоминается в стеке, а когда функция возвращает результат,
    то соответствующий элемент стека отбрасывается.
  . `Стек` (`stack`) — абстрактный тип данных, похожий на стопку монет:
    монета, положенная последней, будет снята первой (при снятии монет порядок
    получается обратным порядку складывания).
    В этом же стеке сохраняются значения аргументов функции, а иногда
    и другая служебная информация. При этом память, выделенная для стека
    при запуске программы, конечна и довольно ограничена. Что же произойдёт,
    если функция будет вызывать себя снова и снова и не возвращать результат?
    Эта память когда-нибудь закончится! Когда заканчивается память, выделенная
    для стека вызовов, случается так называемое "переполнение стека".
  . Из-за переполнения стека вы не сможете посчитать факториал для достаточно
    больших чисел с помощью рекурсивной функции. Но сможете посчитать с помощью
    итеративной — написанной с использованием циклов и переменных. К слову,
    вот так выглядит переполнение стека при подсчёте факториала:
  | >>> factorial(1000)
  | Traceback (most recent call last):
  |   File "<stdin>", line 1, in <module>
  |   File "<stdin>", line 4, in factorial
  |   File "<stdin>", line 4, in factorial
  |   File "<stdin>", line 4, in factorial
  |   [Previous line repeated 995 more times]
  |   File "<stdin>", line 2, in factorial
  | RecursionError: maximum recursion depth exceeded in comparison
  . Заметьте, сообщение говорит, что "превышена максимальная глубина рекурсии".
    Глубиной рекурсии называется количество последовательных вызовов "себя"
    без возврата значения. В Python максимальная длина искусственно ограничена,
    потому что проще считать количество вызовов, чем предсказывать окончание памяти.
  Зачем рекурсия нужна .
  . Вы можете подумать, почему же программисты не перестают использовать рекурсивные
    функции и не переходят на итеративные? Дело в том, что некоторые алгоритмы
    реализуются сильно проще, если использовать именно рекурсию, а не циклы. Часто
    такие алгоритмы работают с рекурсивными же структурами данных — деревьями,
    "словарями словарей словарей" и подобными. При реализации таких алгоритмов
    нужно помнить, что память для стека не бесконечна. Впрочем, обычно не бесконечны
    и сами обрабатываемые структуры данных,
    поэтому отказываться полностью от рекурсии не стоит!
  Рекурсия прямая, косвенная, линейная, каскадная .
  . Видов рекурсии существует несколько. Если функция вызывает себя непосредственно,
    то мы имеем дело с `прямой рекурсией`. Если же функция вызывает внутри себя другую,
    которая когда-то вызовет первую, то это уже `косвенная рекурсия`.
  . Если при вычислении результата функции нужно вызвать себя один раз, как в примере
    с factorial, то рекурсия называется `линейной`. Только имейте в виду, что "один раз"
    ничего не говорит про общее количество вызовов функции в теле! Речь идёт именно о
    количестве вызовов, результаты которых потребуются для одного общего вычисления.
  . Рассмотрим два разных примера: в одном рекурсия будет линейной, а в другом каскадной
    — так называют рекурсию с "несколькими вызовами себя".
  . Рекурсия в этой функции (которая проверяет Гипотезу Коллатца) — линейная:
  | def collatz(n):
  |     if n == 1:
  |         return True
  |     if n % 2 == 0:
  |         return collatz(n // 2)
  |     return collatz(n * 3 + 1)
  . Здесь в теле функции рекурсивных вызова два, но в каждом конкретном "заходе"
    используется только один.
  . А вот рекурсия в этой функции (которая вычисляет очередное Число Фибоначчи)
    — каскадная:
  | def fibonacci(n):
  |     if n <= 2:
  |         return 1
  |     return fibonacci(n - 1) + fibonacci(n - 2)
  . Здесь функция всегда вызывает себя два раза. Сначала будет два вызова себя,
    которые превратятся в четыре (два раза по два вызова), затем в восемь
    — количество вызовов растёт "каскадно", отсюда и название рекурсии.
  Заключение .
  . Рекурсия — мощный инструмент в умелых руках. Многие задачи можно решать с
    помощью рекурсии элегантно, а если умеючи — то и эффективно.


