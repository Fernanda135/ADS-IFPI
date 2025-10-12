#include <stdio.h>
#include <math.h>


struct ponto {
    float x, y;
};

float distancia (struct ponto *p, struct ponto *q) {
    float dx = q->x - p->x;
    float dy = q->y - p->y;
    return sqrt(dx * dx + dy * dy);
}

int main() {

    struct ponto a = {1.0, 2.0};
    struct ponto b = {4.0, 6.0};
    
    float d = distancia(&a, &b);

    printf("Distancia entre os pontos: %.2f\n", d);

    return 0;
}


