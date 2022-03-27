| # Подсчитать количество уникальных слов 
| #!/usr/bin/python3
| text = input("Enter text")
| a = set
|  
| while text != "":
|     print(len(set(text.split())))
|     text = input()