MACHINE Biblioteca
EXTENDS Livros
INCLUDES Usuario
VARIABLES reservado, emprestado
INVARIANT reservado <: usuario * ran(exemplar) &
          emprestado <: usuario * ran(exemplar)
    
INITIALISATION reservado := {} ||
    emprestado := {}
OPERATIONS
    
    AdicionarUsuario ( uu ) =
    PRE uu : USUARIO & 
        uu /: usuario
    THEN cadastrarUsuario(uu)
    END;
    
    reservarLivro(uu,ll) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : dom(livros) &
        card(reservado[{uu}]) < 3 
    THEN 
        reservado := reservado \/ {uu |-> ll} ||
        RemoverExemplar(ll)
        END
        
        
    END