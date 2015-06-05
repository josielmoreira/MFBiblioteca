/* SetsExemplar
 * Author: Josiel
 * Creation date: 04/06/2015
 */
MACHINE SetsExemplar(ITEM)
VARIABLES sete
INVARIANT sete : ITEM +-> NAT
INITIALISATION sete := {}
OPERATIONS
    
    add(ee,nn) =
    PRE ee : ITEM &
        nn : NAT & 
        sete\/{ee|->nn}: ITEM +-> NAT 
    THEN
        sete := sete \/ {ee |-> nn}
    END;
    
    removerItem(ee) =
    PRE ee : ITEM &
        ee : dom(sete)
    THEN
        sete(ee) := sete(ee) - 1
        END
    
END
