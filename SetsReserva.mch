/* SetsReserva
* Author: 
* Creation date: 05/06/15
*/
MACHINE SetsReserva(PESSOA, ITEM)
VARIABLES reserva
INVARIANT  reserva : PESSOA +-> ITEM
INITIALISATION reserva := {}
    
OPERATIONS
    
    addReserva(pp, ee) =
    PRE pp : PESSOA &
        ee : ITEM
    THEN reserva := reserva \/ {pp |-> ee}
    END;
    
    removerReserva(pp, ee) =
        PRE pp : PESSOA &
            ee : ITEM 
    THEN reserva := reserva - {pp |-> ee}
    END
    
    
END
