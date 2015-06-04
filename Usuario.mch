
/* Usuario
 * Author: Josiel
 * Creation date: 23/05/2015
 */
MACHINE        Usuario
EXTENDS        Usuario_ctx
VARIABLES      usuario
INVARIANT      usuario <: USUARIO
INITIALISATION usuario := {}
OPERATIONS
    
    cadastrarUsuario ( uu ) =
    PRE uu : USUARIO & 
        uu /: usuario
    THEN usuario := usuario \/ { uu }
    END
    
   
    
END
