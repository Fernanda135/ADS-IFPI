#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define TAMANHO_MAX 32

typedef struct {
    int items[TAMANHO_MAX];
    int topo;
} Pilha;

Pilha* criar() {
    Pilha* pilha = (Pilha*)malloc(sizeof(Pilha));
    pilha->topo = -1;
    return pilha;
}

bool vazia(Pilha* p) {
    return p->topo == -1;
}

bool cheia(Pilha* p) {
    return p->topo == TAMANHO_MAX - 1;
}

void empilhar(Pilha* p, int valor) {
    if (cheia(p)) {
        printf("Pilha cheia!\n");
    } else {
        p->topo++;
        p->items[p->topo] = valor;
    }
}

int desempilhar(Pilha* p) {
    if(vazia(p)) {
        printf("Pilha vazia!\n");
        return -1;
    } else {
        return p->items[p->topo--];
    }
}

void binario(int decimal) {
    Pilha* pilha = criar();
    
    if (decimal == 0) {
        printf("0");
        return;
    }
    
    while (decimal > 0) {
        empilhar(pilha, decimal % 2);
        decimal = decimal / 2;
    }
    
    printf("binirio: ");
    while (!vazia(pilha)) {
        printf("%d", desempilhar(pilha));
    }
    printf("\n");
    
    free(pilha);
}

int main() {
    int numero;

    printf("Numero decimal: ");
    scanf("%d", &numero);
    
    binario(numero);
    
    return 0;
}