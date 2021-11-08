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
  Правила перевода римские в арабские .
    Шаг 1 .
    . Запомните значения, представленные латинским алфавитом в 
      последовательности 
      ["M": 1000, "CM": 900, "D": 500, "CD": 400, "C": 100, "XC": 90, 
      "L": 50, "XL": 40, "X": 10, "IX": 9, "V": 5, "IV": 4, "I": 1] 
    Шаг 2 .
    . CDXXIV
      берем первый ключ в NUMERALS и ищем его в nu
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
. to_arabic(number)
  1. `while number != '':`
  1. CDXXIV
  . берем первый ключ в `NUMERALS_list[index][0]` 
  2. В `length_key = len(NUMERALS_list[index][0])`
  3. Сравниваем `if NUMERALS_list[index][0] == number[0:length_key]`
    1.1 Если равно то в `result += NUMERALS_list[index][1]` и 
        `number = number[length_key:]`
    1.2 Если не находим то `index += 1`
    1.3 Переходим к пункту 1
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
| def generating_list():
|     NUMERALS_list = [[] for y in range(len(NUMERALS))]
|     index = 0
|     for k, v in NUMERALS.items():
|         NUMERALS_list[index].append(k)
|         NUMERALS_list[index].append(v)
|         index += 1
|     return NUMERALS_list 
|  
|  
| def to_roman(number):
|     values_list = list(NUMERALS.values())
|     values_list.sort(reverse = True)
|     index = 0
|     result_list = []
|     while index < len(NUMERALS):
|         if number - values_list[index] < 0:
|             index += 1
|             continue
|         else:
|             result_list.append(key_by_value(values_list[index]))
|             number -= values_list[index]
|     return ''.join(result_list)       
|  
| def to_arabic(number):
|     NUMERALS_list = generating_list()
|     index = 0
|     length_key = 0
|     result = 0
|     number_for_test = number
|     while number != '' and index < len(NUMERALS_list):
|         print(index, result)
|         length_key = len(NUMERALS_list[index][0])
|         if (NUMERALS_list[index][0] == number[0:length_key]):
|             result += NUMERALS_list[index][1]
|             number = number[length_key:]
|         else:
|             index += 1
|     return result if number_for_test == to_roman(result) else False
| print(to_arabic('VX'))    
| # END
|   
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
