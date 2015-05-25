/* Exemplar
 * Author: Josiel
 * Creation date: 23/05/2015
 */
MACHINE            Exemplar
EXTENDS            Titulo_ctx, Exemplar_ctx    
VARIABLES          exemplar 
INVARIANT          exemplar : EXEMPLAR --> TITULO
INITIALISATION     exemplar := {}
OPERATIONS
    
    cadastrarExemplar( ee, tt ) =
    PRE ee : EXEMPLAR &
        tt : TITULO
    THEN
        exemplar := exemplar \/ {ee |-> tt}
    END
    

END
