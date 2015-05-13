/* Biblioteca
 * Author: Josiel
 * Creation date: 11/05/2015
 */
MACHINE     Biblioteca
INCLUDES    Usuario
EXTENDS     Livro
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
    END
    
END