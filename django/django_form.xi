метод POST and GET .

два варианта создания формы:
1. Через модель
2. Через функцию

Через модель
views.py  
    from django.views.generic.edit import CreateView
    from catalog.models import Cars
    class CarCreate(CreateView):

urls.py
templates/catalog/modelname_form.py

 
