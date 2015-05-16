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
        bb /: dom(quantidadeExemplar)
    THEN livro := livro \/ {bb} || 
        quantidadeExemplar := quantidadeExemplar \/ {bb |-> nn}
    END;

    removeLivro(bb) =
    PRE bb : LIVRO & 
        bb : livro &

        (bb : dom(quantidadeExemplar))
    THEN  quantidadeExemplar := {bb} <<| quantidadeExemplar ||
        livro := livro - { bb }

    END
END