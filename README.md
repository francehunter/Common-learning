# Wireshark-learning

30.03.2021
Вспоминаю Wireshark. Официальная вики https://gitlab.com/wireshark/wireshark/-/wikis/home.
Обновляю Wireshark, запускаю, прописываю фильтр захвата "port 83", двойным кликом по сетевому интерфейсу запускаю захват.

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/begin.png" width="200" height="100">

Видим входящие и исходящие пакеты по 83 порту.

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/raw_ws.png" width="200" height="100">

Однако RFC 5234 определяет структуру пакета 13-й версии веб сокетов следующим образом

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/rfc.png" width="200" height="100">
 
 Мы видим битовые флаги, поэтому пэйлоад, обернутый в json, сокрыт для прямого изучения. 
 Одним из способов увидеть прикладной обмен по кастомному протоколу (API, Soap, etc..) является реализация так называемого диссектора на языке lua. Подробнее о диссекторах здесь https://wiki.wireshark.org/Lua/Dissectors.
Создадим файл ws.lua, добавим его в загзузку при старте приложения: в корневом каталоге Wireshark находим файл init.lua и добавляем строку   dofile("D:\\Wireshark\\addon\\ws.lua"). В теле диссектора цепляемся на 83 TCP порт, перебираем все пакеты; те, которые по формальным признакам (наличие фигурных скобок) содержат json - вырезаем и выводим отдельной нодой.

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/parsed.png" width="300" height="150">

С точки зрения удобства тестирования можно было бы добавить парсинг строки в массив, текст локализировать, а его вывод организовать как иерархию нодов.
