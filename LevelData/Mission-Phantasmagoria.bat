SET Galaktos=²;Ò;^|;4;10;1;5;1;3;1;3;"2;1" "1;2" "1;3" "1;6" "1;7" "2;7"
SET GalaktosSprite=%next:n=2%Ò    Ò%down:n=1%%back:n=8%v::[  ]::v%down:n=1%%back:n=9%Ò      Ò
SET GalaktosBehav=FOR %%# in (1 2) DO IF %%#==2 ( FOR /F "tokens=1-4" %%A in ("^!args^!") DO (%\n%
    IF %%B EQU 0 (%\n%
        IF ^^!enemhorz^^! LSS ^^!horz^^! (%\n%
           SET /A enemhorz+=1%\n%
        ) else (%\n%
            SET /A enemhorz-=1%\n%
        )%\n%
        ^!makefire^! %%C %%A Galaktos %%D enire enemyfire%\n%
        (^!every^! 40 %%D) ^&^& (%\n%
            SET enemstate=1%\n%
        )%\n%
    ) else (%\n%
        IF ^^!enemvert^^! LSS ^^!vert^^! (%\n%
           SET /A enemvert+=1%\n%
        ) else IF ^^!enemvert^^! GTR ^^!vert^^! (%\n%
            SET /A enemvert-=1%\n%
        )%\n%
        (^!every^! 30 %%D) ^&^& (%\n%
            SET enemstate=0%\n%
        )%\n%
    )%\n%
)) else SET args=
SET picture=%ESC%[29;38HÛ%ESC%[30;37HÛ²Û%ESC%[31;36HÛ²±²Û%ESC%[32;37HÛ²Û%ESC%[33;38HÛ
SET "pretext=Galaktos - the ruthless malignity of the galaxy. Formed from the gas clouds of the Eagle Nebula, Galaktos has roamed free throughout the Solar System. Destroy it. You have been given a war torn Acrius-X52."
SET enemy=Galaktos
SET ship=Acrius-X52
GOTO :EOF