/* SetsUsuario
 * Author: 
 * Creation date: 05/06/15
 */
MACHINE SetsUsuario(ITEM)
VARIABLES set, qtd
INVARIANT set <: ITEM & qtd <: set * NAT
INITIALISATION set := {} || qtd := {}
OPERATIONS
    
    addUser(ee) =
        PRE ee : ITEM
        THEN
            set := {ee} ||
            qtd(ee) := 0
        END;
    
    Zerar(ee) =
        PRE ee : ITEM
        THEN qtd(ee) := 0
        END;
    
    Decrementar(ee) =
        PRE ee : ITEM
        THEN IF qtd(ee) > 0 
            THEN
                qtd(ee) := qtd(ee) - 1 
            ELSE 
                skip
            END
        END;
    
    Atualizar(ee,nn) =
        PRE ee : ITEM &
            nn : NAT &
            nn + qtd(ee) < 100
        THEN qtd(ee) := qtd(ee) + nn
        END;
    
    ss <-- verificarSaldo(ee) =
        PRE ee : ITEM
        THEN ss := qtd(ee)
        END;
    
    
    diferenca(ee,nn) =
        PRE ee : ITEM &
            nn : NAT
        THEN qtd(ee) := nn - qtd(ee)
        END
END