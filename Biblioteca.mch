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
    PRE bb : livro & bb /: ran(reservado) & bb /: ran(emprestado)
    THEN removeLivro(bb)
    END; 
    
    
    reservarLivro ( uu, bb ) = 
    PRE uu : usuario &
        bb : livro &
        uu /: dom(reservado) &
        bb /: ran(reservado) 
    THEN reservado := reservado \/ {uu |-> bb}
        
        
    END;
    realizarEmprestimo( uu, bb ) =
    PRE uu : dom(reservado) & 
        bb : ran(reservado) 
    THEN reservado := reservado - { uu|-> bb } ||
        emprestado := emprestado \/ { uu|-> bb }
    END;
    
    
    devolucao(uu, bb) =
    PRE uu : dom(emprestado) &
        bb : ran(emprestado)
    THEN emprestado := emprestado - { uu |-> bb }
        END 
        
    
    
END
