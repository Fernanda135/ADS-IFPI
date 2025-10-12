def criar_fila():
    return []

def fila_vazia(f):
    if not f:
        return True
    return False

def enfileirar(f, v):
    f.append(v)

def desenfileirar(f):
    if fila_vazia(f):
        print('Fila vazia!')
    else:
        f.pop(0)



fila = criar_fila()

op = ''

while op != '0':
    op = input("\n1 - empilhar\n2 - desempilhar\n0 - sair\n\nopção: ")
    if op == '1':
        n = int(input('Valor: '))
        enfileirar(fila, n)
        print(fila)
    elif op == '2':
        desenfileirar(fila)
        print(fila)
    elif op == '0':
        pass
    else:
        print('Opção inválida')