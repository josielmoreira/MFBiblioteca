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
 
    
    adicionarExemplar(nn) =
    PRE nn : 1..10  
    THEN quantidade := quantidade \/ {nn}
        END;
    
    
    adicionaLivro(bb,nn) =
    PRE bb : LIVRO & bb /: livro &
        nn : quantidade &
        bb /: dom(biblioteca)
    
    THEN biblioteca := biblioteca \/ { bb |-> nn }
    END;
    
    removeLivro(bb) =
    PRE bb : LIVRO &
        bb : livro
    THEN livro := livro - { bb }
    END
    
     
    
END
