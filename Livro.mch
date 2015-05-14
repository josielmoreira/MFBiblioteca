/* Livro
* Author: 
* Creation date: 12/05/15
*/
MACHINE Livro
INCLUDES LivroC
VARIABLES livro, quantidade, biblioteca
INVARIANT livro <: LIVRO & quantidade <: 1..10 & card(quantidade) < 11 &  biblioteca : livro <-> quantidade 
INITIALISATION livro := {} || quantidade := {} || biblioteca := {}
    OPERATIONS
 
    
    adicionaLivro(bb,nn) =
    PRE bb : LIVRO & bb /: livro &
        nn : 1..10 & nn /: quantidade
    THEN biblioteca := biblioteca \/ { bb |-> nn }
    END;
    
    removeLivro(bb) =
    PRE bb : LIVRO &
        bb : livro
    THEN livro := livro - { bb }
    END
    
     
    
END
