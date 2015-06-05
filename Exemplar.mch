MACHINE Exemplar
EXTENDS Titulo
VARIABLES exemplar
INVARIANT exemplar: ran(titulo) +-> NAT
INITIALISATION exemplar := {}
OPERATIONS
    AdicionarExemplar(ll, nn) =
    PRE ll : TITULO &
        ll : ran(titulo) &
        ll /: dom(exemplar) &
        nn : NAT1
    THEN exemplar := exemplar \/ {ll |-> nn}
    END;
    
    RemoverExemplar(ll) =
    PRE ll : TITULO &
        ll : dom(exemplar) &
        exemplar(ll) > 0
    THEN
        exemplar(ll) := exemplar(ll) - 1
    END;
    
    AcrescentarExemplar(ll) =
    PRE ll : TITULO &
        ll : dom(exemplar) &
        exemplar(ll) < MAXINT
    THEN
        exemplar(ll) := exemplar(ll) + 1
    END;
    
    ee <-- queryExemplar ( ll ) =
        PRE ll : TITULO &
            ll : dom(exemplar) 
        THEN ee := exemplar(ll)
        END
            
END