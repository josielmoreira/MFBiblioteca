    /* Biblioteca
* Author: Josiel
* Creation date: 11/05/2015
*/
MACHINE     Biblioteca
INCLUDES     Usuario, Livro
VARIABLES   reservado, emprestado
INVARIANT   reservado : usuario <-> livro & 
            emprestado : usuario <-> livro 
    
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
         nn : NAT &
         bb /: dom(quantidadeExemplar)
    THEN adicionarLivro(bb,nn) 
    END;     
    
reservarLivro ( uu, bb ) = 
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
    	(bb : ran(reservado) or bb /: ran(reservado)) &
         quantidadeExemplar(bb) > card(ran(reservado))
    THEN 
        ANY nn
            WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
            THEN reservado := reservado \/ {uu |-> bb} ||
                removeExemplar(bb,nn)
                
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
        
realizarEmprestimo( uu, bb) =
        PRE  uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        uu : dom(reservado) & bb : ran(reservado) &
        (bb : ran(emprestado) or bb /: ran(emprestado))
    THEN reservado := reservado - { uu|-> (bb)} ||
            emprestado := emprestado \/ { uu|-> (bb)}
    END;
        
devolucao( uu, bb ) = 
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        bb : ran(emprestado)
    THEN 
        ANY nn
            WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
            THEN emprestado := emprestado - {uu |-> bb} ||
                acrescentaExemplar(bb,nn) 
            END
    END
END