/* Livro
* Author: 
* Creation date: 12/05/15
*/
MACHINE Livro
INCLUDES LivroC
VARIABLES livro, quantidade, biblioteca
INVARIANT livro <: LIVRO & quantidade <: QUANTIDADE  & biblioteca : livro <-> quantidade
INITIALISATION livro := {} || quantidade := {} || biblioteca := {}
    
    OPERATIONS
    
    adicionaLivro(bb,nn) =
    PRE bb : LIVRO & 
        bb /: livro & 
        nn : QUANTIDADE & 
        nn /: quantidade &
        bb /: dom(biblioteca) &
        nn /: ran(biblioteca)
    THEN biblioteca := biblioteca \/ { bb |-> nn }
    END;
    
    removeLivro(bb) =
    PRE bb : LIVRO &
        bb : livro
    THEN livro := livro - { bb }
    END
    
     
    
END
