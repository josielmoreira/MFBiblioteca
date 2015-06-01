MACHINE Biblioteca
INCLUDES Usuario,Exemplar
PROMOTES adicionarTitulo,AdicionarExemplar
EXTENDS Dia
VARIABLES reservado, emprestado,saldo
INVARIANT reservado <: usuario * dom(exemplar) &
    emprestado <: usuario * dom(exemplar) &
    saldo : usuario +-> NAT
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
        ll : TITULO &
        ll : dom(exemplar) &
        ll : ran(titulo) &
        uu /: dom(emprestado) &
        card(reservado[{uu}]) < 2 &
        uu /: dom(reservado) &
        exemplar(ll) > 0 &
        dia < MAXINT
    THEN IF saldo(uu) < 5
        THEN
            reservado := reservado \/ {uu |-> ll} ||
            saldo := saldo <+ {uu |-> 0} ||
            RemoverExemplar(ll)
        ELSE
            ANY dd
            WHERE dd = saldo(uu)
            THEN
                saldo := saldo <+ {uu |-> dd - 1} ||
                passarDia
            END
        END
    END;
    emprestimoLivro(uu,ll,dd) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : TITULO &
        ll : dom(exemplar) &
        ll : ran(reservado) &
        uu : dom(reservado) &
        dd : NAT1 &
        dd = dia
    THEN
        reservado := reservado - {uu |-> ll} ||
        saldo := saldo <+ {uu |-> dd} ||
        emprestado := emprestado \/ {uu |-> ll}
    END;
    DevolucaoLivro(uu,ll,dd) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : TITULO &
        ll : dom(exemplar) &
        uu : dom(emprestado) &
        ll : ran(emprestado) &
        dd : NAT1 &
        dd = dia &
        exemplar(ll) < MAXINT
    THEN
        ANY tt
        WHERE tt = saldo(uu)
        THEN
            emprestado := emprestado- {uu |-> ll} ||
            saldo := saldo <+ {uu |-> dd - tt} ||
            AcrescentarExemplar(ll)
        END
    END
END
