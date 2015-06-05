/* Exemplar
* Author: Josiel
* Creation date: 23/05/2015
*/
MACHINE            Titulo
SETS               TITULO
VARIABLES          titulo
INVARIANT          titulo : seq(TITULO)
INITIALISATION     titulo := []
OPERATIONS
    
    adicionarTitulo(ll) =
    PRE ll : TITULO &
        ll /: ran(titulo)
    THEN titulo := titulo <- ll
    END
    
    
END