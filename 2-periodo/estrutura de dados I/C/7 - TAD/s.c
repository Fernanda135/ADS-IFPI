#include <stdio.h>

struct ponto {
 float x;
 float y;
};

void imprime(struct ponto *p) {
 printf("Ponto fornecido: (%.2f, %.2f)\n", p->x, p->y);
}

void captura(struct ponto *p) {
printf("Digite as coordenadas: (x,y) ");
 scanf("%f %f", &p->x, &p->y);
}
int main() {
 struct ponto p;
 captura(&p);
 imprime(&p);
 return 0;
}