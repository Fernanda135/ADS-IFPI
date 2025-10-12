#include <stdio.h>

int main() {

    int x1, x2, x3, maior;

    printf("x1: ");
    scanf("%d", &x1);

    printf("x2: ");
    scanf("%d", &x2);

    printf("x3: ");
    scanf("%d", &x3);

    maior = x1;

    if (x2 > x1) {
        maior = x2;
    } else if (x3 > x1) {
        maior = x3;
    }


    printf("Maior: %d", maior);
    

    return 0;
}