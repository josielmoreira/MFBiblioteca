/* SetsExemplar
* Author: Josiel
* Creation date: 04/06/2015
*/
MACHINE SetsExemplar(ITEM)
VARIABLES sete
INVARIANT sete : ITEM +-> NAT
INITIALISATION sete := {}
OPERATIONS
    
    addSet(ee,nn) =
    PRE ee : ITEM &
        nn : NAT & 
        sete\/{ee|->nn}: ITEM +-> NAT 
    THEN
        sete := sete \/ {ee |-> nn}
    END;
    
    remove(ee) =
    PRE ee : ITEM
    THEN
        IF sete(ee) > 0
        THEN
            sete(ee) := sete(ee) - 1
        ELSE 
            skip
        END
    END;
    
    add(ee) =
    PRE ee : ITEM
    THEN
        IF sete(ee) < MAXINT
        THEN
            sete(ee) := sete(ee) + 1
        ELSE 
            skip
        END
    END
    
    
END