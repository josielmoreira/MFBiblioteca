MACHINE Biblioteca
INCLUDES Usuario, Titulo, Exemplar
VARIABLES reservado, emprestado
INVARIANT reservado <: EXEMPLAR * usuario &
          emprestado <: EXEMPLAR * usuario
          
INITIALISATION reservado := {} ||
    emprestado := {}
OPERATIONS
    
    adicionarUsuario ( uu ) =
    PRE uu : USUARIO & uu /: usuario
    THEN cadastrarUsuario(uu)
    END
    
END