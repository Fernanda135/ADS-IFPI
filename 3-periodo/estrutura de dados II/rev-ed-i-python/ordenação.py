lista1 = [23, 6, 78, 55, 12, 58, 66, 89, 9, 80, 12, 2, 32, 90, 1]

n = len(lista1)

print(f'Lista 1 inicial: {lista1}')

# Bubble Sort
for i in range(n-1):
    for j in range(n-i-1):
        if lista1[j] > lista1[j+1]:
            lista1[j], lista1[j+1] = lista1[j+1], lista1[j]
            
print(f'Bubble sort: {lista1}')



# Insertion Sort
lista2 = [23, 6, 78, 55, 12, 58, 66, 89, 9, 80, 12, 2, 32, 90, 1]

n = len(lista2)

print(f'\nLista 2 inicial: {lista2}')

for i in range(1, n):
    chave = lista2[i]
    j = i - 1
    while j >= 0 and lista2[j] > chave:
        lista2[j + 1] = lista2[j]
        j -= 1
    lista2[j + 1] = chave
    
print(f'Insertion sort: {lista2}')



# Selection Sort
lista3 = [23, 6, 78, 55, 12, 58, 66, 89, 9, 80, 12, 2, 32, 90, 1]

print(f"\nLista 3 inicial: {lista3}")

n = len(lista3)

for i in range(n-1):
    min = i
    for j in range(i+1, n):
        if lista3[j] < lista3[min]:
            min = j
    lista3[i], lista3[min] = lista3[min], lista3[i]

print(f'Selection sort: {lista3}')