import io

from rest_framework import serializers
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser


# class ForecastSerializer(serializers.Serializer):
#     sing = serializers.CharField(max_length=5000)
#     description = serializers.CharField(max_length=5000)

class ForecastModel:
    def __init__(self, sing, description):
        self.sing = sing
        self.description = description


class ForecastSerializer(serializers.Serializer):
    sing = serializers.CharField(max_length=100)
    description = serializers.CharField()


def encode():  # кодируем в json
    model = ForecastModel('Tor', 'Good day!')  # создаем экземпляр модели
    model_sr = ForecastSerializer(model)  # model in serializar
    print(model_sr.data, type(model_sr.data), sep='\n')  # modal_sr.date - обьект сериализации
    json = JSONRenderer().render(model_sr.data)  # рендерим обьект серализации в json
    print(json, type(json), sep='\n')


def decode():  # декодируем из байтовой строки
    stream = io.BytesIO(b'{"sing":"Tor","description":"Good day!"}')  # передаем байтовую строку
    data = JSONParser().parse(stream)  # парсим
    serializer = ForecastSerializer(data=data) # проганяем через сериализатор
    serializer.is_valid()  # проверяем на валидность
    print(serializer.validated_data, type(serializer.validated_data), sep='\n')