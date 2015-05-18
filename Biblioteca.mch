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
         nn : NAT1 &
         bb /: dom(quantidadeExemplar)
    THEN adicionarLivro(bb,nn) 
    END;     
    
reservarLivro ( uu, bb ) = 
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro 
    THEN 
        ANY nn
            WHERE nn : NAT & nn : quantidadeExemplar[{bb}]
            THEN reservado := reservado \/ {uu |-> bb} ||
                removeExemplar(bb,nn)
                
            END
    END;
        
        
realizarEmprestimo( uu, bb) =
        PRE  uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        uu : dom(reservado) & bb : ran(reservado)
    THEN reservado := reservado - { uu|-> (bb)} ||
            emprestado := emprestado \/ { uu|-> (bb)}
    END;
        
devolucao(uu, bb) =
        PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        bb /: ran(reservado) &
        uu /: dom(reservado) &
        bb : ran(emprestado) & uu : dom(emprestado)
        THEN emprestado := emprestado - { uu |-> bb }
        END 
        
END