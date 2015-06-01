/* Titulo
* Author:
* Creation date: 12/05/15
*/
MACHINE Exemplar
INCLUDES Titulo
PROMOTES adicionarTitulo
VARIABLES exemplar
INVARIANT exemplar: ran(titulo) +-> NAT
INITIALISATION exemplar := {}
OPERATIONS
    
    AdicionarExemplar(ll, nn) =
    PRE ll : TITULO  & 
        ll : ran(titulo) &
        ll /: dom(exemplar) &
        nn : NAT1
    THEN exemplar := exemplar\/ {ll |-> nn}
    END;
    
    
    /*
    RemoverTitulos(ll) =
    PRE ll : TITULO & 
        ll : ran(titulo) &
        ll : dom(exemplar)
    THEN exemplar := {ll} <<| exemplar ||
        removerTitulo(ll)
    END;
    */
    
    RemoverExemplar(ll) =
    PRE ll : TITULO &
        ll : dom(exemplar) &
        exemplar(ll) > 0
        
    THEN
        exemplar := exemplar <+ {ll |-> exemplar(ll) - 1}
    END;
    
    AcrescentarExemplar(ll) =
    PRE ll : TITULO &
        ll : dom(exemplar) &
         exemplar(ll) < MAXINT
    THEN
        exemplar := exemplar <+ {ll |-> exemplar(ll) + 1}
    END
END