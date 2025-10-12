#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define TAMANHO_MAX 5

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

void empilhar(Pilha* p, int reg) {
    if (reg == '#') {
        desempilhar(p);
    }
    else if (reg == '@') {
        destruir(p);
    }
    else if (cheia(p)) {
        printf("Pilha cheia!\n");
    } 
    else {
        p->topo++;
        p->items[p->topo] = reg;
    }
}

int desempilhar(Pilha* p) {
    if(vazia(p)) {
        printf("Pilha vazia!\n");
    } else {
        int valor = p->items[p->topo];
        p->topo--;
        return valor;
    }
}

int topo(Pilha* p) {
    if (vazia(p)) {
        printf("Pilha vazia!\n");
    } else {
        return p->items[p->topo];
    }
}

void exibir(Pilha* p) {
    if (vazia(p)) {
        printf("Pilha vazia!\n");
    } else {
        printf("Pilha: ");
        for (int i = 0; i <= p->topo; i++) {
            printf("%d ", p->items[i]);
        }
        printf("\n");
    }
    
}

bool iguais(Pilha* p1, Pilha* p2) {
    for (int i = 0; i <= p1->topo; i++) {
        if (p1->items[i] != p2->items[i]) {
            return false;
        }
    }
    
    return true;
}

void destruir(Pilha* p) {
    free(p);
}

int main() {
    
    // Pilha* pilha1 = criar();
    // vazia(pilha1);
    // empilhar(pilha1, 10);
    // empilhar(pilha1, 20);
    // exibir(pilha1);
    // desempilhar(pilha1);
    // empilhar(pilha1, 22);
    // empilhar(pilha1, 35);
    // topo(pilha1);
    // desempilhar(pilha1);
    // empilhar(pilha1, 6);

    // exibir(pilha1);


    Pilha* pilha1 = criar();
    Pilha* pilha2 = criar();
    Pilha* pilha3 = criar();
    
    empilhar(pilha1, 1);
    empilhar(pilha1, 2);
    empilhar(pilha1, 3);
    
    empilhar(pilha2, 1);
    empilhar(pilha2, 2);
    empilhar(pilha2, 3);

    if(iguais(pilha1, pilha2)) {
        printf("iguais");
    }

    
    return 0;
}