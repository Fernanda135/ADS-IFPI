#include <stdio.h>
#include <math.h>

int main() {

    float a, b, c, d, e, r;

    printf("a: ");
    scanf("%f", &a);

    printf("b: ");
    scanf("%f", &b);
    
    printf("c: ");
    scanf("%f", &c);

    printf("d: ");
    scanf("%f", &d);

    printf("e: ");
    scanf("%f", &e);

    printf("\na = %.0f, b = %.0f, c = %.0f, d = %.0f, e = %.0f", a, b, c, d, e);

    r = pow(a, 3) * ((b+c) / d + e);

    printf("\nr = %.0f", r);

    return 0;
}