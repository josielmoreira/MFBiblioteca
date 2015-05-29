MACHINE Biblioteca
EXTENDS Livros
INCLUDES Usuario
VARIABLES reservado, emprestado
INVARIANT reservado : usuario +-> ran(exemplar) &
          emprestado : usuario +-> ran(exemplar)
    
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
        ll : ran(exemplar) &
        card(reservado[{uu}]) < 2 &
        uu /: dom(reservado) &
        livros(ll) > 0
    THEN 
        reservado := reservado \/ {uu |-> ll} ||
        RemoverExemplar(ll)
    END;
    
    emprestimoLivro(uu,ll) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : ran(exemplar) &
        ll : ran(reservado) &
        uu : dom(reservado)
    THEN 
        reservado := reservado - {uu |-> ll} ||
        emprestado := emprestado \/ {uu |-> ll}
    END;
    
    
    DevolucaoLivro(uu,ll) =
    PRE uu : USUARIO &
        uu : usuario &
        ll : ran(exemplar) &
        uu : dom(emprestado) &
        ll : ran(emprestado)
    THEN 
        emprestado := emprestado- {uu |-> ll} ||
        AcrescentarExemplar(ll)
    END
    
    
END