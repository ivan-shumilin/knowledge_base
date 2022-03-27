class Integer():  # дескриптор, интерфейс взаимодействия с атрибутами класса
    @classmethod
    def __check_value(cls, value):
        if type(value) != int:
            raise ValueError('ожидает целое число')

    def __set_name__(self, owner, name):
        self.name = '_' + name

    def __get__(self, instance, owner):
        return getattr(instance, self.name)

    def __set__(self, instance, value):
        self.__check_value(value)
        setattr(instance, self.name, value)


class Wars():
    php = Integer()
    power = Integer()

    def __init__(self, php, power):
        self.php = php
        self.power = power

i = Wars(5, 9)