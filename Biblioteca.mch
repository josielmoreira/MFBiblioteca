MACHINE Biblioteca
EXTENDS Usuario,Exemplar, Dia
VARIABLES reservado, emprestado
INVARIANT reservado : usuario +-> dom(exemplar) &
          emprestado : usuario +-> dom(exemplar)
          
INITIALISATION reservado := {} ||
               emprestado := {}

OPERATIONS
       
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
        dia < 366
    THEN IF saldo(uu) < 5
        THEN
            reservado := reservado \/ {uu |-> ll} ||
            ZerarSaldo(uu) ||
            RemoverExemplar(ll)
        ELSE
                DecrementarSaldoUsuario(uu)  ||
                passarDia
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
        dd = dia &
        dd + saldo(uu) < 100
    THEN
        reservado := reservado - {uu |-> ll} ||
        AtualizarSaldoUsuario(uu, dd)  ||
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
        exemplar(ll) < MAXINT &
        dd > saldo(uu)
    THEN
            emprestado := emprestado - {uu |-> ll} ||
            atraso(uu, dd)  ||
            AcrescentarExemplar(ll)
    END
END