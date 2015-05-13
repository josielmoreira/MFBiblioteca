/* Livro
* Author: 
* Creation date: 12/05/15
*/
MACHINE Livro
INCLUDES LivroC
VARIABLES livro,estoque
INVARIANT livro <: LIVRO &
    estoque : NAT & estoque = card(livro)
INITIALISATION livro := {} || estoque := 0
    OPERATIONS
    
    adicionaLivro(bb) =
    PRE bb : LIVRO & bb /: livro 
    THEN livro := livro \/ { bb } || estoque := estoque + 1
    END;
    
    removeLivro(bb) =
    PRE bb : LIVRO &
        bb : livro
    THEN livro := livro - { bb } || estoque := estoque - 1
    END;

    removerDoEstoque(bb) =
    PRE bb : LIVRO &
        bb : livro
    THEN estoque := estoque - 1
        END

    
     
    
END
