/* Livro
* Author: 
* Creation date: 12/05/15
*/
MACHINE Livro
INCLUDES LivroC
VARIABLES livro, quantidadeExemplar
INVARIANT   livro <: LIVRO  & quantidadeExemplar : livro --> NAT1
INITIALISATION livro := {} || quantidadeExemplar := {}
OPERATIONS
    
    adicionarLivro(bb,nn) =
    PRE bb : LIVRO &
        bb /: livro &
        nn : NAT1 &
        (nn /: ran(quantidadeExemplar)or nn : ran(quantidadeExemplar)) &
        bb /: dom(quantidadeExemplar)
        
    THEN livro := livro \/ {bb} || 
        quantidadeExemplar := quantidadeExemplar \/ {bb |-> nn}
    END;

    removeLivro(bb,nn) =
    PRE bb : LIVRO & 
        bb : livro &
        nn : NAT1 &
        bb : dom(quantidadeExemplar) & 
        nn : ran(quantidadeExemplar)
    THEN  quantidadeExemplar := quantidadeExemplar - { bb |-> nn } ||
        livro := livro - { bb }

    END
END
