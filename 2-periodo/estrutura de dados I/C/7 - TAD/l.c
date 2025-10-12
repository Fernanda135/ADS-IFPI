#include <stdio.h>
#include <string.h>

struct paciente {
    char nome[20];
    int idade;
    float altura, peso;
}; 

int main() {
    struct paciente p;
    strcpy(p.nome, "Joao");
    p.idade = 28;
    p.altura = 1.91;
    p.peso = 88.0;

    //struct paciente p = {"Joao", 28, 1.91, 88.0};

    printf("nome: %s\nidade: %d\naltura: %f\npeso: %f", p.nome, p.idade, p.altura, p.peso);

    return 0;

}