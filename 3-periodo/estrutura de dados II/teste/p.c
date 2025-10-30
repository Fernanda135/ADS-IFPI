#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Função de busca por interpolação
int busca_interpolacao(int arr[], int x, int tamanho) {
    int inicio = 0;
    int fim = tamanho - 1;

    while (inicio <= fim && x >= arr[inicio] && x <= arr[fim]) {
        if (arr[inicio] == arr[fim]) {
            if (arr[inicio] == x) {
                return inicio;
            } else {
                return -1;
            }
        }

        // Calcular posição estimada
        int pos = inicio + (((double)(fim - inicio) * (x - arr[inicio])) / 
                          (arr[fim] - arr[inicio]));

        if (arr[pos] == x) {
            return pos;
        } else if (arr[pos] < x) {
            inicio = pos + 1;
        } else {
            fim = pos - 1;
        }
    }

    return -1;
}

int main() {
    // Tamanho do array
    const int tamanho = 250000;
    
    // Alocar memória para o array
    int *dados = (int *)malloc(tamanho * sizeof(int));
    if (dados == NULL) {
        printf("Erro na alocação de memória\n");
        return 1;
    }

    // Preencher array com números sequenciais
    for (int i = 0; i < tamanho; i++) {
        dados[i] = i;
    }

    // Gerar número aleatório para buscar
    srand(time(NULL));
    int alvo = rand() % tamanho;

    // Medir tempo de execução
    clock_t inicio = clock();
    int resultado = busca_interpolacao(dados, alvo, tamanho);
    clock_t fim = clock();

    // Calcular tempo em segundos
    double tempo = ((double)(fim - inicio)) / CLOCKS_PER_SEC;

    // Mostrar resultado
    printf("Elemento %d encontrado no índice %d\n", alvo, resultado);
    printf("Tempo de execução: %f segundos\n", tempo);

    // Liberar memória alocada
    free(dados);

    return 0;
}