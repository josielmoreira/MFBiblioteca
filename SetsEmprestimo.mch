/* SetsEmprestimo
 * Author: 
 * Creation date: 05/06/15
 */
MACHINE SetsEmprestimo(PESSOA, ITEM)
    VARIABLES emprestimo
INVARIANT emprestimo : PESSOA +-> ITEM
INITIALISATION emprestimo := {}
    
OPERATIONS
    
    addEmprestimo(pp, ee) =
    PRE pp : PESSOA &
        ee : ITEM
    THEN emprestimo := emprestimo \/ {pp |-> ee}
    END;
    
    removerEmprestimo(pp, ee) =
        PRE pp : PESSOA &
            ee : ITEM
    THEN emprestimo:= emprestimo - {pp |-> ee}
    END


END
