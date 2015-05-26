/* Titulo
* Author:
* Creation date: 12/05/15
*/
MACHINE Titulo
INCLUDES Titulo_ctx
VARIABLES titulo
INVARIANT titulo : seq(TITULO)
INITIALISATION titulo:= []
OPERATIONS
    
    adicionarExemplar(bb) =
    PRE bb : TITULO
    THEN titulo := titulo <- bb
    END;
    
    re <-- resposta(bb) =
    PRE bb : TITULO
    THEN re := card(ran(titulo))
        END;
    
     re2 <-- resposta2(bb) =
    PRE bb : TITULO
    THEN re2 := titulo~(bb)
        END;
    
    removerExemplar(bb) =
    PRE bb : TITULO & bb : ran(titulo)
    THEN
        ANY pp
        WHERE pp = titulo~(bb)
        THEN
            titulo := (titulo/|\ pp-1) ^ (titulo \|/ pp)
        END
    END
END