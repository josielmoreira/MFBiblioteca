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
    BEGIN
        qq := dia
    END
END