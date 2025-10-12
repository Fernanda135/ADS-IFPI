#include <stdio.h>
#include <math.h>

int main() {

    int x1, x2, x3, r;

    printf("x1: ");
    scanf("%d", &x1);

    printf("x2: ");
    scanf("%d", &x2);

    printf("x3: ");
    scanf("%d", &x3);

    printf("\nx1 = %d, x2 = %d, x3 = %d", x1, x2, x3);

    r = (pow(x1+3, 4) + (pow(x2 * x3, 3)));

    printf("\nr = %d", r);

    return 0;
}