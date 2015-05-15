/* Livro
* Author: 
* Creation date: 12/05/15
*/
MACHINE Livro
INCLUDES LivroC
VARIABLES livro, quantidade, biblioteca
INVARIANT   quantidade <: NAT1 & livro <: LIVRO  & biblioteca : livro <-> quantidade
INITIALISATION livro := {} || biblioteca := {} || quantidade := {}
    OPERATIONS
 
    
    
     
     adicionarLivro(bb,nn) =
     PRE bb : LIVRO &
         bb /: livro &
         nn : NAT1 &
         (nn /: ran(biblioteca)or nn : ran(biblioteca)) &
         bb /: dom(biblioteca)

     THEN livro := livro \/ {bb} || quantidade := quantidade \/ {nn} ||  biblioteca := biblioteca \/ {bb |-> nn}
         END;
     
   
    
    removeLivro(bb,nn) =
    PRE bb : LIVRO & 
         bb : livro &
         nn : NAT1 &
         nn : quantidade &
         bb : dom(biblioteca) & nn : ran(biblioteca)
    THEN  biblioteca := biblioteca - {bb |-> nn}
	 
    END
    
     
    
END
