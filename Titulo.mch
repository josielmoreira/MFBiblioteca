/* Exemplar
* Author: Josiel
* Creation date: 23/05/2015
*/
MACHINE            Titulo
EXTENDS            Titulo_ctx    
VARIABLES          titulo
INVARIANT          titulo : seq(TITULO)
INITIALISATION     titulo := []
OPERATIONS
    
    adicionarTitulo(ll) =
    PRE ll : TITULO &
	    ll /: ran(titulo)
    THEN titulo := titulo <- ll
    END;
    
    
    removerTitulo(ll) =
    PRE ll : TITULO & ll : ran(titulo)
    THEN
        ANY pp
        WHERE pp = titulo~(ll)
        THEN
            titulo := (titulo /|\ pp-1) ^ (titulo \|/ pp)
        END
    END
    
    
END