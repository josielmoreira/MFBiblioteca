/* Titulo
* Author:
* Creation date: 12/05/15
*/
MACHINE Titulo
INCLUDES Titulo_ctx
VARIABLES exemplar
INVARIANT exemplar : seq(TITULO)
INITIALISATION exemplar := []
OPERATIONS
    adicionarExemplar(bb) =
    PRE bb : TITULO &
        bb /: ran(exemplar)
    THEN exemplar := exemplar <- bb
    END;
    
    removerExemplar(bb) =
    PRE bb : TITULO & bb : ran(exemplar)
    THEN
        LET pp
        BE pp = exemplar~(bb)
        IN exemplar := (exemplar /|\ pp-1) ^ (exemplar \|/ pp)
        END
    END
END