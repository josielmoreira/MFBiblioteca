/* Titulo
* Author:
* Creation date: 12/05/15
*/
MACHINE Titulo
INCLUDES Titulo_ctx
VARIABLES titulos
INVARIANT titulos : seq(TITULO)
INITIALISATION titulos:= []
OPERATIONS
    
    adicionarExemplar(bb) =
    PRE bb : TITULO &
        bb /: ran(titulos)
    THEN titulos := titulos <- bb
    END;
    
    re <-- resposta(bb) =
    PRE bb : TITULO
    THEN re := card(ran(titulos))
    END;
    
    re2 <-- resposta2(bb) =
    PRE bb : TITULO
    THEN re2 := titulos~(bb)
    END;
    
    removerExemplar(bb) =
    PRE bb : TITULO & bb : ran(titulos)
    THEN
        LET pp
        BE pp = titulos~(bb)
        IN
            titulos := (titulos/|\ pp-1) ^ (titulos \|/ pp)
        END
    END
END