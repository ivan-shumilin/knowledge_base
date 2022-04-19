В python все является обектом
__dict__ .
. содержит набор атрибутов экземпляра класса
  пространство имен - __dict__ 
__doc__ - документация .
Добовляем или меняем атрибуты( данные ) к классу .
| Point.color = 'red'
  setattr(obj, 'name' [, default] ) .
  | setattr(Point, 'border_line', '2')
Возвращает значение атрибута .
| Point.color  # Если нет атрибута будет исключение
  getattr(obj, 'name') .
| getattr(Point, 'color', 'Нет атрибута')
Проверка есть ли атрибут name в obj .
  hasattr(obj, 'name') .
| hasattr(Point, 'color')
| True
Удаление атрибута у класса .
| del Point.color  # Если нет атрибута будет исключение
  delattr(obj, 'name') .
| delattr(Point, 'color')  # Если нет атрибута будет исключение
Как опредляются простые методы класса .
| class Point:
|     ...    
|     def set_coords(self, a):
|         self.color = a
self .
. переменная которая содержит ссылку на экземпляр класса
инициализатор объекта класса __init__(self) .
финализатор класса __del__(self) .
. какое применение?
__new__ .
патерн Singleton .
. если создан экземпляр класса то следующий экземпляр 
  должен ссылаться на первый. Возможность создать только 1 экземпляр
  класса
|  class Point:
|    __instanse = None
|
|    def __new__(cls, *args, **kwargs):
|        if cls.__instanse == None:
|            cls.__instanse = super().__new__(cls)
|
|        return cls.__instanse
3 вида метода создания методы класса .
  обычный .
  . имеет доступ и к атрибутам класса и к атрибутам 
    экземпляра класса
  @classmethod .
  . доступ только к атрибутам класса
  @staticmethod .
  . не имеет доступ к атрибутам
Механизм инапсуляции .
  public x .
  protected _x .
  . служит для обращения внутри класса и во всех 
    дочерних классах
  . только для визуального обозначения внутренних атрибутов  
  private __x .
  . для обращения только внутри класса
  | _NameClass__nameattr # так можно обрашаться к приватным атрибутам и методам
    сеттер и геттер .
    . интерфейсы для изменения и полчения атрибутов класса
  Модуль accessify .
  . https://pypi.org/project/accessify/
  @private, @protected  с помощью этих декораторов можно сделать атрибуты и методы
  класса `по-настоящему` недоступными из вне.  
Магические методы __setattr__, __getattribute__, __getattr__ и __delattr__ .
. https://www.youtube.com/watch?v=CAx-NLFc-Z4&list=PLA0M1Bcd0w8zPwP7t-FgwONhZOHt9rz9E&index=8
. переопределение поведения при создании, обнавлении, удалении, обращении к атрибутам
Магические методы __add__, __sub__, __mul__, __truediv__  .
. https://www.youtube.com/watch?v=OMMQ1ZNKK6Q&list=PLA0M1Bcd0w8zPwP7t-FgwONhZOHt9rz9E&index=15
. Делаем сложение объектов с числами и другими экземплярами классов с
  помощью методов __add__(), __radd__() и __iadd__()
Паттерн "Моносостояние" .
. атрибуты класса и экземпляра класса всегда будут идентичны.
. единое пространство имен
| class Wars():
|     skill = {
|         'php': 100,
|         'power': 200
|     }
|  
|     def __init__(self):
|         self.__dict__ = self.skill
Свойства property. Декоратор @property .
  1 метод .
  . Создаем интерфейс php
| class Wars():
|     def __init__(self,  php):
|         self.php = php
|  
|     def get_php(self):
|         return self.__php
|  
|     def set_php(self, php):
|         self.__php = php
|  
|     php = property(get_php, set_php)
  2 метод .
  . С помощью декораторов
| class Wars():
|     def __init__(self,  php):
|         self.__php = php
|  
|     @property
|     def php(self):
|         return self.__php
|     @php.setter
|     def php(self, php):
|         self.__php = php
|     @php.deleter
|     def php(self):
|         del self.__php
Пример создания класса с геттером и сеттером .
| class Wars():
|    def __init__(self, php):
|        self.__php = php|
|    @classmethod
|    def __check_php(cls, php):
|        if 0 <= php <= 10:
|            return True
|        else:
|            raise ValueError('php должно быть целое число от 0 до 10')|
|    @property
|    def php(self):
|        return self.__php|
|    @php.setter
|    def php(self, php):
|        if self.__check_php(php):
|            self.__php = php|
|    @php.deleter
|    def php(self):
|        del self.__php
Дескрипторы (data descriptor и non-data descriptor) .
https://www.youtube.com/watch?v=ACqsYPbgePk&list=PLA0M1Bcd0w8zPwP7t-FgwONhZOHt9rz9E&index=12
. при исползовании property возникает дублирование функционала,
  и длиный лист сеттеров и геттеров при большом кол-ве атрбутов 
  класса.
. решение использовать дескрипторы.
. `data descriptor` имеет больший приоритет, чем `non-data descriptor`
  non-data descriptor .
  . если содержит только магческий метод __get__
  | __get__(self, instance, owner)
  |   return ...
  non-data descriptor .
  . если содерджит __set__, __del__
  | __set__(self, instance, owner)
  | __del__(self)
  Пример кода .
  . [/example/1.py]





 

  

