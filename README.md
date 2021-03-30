# Common-learning
обучение по стеку софта от 26 марта 2021

30.03.2021
Вспоминаю Wireshark. Официальная вики https://gitlab.com/wireshark/wireshark/-/wikis/home.
Обновляю Wireshark, запускаю, прописываю фильтр захвата "port 83", двойным кликом по сетевому интерфейсу запускаю захват.

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/begin.png" width="200" height="100">

Видим входящие и исходящие пакеты по 83 порту.

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/raw_ws.png" width="200" height="100">

Однако RFC 5234 определяет структуру пакета 13-й версии веб сокетов слудющим образом

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/rfc.png" width="200" height="100">
 
 Мы видим битовые флаги, поэтому содержимое, обернутое в json, сокрыто для прямого изучения. 
 Одним из способов увидеть посмотреть обмен по кастомному протоколу (API, Soap, etc..) является реализация так называемого диссектора на языке lua. Подробнее о диссекторах здесь https://wiki.wireshark.org/Lua/Dissectors.
Создадим файл ws.lua, добавим его в загзузку при старте приложения: в корневом каталоге Wireshark находим файл init.lua и добавляем строку   dofile("D:\\Wireshark\\addon\\ws.lua").

