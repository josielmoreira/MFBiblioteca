MACHINE Biblioteca
EXTENDS Livros
INCLUDES Usuario
VARIABLES reservado, emprestado
INVARIANT reservado <: EXEMPLAR * usuario &
          emprestado <: EXEMPLAR * usuario
          
INITIALISATION reservado := {} ||
    emprestado := {}
OPERATIONS
    
   AdicionarUsuario ( uu ) =
    PRE uu : USUARIO & 
        uu /: usuario
    THEN cadastrarUsuario(uu)
    END
    
    
END