#include <stdio.h>
#include <math.h>




typedef struct {
    float a;
    float b;
    float c;
} Poli_2g;


float calc(Poli_2g* p, float x) {
    float r = p->a * pow(x, 2) + p->b * x + p->c;
    return r;
}


int main() {

    Poli_2g poli = {2.0, 10.0, 5.0};
    float x = 2;

    printf("%.2f", calc(&poli, x));

    return 0;
};