#include <stdio.h>

#define TAMANHO_MAX 100

int main() {

    int u[TAMANHO_MAX], v[TAMANHO_MAX], hadamard[TAMANHO_MAX];
    int i, tamanho;

    do
    {
        printf("\nDigite o tamanho dos vetores (menor ou igual a 100): ");
        scanf("%d", &tamanho);

        if (tamanho > TAMANHO_MAX || tamanho <= 0) {
            printf("tamanho invalido!\n");
        }

    } while (tamanho > TAMANHO_MAX || tamanho <= 0);


    printf("Digite os %d elementos do primeiro vetor (u):\n", tamanho);
    for (i = 0; i < tamanho; i++) {
        scanf("%d", &u[i]);
    }


    printf("Digite os %d elementos do segundo vetor (v):\n", tamanho);
    for (i = 0; i < tamanho; i++) {
        scanf("%d", &v[i]);
    }


    for (i = 0; i < tamanho; i++) {
        hadamard[i] = u[i] * v[i];
    }
    


    printf("\nO produto de Hadamard dos vetores e:\n");
    for (i = 0; i < tamanho; i++) {
        printf("%d ", hadamard[i]);
    }
    printf("\n");



    return 0;
}