#include <stdio.h>

int main() {

    int l1, l2, l3;

    printf("l1: ");
    scanf("%d", &l1);

    printf("l2: ");
    scanf("%d", &l2);

    printf("l3: ");
    scanf("%d", &l3);

    if (l1 == l2 && l1 == l3) {
        printf("Triangulo Equilatero possui os 3 lados iguais.");
    } else if (l1 == l2 || l1 == l3 || l2 ==l3 ) {
        printf("Triangulo Isosceles possui 2 lados iguais.");
    } else {
        printf("Triangulo Escaleno possui 3 lados diferentes.");
    }

    return 0;
}