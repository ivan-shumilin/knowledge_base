Вам нужно реализовать функцию `greet()`, которая должна принимать несколько имён
(как минимум одно!) и возвращать строку приветствия (см. примеры ниже).
| >>> greet('Bob')
| 'Hello, Bob!'
| >>> greet('Moe', 'Mary')
| 'Hello, Moe and Mary!'
| >>> greet(*'ABC')
| 'Hello, A and B and C!'
| >>>
Подсказки
При решении вам может пригодиться метод |join()| у объекта строки. Работает он так:
| >>> ','.join(['A', 'B', 'C'])
| 'A,B,C'
| >>> ','.join(['A'])
| 'A'
| >>> ''.join(['Hello', 'World'])
| 'HelloWorld'
| >>>
Решение 
| # BEGIN
| def greet(who, *args):
|     names = ' and '.join((who,) + args)
|     return 'Hello, {}!'.format(names)
| # END