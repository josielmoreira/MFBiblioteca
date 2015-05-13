/* Livro
* Author: 
* Creation date: 12/05/15
*/
MACHINE Livro
INCLUDES LivroC
VARIABLES livro
INVARIANT livro <: LIVRO
INITIALISATION livro := {}
    OPERATIONS
    
    adicionaLivro(bb) =
    PRE bb : LIVRO & bb /: livro 
    THEN livro := livro \/ { bb }
    END;
    
    removeLivro(bb) =
    PRE bb : LIVRO &
        bb : livro
    THEN livro := livro - { bb }
    END
    
     
    
END
