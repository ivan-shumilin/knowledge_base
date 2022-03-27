Условие .
. Для записи цифр римляне использовали буквы латинского алфавита:
  I, V, X, L, C, D, M. Например:
  1 обозначалась с помощью буквы I
  10 с помощью Х
  7 с помощью VII
  Число 2020 в римской записи — это MMXX (2000 = MM, 20 = XX).
'src/solution.py'
. Реализуйте функцию to_roman(), которая переводит арабские числа в римские.
. Функция принимает на вход целое число из диапазона от 1 до 3000, 
  а возвращает строку с римским представлением этого числа.
. Реализуйте функцию to_arabic(), которая переводит число в римской записи
  в число, записанное арабскими цифрами. Если переданное римское
  число не корректно, то функция должна вернуть значение False.
  | . Примеры
  | >>> to_roman(1)
  | 'I'
  | >>> to_roman(59)
  | 'LIX'
  | >>> to_roman(3000)
  | 'MMM'
  | >>> to_arabic('I')
  | 1
  | >>> to_arabic('LIX')
  | 59
  | >>> to_arabic('MMM')
  | 3000
  | >>> to_arabic('IIII')
  | False
  | >>> to_arabic('VX')
  | False
. Подсказки:
  Подробнее о римской записи — https://ru.wikipedia.org/wiki/Римские_цифры 
Решение .
  Правила перевода арабские в римские .
    Шаг 1 .
    . Запомните значения, представленные латинским алфавитом в 
      последовательности 
      ["M": 1000, "CM": 900, "D": 500, "CD": 400, "C": 100, "XC": 90, 
      "L": 50, "XL": 40, "X": 10, "IX": 9, "V": 5, "IV": 4, "I": 1] 
    Шаг 2 .
    . Слева направо, попробуйте вычесть наибольшее значение и повторять 
      до оставшихся 0
      Пример 1: арабское число «424» преобразуется в римские цифры:
      424 = 400 + 10 + 10 + 4 = CD + X + X + IV = CDXXIV 
      Пример 2: арабская цифра «2019» преобразуется в римские цифры:
      2019 = 1000 + 1000 + 10 + 9 = M + M + X + IX = MMXIX
    Словарь .
    NUMERALS = {  # noqa: WPS407
     'M': 1000,
     'CM': 900,
     'D': 500,
     'CD': 400,
     'C': 100,
     'XC': 90,
     'L': 50,
     'XL': 40,
     'X': 10,
     'IX': 9,
     'V': 5,
     'IV': 4,
     'I': 1,
     }

Алгоритм .
  . to_roman(number)
  1. Запускаем цикл |while|
  1. Вычесть из `number` максимальное зничение `max_value` из словаря `NUMERALS`     
    1.1 Если результат меньше нуля тогда:
      1.1.1 Возвращаемся к пункту 1. Максимальное значение уменьшаем на 1 `max_value` 
    1.2 Если результат больше нуля тогда:
      1.2.1 В список `result_list` записываем ключ от значение `max_value`,
            которое мы вычитали.
            Возвращаемся к пункту 1.
  2. Преобразовать `result_list` в строку.         
| #!/usr/bin/python3
| NUMERALS = {  # noqa: WPS407
|     'M': 1000,
|     'CM': 900,
|     'D': 500,
|     'CD': 400,
|     'C': 100,
|     'XC': 90,
|     'L': 50,
|     'XL': 40,
|     'X': 10,
|     'IX': 9,
|     'V': 5,
|     'IV': 4,
|     'I': 1,
| }
|  
|  
| # BEGIN (write your solution here)
| def key_by_value(value):
|     for k, v in NUMERALS.items():
|         if value == v:
|             return k
|  
|  
| def to_roman(number):
|     values_list = list(NUMERALS.values())
|     values_list.sort(reverse = True)
|     index = 0
|     result_list = []
|     while index < len(NUMERALS):
|         print(index)
|         if number - values_list[index] < 0:
|             index += 1
|             continue
|         else:
|             result_list.append(key_by_value(values_list[index]))
|             number -= values_list[index]
|     return ''.join(result_list)       
| print(to_roman(2019))
| # END
Верное решение .
| NUMERALS = {  # noqa: WPS407
|     'M': 1000,
|     'CM': 900,
|     'D': 500,
|     'CD': 400,
|     'C': 100,
|     'XC': 90,
|     'L': 50,
|     'XL': 40,
|     'X': 10,  
|     'IX': 9,
|     'V': 5,
|     'IV': 4,
|     'I': 1,
| }
|   
|   
| # BEGIN
|   
| def descending(pair):
|     return -pair[1]
|   
|   
| def to_roman(number):
|     result = ''
|     for roman, arabic in sorted(NUMERALS.items(), key=descending):
|         repetitions_count = number // arabic
|         number -= arabic * repetitions_count
|         result += roman * repetitions_count
|     return result
|   
|   
| def to_arabic(number):  # noqa: WPS210
|     numbers = []
|     for char in number:
|         numbers.append(NUMERALS[char])
|     # Сдвиг чисел с повтором последнего
|     # Пример: [1,2,3,4] -> [2,3,4,4]
|     shifted_numbers = numbers[1:] + numbers[-1:]
|     result = 0
|     for previous, current in zip(numbers, shifted_numbers):
|         if previous >= current:
|             result += previous
|         else:
|             result -= previous
|     if to_roman(result) != number:
|         return False
|     return result
| # END       