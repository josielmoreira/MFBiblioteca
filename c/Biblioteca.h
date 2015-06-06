#ifndef _Biblioteca_h
#define _Biblioteca_h

#include <stdint.h>
#include <stdbool.h>
/* Clause IMPORTS */
#include "SetsUsuario.h"
#include "SetsExemplar.h"
#include "SetsTitulo.h"
#include "SetsDia.h"
#include "SetsReserva.h"
#include "SetsEmprestimo.h"

/* Clause EXTENDS */
#include "Usuario.h"
#include "Exemplar.h"
#include "Dia.h"
#define Biblioteca__CadastrarUsuario Usuario__CadastrarUsuario
#define Biblioteca__ZerarSaldo Usuario__ZerarSaldo
#define Biblioteca__DecrementarSaldoUsuario Usuario__DecrementarSaldoUsuario
#define Biblioteca__AtualizarSaldoUsuario Usuario__AtualizarSaldoUsuario
#define Biblioteca__verSaldo Usuario__verSaldo
#define Biblioteca__atraso Usuario__atraso
#define Biblioteca__AdicionarExemplar Exemplar__AdicionarExemplar
#define Biblioteca__RemoverExemplar Exemplar__RemoverExemplar
#define Biblioteca__AcrescentarExemplar Exemplar__AcrescentarExemplar
#define Biblioteca__passarDia Dia__passarDia
#define Biblioteca__diaAtual Dia__diaAtual

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


#define Biblioteca__USUARIO__max 100
#define Biblioteca__TITULO__max 10
/* Clause SETS */
typedef int Biblioteca__USUARIO;
typedef int Biblioteca__TITULO;

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void Biblioteca__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Biblioteca__reservarLivro(Biblioteca__USUARIO uu, Biblioteca__TITULO ll);
extern void Biblioteca__emprestimoLivro(Biblioteca__USUARIO uu, Biblioteca__TITULO ll, int32_t dd);
extern void Biblioteca__DevolucaoLivro(Biblioteca__USUARIO uu, Biblioteca__TITULO ll, int32_t dd);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Biblioteca_h */
