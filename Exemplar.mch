/* Exemplar
 * Author: Josiel
 * Creation date: 23/05/2015
 */
MACHINE            Exemplar
USES               Titulo
VARIABLES          exemplar 
INVARIANT          exemplar : ran(titulos) --> NAT
INITIALISATION     exemplar := ran(titulos) * {0}
OPERATIONS
    
    AdicionarExemplar( ee, nn ) =
    PRE ee : ran(titulos) &
        nn : NAT
    THEN
        exemplar(ee):= nn
    END
    

END
