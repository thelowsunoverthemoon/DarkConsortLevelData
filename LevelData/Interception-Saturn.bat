SET "enemylist=Nubecula ExuroTheHungry Demolior"
SET Demolior=^|;+;x;2;9;1;15;1;1;1;3;"1;1" "1;2" "1;3" "2;1" "2;2" "2;3"
SET DemoliorSprite=%next:n=1%+++%down:n=1%%back:n=4%+€€€+%down:n=1%%back:n=5%+€€€+%down:n=1%%back:n=5%%next:n=1%+++
SET ExuroTheHungry=^|;‹;ﬂ;2;2;2;10;1;2;2;2;"0;0" "0;1" "0;3" "0;4" "1;0" "1;4"
SET ExuroTheHungrySprite=-[ƒ]-%down:n=1%%back:n=5%/ ‹ \
SET Nubecula=^|; ;˙;2;1;1;5;1;2;1;4;"2;0" "2;1" "3;3" "1;3" "1;4"
SET NubeculaSprite= ˙ ˙˙%down:n=1%%back:n=4%ﬁ˙ ﬁ˙%down:n=1%%back:n=5%˙ﬁ˙%down:n=1%%back:n=1%˙
SET DemoliorBehav=FOR %%# in (1 2) DO IF %%#==2 ( FOR /F "tokens=1-4" %%A in ("^!args^!") DO (%\n%
    IF %%A LEQ 1 (%\n%
        SET enemovehorz=+%\n%
    ) else IF %%A GEQ 55 (%\n%
        SET enemovehorz=-%\n%
    )%\n%
    IF %%B EQU 0 (%\n%
        (^!every^! 25 %%D) ^&^& (%\n%
            SET enemcol=%colour:cl=244;153;232%%\n%
            SET enemstate=1%\n%
        ^)%\n%
        IF %%C LEQ 1 (%\n%
            SET enemovevert=+%\n%
        ) else IF %%C GEQ 37 (%\n%
            SET enemovevert=-%\n%
        )%\n%
        FOR %%X in (vert horz) DO (%\n%
            SET /A enem%%X^^!enemove%%X^^!=1%\n%
        )%\n%
    ) else (%\n%
        (^!every^! 20 %%D) ^&^& (%\n%
            SET enemcol=%colour:cl=181;36;3%%\n%
            SET enemstate=0%\n%
        ^)%\n%
    )%\n%
)) else SET args=
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
SET NubeculaBehav=FOR %%# in (1 2) DO IF %%#==2 ( FOR /F "tokens=1-4" %%A in ("^!args^!") DO (%\n%
    (^!every^! 50 %%D) ^&^& (%\n%
        %music:t s=Sound Drone%%\n%
        SET /A "enemhorz=^!RANDOM^! * (55 - 1 + 1) / 32768 + 1"%\n%
        SET /A Nubeculahealth+=1%\n%
    )%\n%
    IF %%C EQU 3 (%\n%
        SET enemovevert=+%\n%
    ) else IF %%C EQU 37 (%\n%
        SET enemovevert=-%\n%
    )%\n%
    SET /A enemvert^^!enemovevert^^!=1%\n%
)) else SET args=
SET picture=%ESC%[7;16H.€€€€€€€€€.        _'-------_'%ESC%[8;14H.∞∞∞∞±±≤≤≤€€€€.  '_---    --_'%ESC%[9;13H.∞∞∞∞∞∞±±≤≤≤€€€€€.        -_'%ESC%[10;12H.     ∞∞∞±±≤≤≤€€€€€.   ---_'%ESC%[11;11H.       ∞∞∞±±≤≤€€€€€. -_'%ESC%[12;11H.      ∞∞∞±±≤≤≤€€---_'%ESC%[13;11H.∞∞∞∞∞∞∞±±±≤≤≤€-_'€€.%ESC%[14;10H-.≤±±±±±±≤≤€--_':€€€.%ESC%[15;7H_-'  .≤≤≤≤≤€-_'€€€€€€€.%ESC%[16;5H'_-     .€€--'€€€€€€€€.%ESC%[17;3H'_---    --_- .€€€€€€€€.%ESC%[18;1H'_--------'
FOR %%Q in (enemy ship) DO (
    FOR %%S in (!%%Qlist!) DO (
        SET /A %%Qcount+=1
        SET %%Q!%%Qcount!=%%S
    )
    SET /A "%%Qrand=!RANDOM! * (!%%Qcount! - 1 + 1^) / 32768 + 1"
)
SET "pretext=They have risen up from the Rings of Saturn yet again; defend Jupiter from their attacks. Perhaps this time, they will finally give up."
SET enemy=!enemy%enemyrand%!
SET ship=!ship%shiprand%!
GOTO :EOF