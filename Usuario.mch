
/* Usuario
* Author: Josiel
* Creation date: 23/05/2015
*/
MACHINE        Usuario
SETS           USUARIO
VARIABLES      usuario, saldo
INVARIANT      usuario <: USUARIO & 
               saldo : usuario +-> NAT
INITIALISATION usuario := {} || 
               saldo := {}
OPERATIONS
    
    CadastrarUsuario ( uu ) =
    PRE uu : USUARIO & 
        uu /: usuario
    THEN usuario := usuario \/ { uu } ||
         saldo := saldo \/ {uu |-> 0}
    END;
    
    ZerarSaldo(uu) =
    PRE uu : USUARIO &
        uu : usuario
    THEN saldo(uu) := 0
    END;
    
    DecrementarSaldoUsuario(uu) =
    PRE uu : USUARIO &
        uu : usuario &
        saldo(uu) > 0
    THEN saldo(uu) := saldo(uu) - 1
        END;
    
    AtualizarSaldoUsuario(uu, dd) =
    PRE uu : USUARIO &
        uu : usuario &
        dd : NAT
    THEN saldo(uu) := saldo(uu) + dd
    END;
    
    DiasCorridos(uu, dd) =
    PRE uu : USUARIO &
        uu : usuario &
        dd : NAT
    THEN saldo(uu) := dd - saldo(uu) 
        END
        
    
END