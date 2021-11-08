Linter .
  flake8 .
  . https://flake8.pycqa.org/en/latest/
  | poetry add --dev flake8
  . Игрорировать предупреждение
  | print('Hello, {}!'.format(name))  # Noqa:WPS421
    Настройка правил .
    . base.xi/linter.xi/setup.cfg
    Запуск в [../poetry] .
    | poetry run flake8 brain_games
  Wemake Python Styleguide .
  . https://wemake-python-stylegui.de/en/latest/ 
  | poetry add --dev wemake-python-styleguide
    Строгий набор правил
  PEP8 .
  . https://www.python.org/dev/peps/pep-0008/