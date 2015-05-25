/* Livro
* Author: Josiel
* Creation date: 23/05/2015
*/
MACHINE             Titulo
EXTENDS             Titulo_ctx
VARIABLES           titulo 
INVARIANT           titulo <: TITULO
INITIALISATION      titulo  := {}
OPERATIONS    
    
    cadastrarLivro ( ll ) =
    PRE ll : TITULO & 
        ll /: titulo
    THEN
        titulo  := titulo \/ { ll }
    END;
    
    removerLivro ( ll ) =
    PRE ll : TITULO & 
        ll : titulo 
    THEN 
        titulo  := titulo - { ll }
    END
    
END
