На данный момент добавлено две extfs - xsmb и xnet

------------------------------------------------------------------------------
xsmb:

Создайте файл с расширением xsmb
 Задайте в нем переменную RANGE - диапазон ip адресов
 Можно так же задать переменную USER
 Теперь mc при нажатии Enter на этом файле будет запускать 
 ntbscan $RANGE и результаты сканирования представлять в виде списка директорий
 с именами машин. Как задавать RANGE можно почитать в man nbtscan


 Пример:

[berloga ~/Студгородок/SMB] cat LAND07.xsmb 
RANGE=193.124.217.129-254
USER=GUEST
[berloga ~/Студгородок/SMB] 

------------------------------------------------------------------------------

xnet:
 
 Создайте файл с расширением xnet
 Каждая строчка в нем - описание машины

 Пример:

[berloga ~/Студгородок/NET] cat rokot.xnet 
ftp: ROKOT rokot.land7.nsu.ru
smb: BERLOGA berloga
smb: MAKS 193.124.217.200
[berloga ~/Студгородок/NET] 
 
то есть строчки устроены так  - 
тип: метка url  

пока поддерживаются только ftp, smb и sh.
Если в строчке есть smb, то требуется, чтобы smb: стояло в самом начале строки

При нажатии на Enter на этом файле каждая строчка будет представлена в виде директории с именами меток

=============
28.11.2005 - Добавлено ose.

1. Изменён формат файла с расширением xnet. Разделителем теперь выступает 
символ ТАБУЛЯЦИИ. Поле метки может содержать пробелы и элементы пути, разделённые 
символом "/". Это позволяет группировать ресурсы. Второй вариант представления
каждой строки ясен из примера 2. Это эквивалентные примеры.

 Пример 1:

$ cat ~/.mc/xnet
#protocol:<tab>directory<tab>[[user@]password]server[/path]

[Users]
ftp:	avas	user:password@avas
ftp:	boris	user:password@boris
sh:	boris	boris
ftp:	vadek	user:password@vadek
ftp:	vadek	user:password@vadeek
smb:	rem	REM

[External Servers]
ftp:	ftp.kaspersky.ru	ftp.kaspersky.ru
ftp:	ftp.drweb.ru		ftp.drweb.ru
ftp:	ftp.asplinux.ru		ftp.asplinux.ru
ftp:	ftp.archlinux.org	ftp.archlinux.org
$

 Пример 2:

$ cat ~/.mc/xnet
#protocol:<tab>directory<tab>[[user@]password]server[/path]

ftp:	Users/avas	user:password@avas
ftp:	Users/boris	user:password@boris
sh:	Users/boris	boris
ftp:	Users/vadek	user:password@vadek
ftp:	Users/vadek	user:password@vadeek
smb:	Users/rem	REM

ftp:	External Servers/ftp.kaspersky.ru	ftp.kaspersky.ru
ftp:	External Servers/ftp.drweb.ru		ftp.drweb.ru
ftp:	External Servers/ftp.asplinux.ru	ftp.asplinux.ru
ftp:	External Servers/ftp.archlinux.org	ftp.archlinux.org
$

2. Если поместить с каталоге ~/.mc файлы с именами xsmb и xnet, то при выборе точки
монтировани при нажатии Shift+F1/F2 в списке появятся новые пункты - "Сеть" и 
"Ресурсы Samba".

=============
26.05.2017 - Добавлено ose.

1. Добавлена возможность фильтрации точек монтирования в списке, вызываемом по Shift+F1/F2.
Чтобы скрыть ненужные элементы нужно указать их в ~.mc/ini в секции [Misc] или сохранить
настройки и уже после этого править эту строку:

selmnt_filter=:/dev:/dev/fd:/proc:

Значение по умолчанию "::", двоеточия в начале и конце строки обязательны.

2. Добавлена возможность включения в список точек монтирования содержимого файла путей
быстрого доступа ~/.mc/hotlist. Чтобы данный список не разрастался до неприличного
размера, включение элементов hotlist ограничено только первым уровнем, исключая те элементы,
которые находятся внутри групп. Чтобы использовать элементы hotlist при вызове Shift+F1/F2
нужно добавить в ~/.mc/ini строку:

selmnt_with_hotlist=true

Если строку в файле hotlist привести к виду

ENTRY "~oDocuments" URL "/home/ose/documents",

то символ, идущий да тильдой (~) будет назначен хоткеем для данного элемента. Но необходимо
следить за этими хоткеями на предмет совпадения с ранее назначенными хоткеями - в этом
случае хоткей будет назначен автоматически. Кроме того при вызове хоткеев по Ctrl+\ 
названия пунктов будут несколько несуразными, с префиксами ~<символ>.
