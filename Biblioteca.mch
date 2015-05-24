MACHINE     Biblioteca
INCLUDES     Usuario, Livro
VARIABLES   reservado, emprestado
INVARIANT   reservado <: usuario * livro & 
            emprestado <: usuario * livro
    
INITIALISATION reservado := {} || 
    emprestado := {} 
    
    
OPERATIONS
    
    
    cadastrarUsuario ( uu ) =
    PRE uu : USUARIO & uu /: usuario
    THEN adicionaUsuario(uu) 
    END;
    
    cadastrarLivro (bb,nn) =
    PRE bb : LIVRO &
        bb /: livro &
        nn : NAT
    THEN  adicionarLivro(bb,nn)
    END;     
    
    passarDia(uu) =
    PRE uu : USUARIO &
        uu : usuario &
        dia(uu) > 4 &
        uu /: dom(emprestado)
    THEN PassarDia(uu)
    END;
    
    reservarLivro ( uu, bb) = 
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        quantidadeExemplar(bb) > card(reservado[{uu}])  &
        card(reservado[{uu}]) < 3
        
    THEN
        IF dia(uu) >= 0 & dia(uu) < 5
        THEN
            ANY nn
            WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
            THEN               
                reservado := reservado \/ {uu |-> bb} ||
                zerardia(uu) ||
                removeExemplar(bb,nn)
            END
        ELSE 
            reservado := {uu} <<| reservado ||
            PassarDia(uu)
            
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
    PRE  uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        dd : NAT &  dd /: ran(dia) & 
        dd >  dia(uu) &
        uu : dom(reservado) & bb : ran(reservado)
    THEN 
            reservado := reservado - { uu|-> (bb)} ||
            emprestado := emprestado \/ { uu|-> (bb)} ||
            dias(uu,dd)
        END;
        
        devolucao( uu, bb, dd) = 
        PRE uu : USUARIO &
            bb : LIVRO &
            uu : usuario &
            bb : livro &
            dd : NAT &
            dd >=  dia(uu) &
            bb : ran(emprestado) & uu : dom(emprestado)
        THEN 
            ANY nn
            WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
            THEN         
                emprestado := emprestado - {uu |-> bb} ||
                acrescentaExemplar(bb,nn) ||
                atraso(uu,dd)
                
                
            END
        END
    END