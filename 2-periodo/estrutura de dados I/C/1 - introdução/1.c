#include <stdio.h>
#include <math.h>


int main() {

    int x, y, z, r;

    printf("X: ");
    scanf("%d", &x);

    printf("Y: ");
    scanf("%d", &y);

    printf("Z: ");
    scanf("%d", &z);

    printf("\nX = %d, Y = %d, Z = %d", x, y, z);

    r = (pow(x, 3) + pow(y, 2) + (x*y*z));

    printf("\nR = %d", r);

    return 0;
}