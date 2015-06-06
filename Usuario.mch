MACHINE Usuario
SETS USUARIO
VARIABLES usuario, saldo
INVARIANT usuario <: USUARIO &
          saldo : usuario +-> NAT
INITIALISATION usuario := {} ||
    saldo := {}
OPERATIONS
    
    CadastrarUsuario ( uu ) =
    PRE uu : USUARIO &
        uu /: usuario
    THEN usuario := usuario \/ { uu } ||
        saldo(uu) := 0
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
        dd : NAT &
        dd + saldo(uu) < 100
    THEN 
        IF saldo(uu) > 0
        THEN
            saldo(uu) := saldo(uu) + dd
        ELSE
            skip
        END
    END;
    
    ss <-- verSaldo(uu) =
    PRE uu : USUARIO &
        uu : usuario
        THEN
        ss := saldo(uu)
    END;
    
    
    atraso(uu, dd) =
    PRE uu : USUARIO &
        uu : usuario &
        dd : NAT &
        dd > saldo(uu)
    THEN 
        IF saldo(uu) > 0
        THEN
            saldo(uu) := dd - saldo(uu)
        ELSE
            skip
        END
    END
END