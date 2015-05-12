/* Biblioteca
 * Author: Josiel
 * Creation date: 11/05/2015
 */
MACHINE     Biblioteca
INCLUDES    Usuario,Livro
  
VARIABLES    usuario, livros, reservado, emprestado
INVARIANT    usuario <: USUARIO &
             livros <: LIVRO &
             reservado : usuario >+> livros & 
             emprestado : usuario >+> livros
             
INITIALISATION usuario := {} || 
               livros := {} || 
               reservado := {} || 
               emprestado := {}
    
OPERATIONS

cadastrarLivro ( bb ) =
    PRE bb : LIVRO & bb /: livros
    THEN livros := livros \/ { bb }
    END;
    
reservarLivro ( uu, bb ) = 
    PRE uu : usuario &
        bb : livros & 
        bb : LIVRO & 
        card(livros) > 1
    THEN livros := livros - { bb } ||
        reservado := reservado \/ {uu |-> bb}
         
          
    END;
realizarEmprestimo( uu, bb ) =
    PRE uu : dom(reservado) & 
        bb : ran(reservado)
    THEN reservado := reservado - { uu|-> bb } ||
        emprestado := emprestado \/ { uu|-> bb }
    END
    
END