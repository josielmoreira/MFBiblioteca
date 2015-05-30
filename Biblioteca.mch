MACHINE Biblioteca
INCLUDES Usuario,Exemplar
PROMOTES adicionarTitulo,AdicionarExemplar
EXTENDS Dia
VARIABLES reservado, emprestado,saldo
INVARIANT reservado : usuario +-> ran(titulo) &
    emprestado : usuario +-> ran(titulo) &
    saldo <: usuario * NAT
    
INITIALISATION reservado := {} ||
    emprestado := {} ||
    saldo := {}
OPERATIONS
    
    AdicionarUsuario ( uu ) =
    PRE uu : USUARIO & 
        uu /: usuario
    THEN cadastrarUsuario(uu) ||
        saldo := saldo \/ {uu |-> 0}
    END;
    
    reservarLivro(uu,ll) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : ran(titulo) &
        card(reservado[{uu}]) < 2 &
        uu /: dom(reservado) &
        exemplar(ll) > 0
    THEN IF saldo(uu) < 5
        THEN
            reservado := reservado \/ {uu |-> ll} ||
            saldo := saldo <+ {uu |-> 0} ||
            RemoverExemplar(ll)
        ELSE 
            ANY dd
            WHERE dd = saldo(uu)
            THEN
                saldo := saldo <+ {uu |-> dd-1} ||
                passarDia
            END
        END
    END;
    
    
    
    emprestimoLivro(uu,ll,dd) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : ran(titulo) &
        ll : ran(reservado) &
        uu : dom(reservado) &
        dd = dia
    THEN 
        reservado := reservado - {uu |-> ll} ||
        saldo := saldo <+ {uu |-> dd} ||
        emprestado := emprestado \/ {uu |-> ll}
    END;
    
    
    DevolucaoLivro(uu,ll,dd) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : ran(titulo) &
        uu : dom(emprestado) &
        ll : ran(emprestado) &
        dd = dia
    THEN 
        ANY tt
        WHERE tt = saldo(uu)
        THEN
            emprestado := emprestado- {uu |-> ll} ||
            saldo := saldo <+ {uu |-> dd-tt} ||
            AcrescentarExemplar(ll)
        END
    END
    
    
END