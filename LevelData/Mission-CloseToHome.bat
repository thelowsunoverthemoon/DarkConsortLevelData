SET ProcultheWary=�;\;/;4;10;1;5;1;1;1;1;"0;2" "1;0" "1;4" "2;1" "2;3" "3;2"
SET ProcultheWarySprite=%next:n=1%_W_%down:n=1%%back:n=4%^|^<v^>^|%down:n=1%%back:n=4%\^|/%down:n=1%%back:n=2%:
SET ProcultheWaryBehav=FOR %%# in (1, 1, 2) DO IF %%#==2 ( FOR /F "tokens=1-4" %%A in ("^!args^!") DO (%\n%
    (^!every^! 35 %%D) ^&^& (%\n%
        SET /A ProcultheWaryrate-=1%\n%
        IF ^^!ProcultheWaryrate^^! EQU 0 (%\n%
            SET ProcultheWaryrate=1%\n%
        )%\n%
    )%\n%
    IF ^^!enemhorz^^! LSS ^^!horz^^! (%\n%
       SET /A enemhorz+=1%\n%
    ) else (%\n%
        SET /A enemhorz-=1%\n%
    )%\n%
    ^!makefire^! %%C %%A ProcultheWary %%D enire enemyfire%\n%
)) else SET args=
SET picture=%ESC%[5;19H_-�����''''�����\_%ESC%[6;15H_�/"       �� ��������۲�_%ESC%[7;12H.���'        `��������������۲�.%ESC%[8;10H.��� '         ������������������۱.%ESC%[9;9H,'              �������������������۲\%ESC%[10;8H/               ���������������������۲�%ESC%[11;7H�              ������������������������۲�%ESC%[12;6H���            ������������������������۲� '%ESC%[13;5H^|               ����������������������۲�    ,%ESC%[14;5H����            ���������������������۲��    :%ESC%[15;5H��۲�             ���������������������۱    �%ESC%[16;5H����۱�                   �����������۲�     :%ESC%[17;5H�������۲�                 ���������۱       .%ESC%[18;5H��������۱                  ��������۱       �%ESC%[19;5H:��������                  ���������۱���    '%ESC%[20;6H:������۱                 �������۱ �۲�   :%ESC%[21;7H.���۱                    �����۲� ��    .%ESC%[22;8H:��۱                    ���۲�        �%ESC%[23;10H�۱                     �          .�%ESC%[24;11H`�.                             .'%ESC%[25;13H`',   .                     ./%ESC%[26;15H'. �                  .-'%ESC%[27;17H'`--._���������""'
SET "pretext=Travel to Earth 1 to destroy Procul the Wary. Feared among deep space traders as the bane of all spacecraft, Procul the Wary is not to be underestimated."
SET enemy=ProcultheWary
FOR %%G in (Somnium Locus Cygnus-Q) DO (
    SET /A "menual+=1"
    FOR /F %%Y in ('SET /A "!menual! * 14"') DO (
        <NUL SET /P "=%ESC%[25;%%YH!menual!) !%%GSprite!"
    )
)
CHOICE /C 123 /N >NUL
%music:t s=Sound Choice%
IF %errorlevel% EQU 1 (
    SET ship=Somnium
) else IF %errorlevel% EQU 2 (
    SET ship=Locus
) else (
    SET ship=Cygnus-Q
)
GOTO :EOF