/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Biblioteca.h"

/* Clause IMPORTS */
#include "SetsUsuario.h"
#include "SetsExemplar.h"
#include "SetsTitulo.h"
#include "SetsDia.h"
#include "SetsReserva.h"
#include "SetsEmprestimo.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

/* Clause INITIALISATION */
void Biblioteca__INITIALISATION(void)
{
    
    SetsDia__INITIALISATION();
    SetsEmprestimo__INITIALISATION();
    SetsExemplar__INITIALISATION();
    SetsReserva__INITIALISATION();
    SetsTitulo__INITIALISATION();
    SetsUsuario__INITIALISATION();
}

/* Clause OPERATIONS */

void Biblioteca__CadastrarUsuario(Biblioteca__USUARIO uu)
{
    SetsUsuario__addUser(uu);
}

void Biblioteca__ZerarSaldo(Biblioteca__USUARIO uu)
{
    SetsUsuario__Zerar(uu);
}

void Biblioteca__DecrementarSaldoUsuario(Biblioteca__USUARIO uu)
{
    SetsUsuario__Decrementar(uu);
}

void Biblioteca__AtualizarSaldoUsuario(Biblioteca__USUARIO uu, int32_t dd)
{
    SetsUsuario__Atualizar(uu, dd);
}

void Biblioteca__verSaldo(Biblioteca__USUARIO uu, int32_t *qq)
{
    SetsUsuario__verificarSaldo(uu, qq);
}

void Biblioteca__atraso(Biblioteca__USUARIO uu, int32_t dd)
{
    SetsUsuario__diferenca(uu, dd);
}

void Biblioteca__adicionarTitulo(Biblioteca__TITULO ll)
{
    SetsTitulo__add2(ll);
}

void Biblioteca__AdicionarExemplar(Biblioteca__TITULO ll, int32_t nn)
{
    SetsExemplar__addSet(ll, nn);
}

void Biblioteca__RemoverExemplar(Biblioteca__TITULO ll)
{
    SetsExemplar__remove(ll);
}

void Biblioteca__AcrescentarExemplar(Biblioteca__TITULO ll)
{
    SetsExemplar__add(ll);
}

void Biblioteca__passarDia(void)
{
    SetsDia__avancar();
}

void Biblioteca__diaAtual(int32_t *qq)
{
    SetsDia__tempoAtual(qq);
}

void Biblioteca__reservarLivro(Biblioteca__USUARIO uu, Biblioteca__TITULO ll)
{
    int32_t ss;
    
    SetsUsuario__verificarSaldo(uu, &ss);
    if((ss) < (5))
    {
        SetsReserva__addReserva(uu, ll);
        SetsUsuario__Zerar(uu);
        SetsExemplar__remove(ll);
    }
    else
    {
        SetsUsuario__Decrementar(uu);
        SetsDia__avancar();
    }
}

void Biblioteca__emprestimoLivro(Biblioteca__USUARIO uu, Biblioteca__TITULO ll, int32_t dd)
{
    SetsReserva__removerReserva(uu, ll);
    SetsEmprestimo__addEmprestimo(uu, ll);
    SetsUsuario__Atualizar(uu, dd);
}

void Biblioteca__DevolucaoLivro(Biblioteca__USUARIO uu, Biblioteca__TITULO ll, int32_t dd)
{
    SetsEmprestimo__removerEmprestimo(uu, ll);
    SetsUsuario__diferenca(uu, dd);
    SetsExemplar__add(ll);
}

