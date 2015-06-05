/* SetsDia
 * Author: 
 * Creation date: 05/06/15
 */
MACHINE SetsDia
VARIABLES tempo
INVARIANT tempo : NAT1
INITIALISATION tempo := 1
    
OPERATIONS
    
    avancar =
    PRE tempo < 366
    THEN tempo := tempo + 1
    END;
    
    qq <-- tempoAtual=
    BEGIN
        qq := tempo
    END
    
    

END