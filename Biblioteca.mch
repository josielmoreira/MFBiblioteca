MACHINE Biblioteca
INCLUDES Usuario,Livros
PROMOTES adicionarExemplar,AdicionarLivro
USES Dia
VARIABLES reservado, emprestado,saldo
INVARIANT reservado : usuario +-> ran(exemplar) &
          emprestado : usuario +-> ran(exemplar) &
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
        ll : ran(exemplar) &
        card(reservado[{uu}]) < 2 &
        uu /: dom(reservado) &
        livros(ll) > 0
    THEN IF saldo(uu) < 5
            THEN
            reservado := reservado \/ {uu |-> ll} ||
            saldo := saldo <+ {uu |-> 0} ||
            RemoverExemplar(ll)
        ELSE 
            ANY dd
            WHERE dd = saldo(uu)
            THEN
                saldo := saldo <+ {uu |-> dd-1}
                END
            END
    END;
    
    emprestimoLivro(uu,ll,dd) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : ran(exemplar) &
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
        ll : ran(exemplar) &
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