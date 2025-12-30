import time
import random
import numpy as np
import matplotlib.pyplot as plt



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



tamanhos = [10000, 20000,30000, 40000, 50000, 60000, 70000, 80000, 80500, 100000, 100500, 190000]
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
    
    
    
    
plt.plot(tamanhos, tempos_linear, marker='.', label='Busca Linear')
plt.plot(tamanhos, tempos_binaria, marker='.', label='Busca Binária')
plt.xlabel('Tamanho do vetor')
plt.ylabel('Tempo (s)')
plt.title('Comparação entre Busca Linear e Binária')
plt.legend()
plt.grid(True)
plt.show()






import time
import random
import numpy as np
import matplotlib.pyplot as plt



numeros = np.arange(1, 36)

tempos_recursivo = []
tempos_dinamico = []


# Fibonacci Recursivo - Calcula o  N-ésimo número de Fibonacci de forma recursiva (com chamadas duplicadas).


def fibonacci_recursivo(n):
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fibonacci_recursivo(n - 1) + fibonacci_recursivo(n - 2)



print("FIBONACCI RECURSIVO:")
for n in numeros:
    inicio = time.time()
    resultado = fibonacci_recursivo(n)
    fim = time.time()
    tempo = fim - inicio
    tempos_recursivo.append(tempo)
    print(f"n = {n} | Resultado: {resultado} | Tempo: {tempo:.6f}s")