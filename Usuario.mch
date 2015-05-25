/* Usuario
* Author:
* Creation date: 11/05/15
*/
MACHINE Usuario
EXTENDS UsuarioC
VARIABLES usuario
INVARIANT usuario <: USUARIO 
INITIALISATION usuario := {}
OPERATIONS
    adicionaUsuario(uu) =
    PRE uu : USUARIO & uu /: usuario
    THEN usuario := usuario \/ { uu }
    END;
    
    removeUsuario(uu) =
    PRE uu : USUARIO &
        uu : usuario
    THEN usuario := usuario - { uu }
    END
END
