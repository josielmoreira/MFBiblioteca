#ifndef _SetsDia_h
#define _SetsDia_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_VARIABLES */


/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */
extern void SetsDia__INITIALISATION(void);

/* Clause OPERATIONS */

extern void SetsDia__avancar(void);
extern void SetsDia__tempoAtual(int32_t *qq);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _SetsDia_h */
