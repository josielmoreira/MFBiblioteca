/* Sets
* Author: 
* Creation date: 04/06/15
*/
MACHINE Sets(ITEM)
VARIABLES set
INVARIANT set <: ITEM 
INITIALISATION set := {}
OPERATIONS
    
    add(ee) =
    PRE ee : ITEM
    THEN
        set := set \/ {ee}
    END
    
    
END
