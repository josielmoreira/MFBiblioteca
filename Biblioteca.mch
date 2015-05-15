/* Biblioteca
* Author: Josiel
* Creation date: 11/05/2015
*/
MACHINE     Biblioteca
INCLUDES    Usuario, Livro
VARIABLES    reservado, emprestado, emprestar
INVARIANT    reservado : usuario <-> biblioteca & 
             emprestado : usuario <-> biblioteca &
             emprestar <: biblioteca
            
    
    
INITIALISATION reservado := {} || 
                emprestado := {} ||
                emprestar := {}
    
OPERATIONS
    
    
    cadastrarUsuario ( uu ) =
    PRE uu : USUARIO & uu /: usuario
    THEN adicionaUsuario(uu) 
    END;
    
    
    cadastrarLivro (bb,nn) =
    PRE bb : LIVRO &
         bb /: livro &
         nn : NAT1 &
         (nn /: quantidade or nn : quantidade) &
         bb /: dom(biblioteca)
    THEN adicionarLivro(bb,nn) 
    END;     
    
    
    reservarLivro ( uu, bb,nn) = 
    PRE uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        nn : NAT1 & nn : quantidade &
        (uu /: dom(reservado) or uu : dom(reservado)) &
        bb /: dom(emprestar)
    THEN reservado := reservado \/ {uu |-> (bb, nn)}
    END;
        
        realizarEmprestimo( uu, bb , nn) =
        PRE  uu : USUARIO &
        bb : LIVRO &
        uu : usuario &
        bb : livro &
        nn : NAT1 & nn : quantidade &
        (uu /: dom(reservado) or uu : dom(reservado)) &
        bb /: dom(emprestar)
        THEN reservado := reservado - { uu|-> (bb,nn) } ||
            emprestado := emprestado \/ { uu|-> (bb,nn) }
        END;
        
        
        devolucao(uu, bb) =
        PRE uu : USUARIO &
            uu : dom(emprestado) &
            bb : ran(emprestado)
        THEN emprestado := emprestado - { uu |-> bb }
        END 
        
        
        
    END