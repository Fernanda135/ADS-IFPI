#include <stdio.h>

#define INICIO 0
#define MAXTAM 10

typedef struct {
    int tamanho;
    int dados[MAXTAM];
    int pri, ult;
} Lista;


void copia(Lista* l1, Lista* l2) {
    for(int i = 0; i < l1->tamanho; i++) {
        l2->dados[i] = l1->dados[i];
    }

    l2->tamanho = l1->tamanho;

    printf("lista1: ");
    for(int i = 0; i < l1->tamanho; i++) {
        printf("%d ", l1->dados[i]);
    };

    printf("\nlista2: ");
    for(int i = 0; i < l2->tamanho; i++) {
        printf("%d ", l2->dados[i]);
    };
}

void busca(Lista* l, int n) {
    for(int i = 0; i < l->tamanho; i++) {
        if (l->dados[i] == n) {
            printf("Elemento %d encontrada na posicao %d.", n, i+1);
            break;
        }
    };
}




int main() {

    Lista lista1;
    lista1.dados[0] = 1;
    lista1.dados[1] = 2;
    lista1.dados[2] = 3;
    lista1.dados[3] = 10;
    lista1.dados[4] = 5;

    Lista lista2;

    lista1.tamanho = 5;

    busca(&lista1, 2);

    // copia(&lista1, &lista2);

    // printf("lista1: ");
    // for(int i = 0; i < lista1.tamanho; i++) {
    //     printf("%d ", lista1.dados[i]);
    // };



    return 0;
}