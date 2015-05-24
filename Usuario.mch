/* Usuario
* Author: 
* Creation date: 11/05/15
*/
MACHINE Usuario
    
EXTENDS UsuarioC
VARIABLES usuario, dia
INVARIANT usuario <: USUARIO & dia <: usuario * INT
INITIALISATION usuario := {} || dia := {}
OPERATIONS
    
    adicionaUsuario(uu) =
    PRE uu : USUARIO & uu /: usuario
    THEN usuario := usuario \/ { uu } ||
         dia := dia \/ {uu |-> 0}
    END;
    
    removeUsuario(uu) =
    PRE uu : USUARIO &
        uu : usuario
    THEN usuario := usuario - { uu }
    END;
    
    zerardia(uu) =
    PRE uu : USUARIO & uu : usuario
    THEN dia := dia <+ {uu |-> 0}
        END;
    
    PassarDia(uu) =
    PRE uu : USUARIO &
        uu : usuario &
        uu : dom(dia)
    THEN dia := dia <+ {uu |-> dia(uu) - 1} 
    END;
    
    
    dias(uu,dd ) =
    PRE uu : USUARIO &
        uu : usuario &
        dd : NAT &
        uu : dom(dia)
    THEN dia := dia <+ {uu |-> dd} 
    END;

    
    atraso(uu,dd) =
    PRE uu : USUARIO &
        uu : usuario &
        uu : dom(dia) &
        dd : NAT 
    THEN dia := dia <+ {uu |-> dd - dia(uu)} 
    END
    
    
    
END

