/* Biblioteca
* Author: Josiel
* Creation date: 11/05/2015
*/
MACHINE     Biblioteca
INCLUDES    Usuario, Livro
VARIABLES    reservado, emprestado
INVARIANT    reservado : usuario <-> livro & 
             emprestado : usuario <-> livro
             
             
      
INITIALISATION reservado := {} || 
    emprestado := {} 
    
OPERATIONS
    
    
    cadastrarUsuario ( uu ) =
    PRE uu : USUARIO & uu /: usuario
    THEN adicionaUsuario(uu) 
    END;
    
    
    cadastrarLivro ( bb ) =
    PRE bb : LIVRO & bb /: livro 
    THEN adicionaLivro(bb) 
    END;    
    
    removerLivro ( bb ) =
    PRE bb : LIVRO & bb : livro & 
        bb /: ran(reservado) & 
        bb /: ran(emprestado)
    THEN removeLivro(bb) 
    END; 
    
    
    reservarLivro ( uu, bb ) = 
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        (uu : dom(reservado) or uu /: dom(reservado)) &
        bb /: ran(reservado) &
	    bb /: ran(emprestado) & 
	    card(livro) > 1 & 
	    card(reservado) < 4
    THEN reservado := reservado \/ {uu |-> bb}
    END;
    
    cancelarReserva(uu, bb) = 
    PRE uu : USUARIO &
        uu : usuario &
        bb : LIVRO &
        bb : livro &
        bb : ran(reservado) &
        bb /: ran(emprestado)
        THEN reservado := reservado - {uu |-> bb}
        END; 
        
        realizarEmprestimo( uu, bb ) =
        PRE uu : USUARIO &
            bb : LIVRO &
            uu : dom(reservado) & 
            bb : ran(reservado) 
        THEN reservado := reservado - { uu|-> bb } ||
            emprestado := emprestado \/ { uu|-> bb } ||  
            removerDoEstoque(bb)
            
        END;
        
        
        devolucao(uu, bb) =
        PRE uu : USUARIO &
            bb : LIVRO &
            uu : dom(emprestado) &
            bb : ran(emprestado)
        THEN emprestado := emprestado - { uu |-> bb }
        END 
END
