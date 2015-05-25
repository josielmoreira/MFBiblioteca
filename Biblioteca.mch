MACHINE Biblioteca
INCLUDES Usuario, Livro
VARIABLES reservado, emprestado, dia
INVARIANT  dia <: (usuario * livro) * INT &
           reservado <: usuario * livro &
           emprestado <: usuario * livro
           
INITIALISATION reservado := {} ||
    emprestado := {} ||
    dia := {}
OPERATIONS
    
    cadastrarUsuario ( uu ) =
    PRE uu : USUARIO & uu /: usuario
    THEN adicionaUsuario(uu)
    END;
    
    cadastrarLivro (bb,nn) =
    PRE bb : LIVRO &
        bb /: livro &
        nn : NAT
    THEN adicionarLivro(bb,nn)
    END;
    
    reservarLivro ( uu, bb) =
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        quantidadeExemplar(bb) > 0
    THEN
        IF dia = {}
        THEN
            ANY nn
            WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
            THEN
                dia := dia <+ {uu |-> bb |-> 0} || 
                reservado := reservado \/ {uu |-> bb} ||
                removeExemplar(bb,nn)
                END
        ELSE IF dia /= {} & dia(uu |-> bb) >= 0 & dia(uu|->bb) < 5
        THEN
            ANY nn
            WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
            THEN
                dia := dia <+ {uu |-> bb |-> 0} || 
                reservado := reservado \/ {uu |-> bb} ||
                removeExemplar(bb,nn)
            END
        ELSE
            reservado := {uu} <<| reservado ||
            dia := dia <+ {uu |-> bb |-> dia(uu|->bb) - 1}
        END
        END
    END;
   
    cancelarReservar( uu, bb ) =
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        bb : ran(reservado)
    THEN
        ANY nn
        WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
        THEN reservado := reservado - {uu |-> bb} ||
            acrescentaExemplar(bb,nn)
        END
    END;
    
    realizarEmprestimo( uu, bb, dd) =
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        dd : NAT & dd /: ran(dia) &
        dd > dia(uu|->bb) &
        uu : dom(reservado) & bb : ran(reservado)
    THEN
        reservado := reservado - { uu|-> (bb)} ||
        emprestado := emprestado \/ { uu|-> (bb)} ||
        dia := dia <+ {uu |-> bb |-> dd}
    END;
    
    
    devolucao( uu, bb, dd) =
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        dd : NAT &
        dd >= (dia(uu|->bb)) &
        bb : ran(emprestado) & uu : dom(emprestado)
    THEN
        ANY nn
        WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
        THEN
            emprestado := emprestado - {uu |-> bb} ||
            acrescentaExemplar(bb,nn) ||
            dia := dia <+ {uu |-> bb |-> dd - dia(uu |-> bb)}
        END
    END
END
