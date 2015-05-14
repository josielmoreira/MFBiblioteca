/* Livro
* Author: 
* Creation date: 12/05/15
*/
MACHINE Livro
INCLUDES LivroC
VARIABLES livro, quantidade, biblioteca
INVARIANT   quantidade <: NAT & livro <: LIVRO  &  biblioteca : livro +-> quantidade
INITIALISATION livro := {} || biblioteca := {} || quantidade := {}
    OPERATIONS
 
    
    
     
     adicionarLivro(bb,nn) =
     PRE bb : LIVRO &
         bb /: livro &
         nn : NAT &
         nn /: quantidade &
         bb /: dom(biblioteca)
     THEN livro := livro \/ {bb} || quantidade := quantidade \/ {nn} ||  biblioteca(bb) := nn
         END;
     
   
    
    removeLivro(bb) =
    PRE bb : LIVRO &
        bb : livro
    THEN livro := livro - { bb }
    END
    
     
    
END
