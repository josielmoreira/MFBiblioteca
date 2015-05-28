/* Exemplar
* Author: Josiel
* Creation date: 23/05/2015
*/
MACHINE            Exemplar
EXTENDS            Exemplar_ctx    
VARIABLES          exemplar
INVARIANT          exemplar : iseq(EXEMPLAR)
INITIALISATION     exemplar := {}
OPERATIONS
    
    adicionarExemplar(ll) =
    PRE ll : EXEMPLAR &
	    ll /: ran(exemplar)
    THEN exemplar := exemplar <- ll
    END;
    
    
    removerExemplar(ll) =
    PRE ll : EXEMPLAR & ll : ran(exemplar)
    THEN
        ANY pp
        WHERE pp = exemplar~(ll)
        THEN
            exemplar := (exemplar /|\ pp-1) ^ (exemplar \|/ pp)
        END
    END
    
    
END