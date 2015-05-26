
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
    
    rr <-- cadastrarUsuario ( uu ) =
    PRE uu : USUARIO & 
        uu /: usuario
    THEN rr := usuario_cadastrado || 
         usuario := usuario \/ { uu }
    END;        
    
    rr <-- removerUsuario ( uu ) = 
    PRE uu : USUARIO &
        uu : usuario
    THEN rr := usuario_removido || 
         usuario := usuario - { uu }
    END
    
END
