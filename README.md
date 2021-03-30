# Common-learning
обучение по стеку софта от 26 марта 2021

30.03.2021
Вспоминаю Wireshark. Официальная вики https://gitlab.com/wireshark/wireshark/-/wikis/home.
Обновляю Wireshark, запускаю, прописываю фильтр захвата "port 83", двойным кликом по сетевому интерфейсу запускаю захват.

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/begin.png" width="200" height="100">

Видим входящие и исходящие пакеты по 83 порту.

<img src="https://github.com/francehunter/Common-learning/blob/main/wireshark/raw_ws.png" width="200" height="100">

Однако RFC 5234 определяет структуру пакета 13-й версии веб сокетов слудющим образом
      0                   1                   2                   3
      0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
     +-+-+-+-+-------+-+-------------+-------------------------------+
     |F|R|R|R| opcode|M| Payload len |    Extended payload length    |
     |I|S|S|S|  (4)  |A|     (7)     |             (16/64)           |
     |N|V|V|V|       |S|             |   (if payload len==126/127)   |
     | |1|2|3|       |K|             |                               |
     +-+-+-+-+-------+-+-------------+ - - - - - - - - - - - - - - - +
     |     Extended payload length continued, if payload len == 127  |
     + - - - - - - - - - - - - - - - +-------------------------------+
     |                               |Masking-key, if MASK set to 1  |
     +-------------------------------+-------------------------------+
     | Masking-key (continued)       |          Payload Data         |
     +-------------------------------- - - - - - - - - - - - - - - - +
     :                     Payload Data continued ...                :
     + - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - +
     |                     Payload Data continued ...                |
     +---------------------------------------------------------------+
 
 Мы видим битовые флаги, поэтому содержимое, обернутое в json, сокрыто для прямого изучения.
