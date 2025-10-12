#include <stdio.h>

int main() {

    int idade;

    printf("Idade: ");
    scanf("%d", &idade);

    if (idade <= 4) {
        printf("bebe");
    } else if (idade <= 12) {
        printf("crianca");
    } else if (idade <= 21) {
        printf("adolescente");
    } else if (idade <= 60) {
        printf("adulto");
    } else {
        printf("idoso");
    }

    return 0;
}