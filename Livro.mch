/* Livro
* Author: 
* Creation date: 12/05/15
*/
MACHINE Livro
INCLUDES LivroC
VARIABLES livro, quantidadeExemplar
INVARIANT   livro <: LIVRO  & quantidadeExemplar : livro --> NAT
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
    END;
    
    removeExemplar(bb,nn) =
    PRE bb : LIVRO & 
        bb : livro & 
        nn : NAT1 &
        nn : ran(quantidadeExemplar)
    THEN 
quantidadeExemplar :=  quantidadeExemplar <+ {bb |-> nn-1}
        END;
        
        acrescentaExemplar(bb,nn) =
    PRE bb : LIVRO & 
        bb : livro & 
        nn : NAT1 &
        nn + 1 < MAXINT &
        nn : ran(quantidadeExemplar)
    THEN 
quantidadeExemplar :=  quantidadeExemplar <+ {bb |-> nn + 1}
        END
    
END