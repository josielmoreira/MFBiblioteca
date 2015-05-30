/* Livro
* Author:
* Creation date: 12/05/15
*/
MACHINE Dia
VARIABLES dia
INVARIANT dia : NAT
INITIALISATION dia := 1
OPERATIONS
    
    
    passarDia=
    PRE 1=1
    THEN dia := dia + 1
    END;
    
    qq <-- diaAtual=
    PRE 1=1
    THEN qq := dia
    END
    
END
