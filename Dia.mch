MACHINE Dia
VARIABLES dia
INVARIANT dia : NAT
INITIALISATION dia := 1
OPERATIONS
    passarDia=
    PRE dia < MAXINT
    THEN dia := dia + 1
    END;
    qq <-- diaAtual=
    PRE 1=1
    THEN qq := dia
    END
END