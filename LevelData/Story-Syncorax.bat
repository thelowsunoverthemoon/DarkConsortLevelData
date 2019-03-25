SET ExuroTheHungry=^|;Ü;ß;2;2;2;10;1;2;2;2;"0;0" "0;1" "0;3" "0;4" "1;0" "1;4"
SET ExuroTheHungrySprite=-[Ä]-%down:n=1%%back:n=5%/ Ü \
SET ExuroTheHungryBehav=FOR %%# in (1 2) DO IF %%#==2 ( FOR /F "tokens=1-4" %%A in ("^!args^!") DO (%\n%
    IF %%B EQU 0 (%\n%
        (^!every^! 20 %%D) ^&^& (%\n%
            SET enemstate=1%\n%
            SET enemcol=%colour:cl=96;186;183%%\n%
        )%\n%
        FOR %%J in (vert horz) DO (%\n%
            IF ^^!enem%%J^^! LSS ^^!%%J^^! (%\n%
                SET /A enem%%J+=1%\n%
            ) else (%\n%
                SET /A enem%%J-=1%\n%
            )%\n%
        )%\n%
    ) else (%\n%
        (^!every^! 30 %%D) ^&^& (%\n%
            SET enemcol=%colour:cl=181;36;3%%\n%
            SET enemstate=0%\n%
        )%\n%
    )%\n%
)) else SET args=
::Ships <projectile> <frame1> <frame2> <center> <rate> <speed> <health> <rate of projectile> <numfire> <damage> <height> <hitspots>
SET GigasTheSteady=ß;^^;^|;10;5;1;10;1;1;1;3;"2;1" "2;3" "2;9" "2;11" "2;17" "2;19"
SET GigasTheSteadySprite=%next:n=2%^|%next:n=15%^|%down:n=1%%back:n=18%/ \-.-=- ^| -=.--/ \%down:n=1%%back:n=20%^^-^^-^^    ú-ú    ^^-^^-^^
SET GigasTheSteadyBehav=FOR %%# in (1 2) DO IF %%#==2 ( FOR /F "tokens=1-4" %%A in ("^!args^!") DO (%\n%
    IF %%B EQU 0 (%\n%
        (^!every^! 20 %%D) ^&^& (%\n%
            SET enemcol=%colour:cl=181;36;3%%\n%
            SET enemstate=1%\n%
        )%\n%
        IF ^^!enemvert^^! LSS ^^!vert^^! (%\n%
           SET /A enemvert+=2%\n%
        ) else (%\n%
            SET /A enemvert-=2%\n%
        )%\n%
    ) else (%\n%
        (^!every^! 30 %%D) ^&^& (%\n%
            SET enemstate=0%\n%
            SET enemcol=%colour:cl=96;186;183%%\n%
        )%\n%
        IF ^^!enemhorz^^! LSS ^^!horz^^! (%\n%
           SET /A enemhorz+=1%\n%
        ) else (%\n%
            SET /A enemhorz-=1%\n%
        )%\n%
        SET /A "GigasTheSteadycenter=%%A - 10"%\n%
        ^!makefire^! %%C %%A GigasTheSteady %%D enire enemyfire%\n%
    )%\n%
)) else SET args=
SET picture=%ESC%[35;10HÛÛ²%ESC%[36;9HÛ²²±²%ESC%[37;9H²²±°Û%ESC%[38;10HÛ²Û
SET choicetext=Syncorax
GOTO :EOF