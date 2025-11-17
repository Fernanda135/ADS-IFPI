import time
import random
import numpy as np



def busca_linear(arr, alvo):
    for i in range(len(arr)):
        if arr[i] == alvo:
            return i
    return -1



def busca_binaria(arr, alvo):
    esquerda = 0
    direita = len(arr) - 1
    while esquerda <= direita:
        meio = (esquerda + direita) // 2
        if arr[meio] == alvo:
            return meio
        elif arr[meio] < alvo:
            esquerda = meio + 1
        else:
            direita = meio - 1
    return -1



tamanhos = [10000, 50000, 100000, 2000000, 5000000]
tempos_linear = []
tempos_binaria = []



# Busca Linear - Encontra um elemento percorrendo a lista sequencialmente.

print("BUSCA LINEAR:")
for tamanho in tamanhos:
    dados_linear = np.random.randint(0, tamanho * 2, tamanho)
    alvo = random.choice(dados_linear)

    inicio = time.time()
    busca_linear(dados_linear, alvo)
    fim = time.time()

    tempo = fim - inicio
    tempos_linear.append(tempo)
    print(f"Tamanho: {tamanho}, Alvo: {alvo}, Tempo: {tempo:.6f} segundos")




# Busca Binária - Encontra um elemento em lista ordenada dividindo o espaço de busca pela metade a cada passo.

print("\nBUSCA BINÁRIA")
for tamanho in tamanhos:
    dados_binario = np.sort(np.random.randint(0, tamanho * 2, tamanho))
    alvo = random.choice(dados_binario)

    inicio = time.time()
    busca_binaria(dados_binario, alvo)
    fim = time.time()

    tempo = fim - inicio
    tempos_binaria.append(tempo)
    print(f"Tamanho: {tamanho}, Alvo: {alvo}, Tempo: {tempo:.6f} segundos")