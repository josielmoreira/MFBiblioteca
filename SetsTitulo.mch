/* SetsTitulo
 * Author: Josiel
 * Creation date: 04/06/2015
 */
MACHINE SetsTitulo(ITEM)
VARIABLES set2
INVARIANT set2 : seq(ITEM) 
INITIALISATION set2 := []
OPERATIONS
    
    add2(ee) =
    PRE ee : ITEM &
        ee /: ran(set2)
    THEN
        set2 := set2 <- ee
    END
    
    
END