/* Titulo
* Author:
* Creation date: 12/05/15
*/
MACHINE Livros
INCLUDES Exemplar
PROMOTES adicionarExemplar
VARIABLES livros
INVARIANT livros : EXEMPLAR +-> NAT
INITIALISATION livros := {}
OPERATIONS
    
    AdicionarLivro(ll, nn) =
    PRE ll : EXEMPLAR  & 
        ll : ran(exemplar) &
        ll /: dom(livros) &
        nn : NAT1
    THEN livros := livros \/ {ll |-> nn}
    END;
    
    RemoverLivro(ll) =
    PRE ll : EXEMPLAR  & 
        ll : ran(exemplar) &
        ll : dom(livros)
    THEN livros := {ll} <<| livros ||
        removerExemplares(ll)
    END;
    
    RemoverExemplar(ll) =
    PRE ll : EXEMPLAR &
        ll : dom(livros)
    THEN
        livros := livros <+ {ll |-> livros(ll) -1}
    END;
    
    AcrescentarExemplar(ll) =
    PRE ll : EXEMPLAR &
        ll : dom(livros)
    THEN
        livros := livros <+ {ll |-> livros(ll) + 1}
    END
END