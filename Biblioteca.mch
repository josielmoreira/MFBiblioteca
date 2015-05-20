/* Biblioteca
* Author: Josiel
* Creation date: 11/05/2015
*/
MACHINE     Biblioteca
INCLUDES     Usuario, Livro
VARIABLES   reservado, emprestado, dia
INVARIANT   reservado : usuario <-> livro & 
            emprestado : usuario <-> livro &
            dia : livro <-> NAT
    
    
    
    
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
        nn : NAT & nn < 5 &
        bb /: dom(quantidadeExemplar)
    THEN  adicionarLivro(bb,nn)
    END;     
    
    reservarLivro ( uu, bb) = 
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro & 
        bb /: ran(reservado) &
        quantidadeExemplar(bb) > card(reservado[{uu}])  &
        card(reservado[{uu}]) < 3
        
    THEN
        ANY nn
        WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
        THEN               
            reservado := reservado \/ {uu |-> bb} ||
            removeExemplar(bb,nn)
            
            
        END
    END;
    
    PassarDia(bb) =
    PRE bb : livro &
        bb : dom(dia) &
        bb : ran(reservado)
    THEN dia := dia <+ {bb |-> dia(bb) + 1} 
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
            acrescentaExemplar(bb,nn) ||
            dia := dia <+ {bb |-> dia(bb) + 1}
            
        END
    END;
    
    realizarEmprestimo( uu, bb, dd) =
    PRE  uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        dd : NAT &  dd /: ran(dia) & 
        uu : dom(reservado) & bb : ran(reservado) &
        (bb : ran(emprestado) or bb /: ran(emprestado))
    THEN 
        IF (dia[{}] = {})
        THEN
            dia := dia \/ {bb |-> dd} 
        ELSE IF (dia(bb) < 4)
            THEN
                reservado := reservado - { uu|-> (bb)} ||
                emprestado := emprestado \/ { uu|-> (bb)} ||
                dia := dia \/ {bb |-> dd}
            ELSE 
                dia := dia <+ {bb |-> dia(bb) + 1}
            END
        END
        
    END;
    
    devolucao( uu, bb, dd) = 
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        dd : NAT & dd > dia(bb) &
        bb : ran(emprestado)
    THEN 
        ANY nn
        WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
        THEN         
            emprestado := emprestado - {uu |-> bb} ||
            acrescentaExemplar(bb,nn) ||
            dia := dia <+ {bb |-> dd - dia(bb) }
            
        END
    END
END