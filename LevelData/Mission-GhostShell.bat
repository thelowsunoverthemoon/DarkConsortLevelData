SET Roguedir1=vert-
SET Roguedir2=vert+
SET Roguedir3=horz-
SET Roguedir4=horz+
SET RogueLocus=Ý;+;x;0;9;2;7;1;1;1;3;"0;0" "0;2" "1;0" "1;2" "2;1" 
SET RogueLocusSprite=°%next:n=1%°%down:n=1%%back:n=3%+°+%down:n=1%%back:n=2%+
SET RogueLocusBehav=FOR %%# in (1 2) DO IF %%#==2 ( FOR /F "tokens=1-4" %%A in ("^!args^!") DO (%\n%
    (^!every^! 40 %%D) ^&^& (%\n%
        IF ^^!RogueLocusRate^^! GTR 1 (%\n%
            SET /A RogueLocusRate-=1%\n%
        )%\n%
    )%\n%
    FOR /F %%G in ('SET /A "^!RANDOM^! * (4 - 1 + 1) / 32768 + 1"') DO (%\n%
        SET /A enem^^!Roguedir%%G^^!=1%\n%
        (SET /A "1/(((~(57-^!enemhorz^!)>>31)&1)&((~(^!enemhorz^!-0)>>31)&1)&(((0-^!enemvert^!)>>31)&1)&((~(37-^!enemvert^!)>>31)&1))" 2^>NUL) ^|^| (%\n%
            SET /A enem^^!Roguedir%%G^^!=-1%\n%
        )%\n%
    )%\n%
    ^!makefire^! %%C %%A RogueLocus %%D enire enemyfire%\n%
)) else SET args=
SET picture=%ESC%[5;24H²  Û%ESC%[6;23HÛ ±°²%ESC%[7;24H±Û°%ESC%[8;23H²±±°Û%ESC%[9;24HÛ
SET "pretext=Thousands of our own ships have been stolen. The Nest grows ever stronger; every day, weaker systems fall to the hypnotic rule of The Nest. We've tracked down a rogue ship coming from the Andromeda. Destroy it."
SET enemy=RogueLocus
SET ship=Locus
GOTO :EOF
