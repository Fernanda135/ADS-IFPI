def criar_pilha():
    return []

def pilha_vazia(pilha):
    if not pilha:
        return True
    return False

def empilhar(p, v):
    p.append(v)

def desempilhar(p):
    if pilha_vazia(p):
        print('Pilha vazia!')
    else:
        p.pop()
        
def topo_pilha(p):
    if pilha_vazia(p):
        print('Pilha vazia!')
    else:
        print(f'Topo: {p[-1]}')


pilha = criar_pilha()

op = ''

while op != '0':
    op = input("\n1 - empilhar\n2 - desempilhar\n3 - Topo da pilha\n0 - sair\n\nopção: ")
    if op == '1':
        n = int(input('Valor: '))
        empilhar(pilha, n)
        print(pilha)
    elif op == '2':
        desempilhar(pilha)
        print(pilha)
    elif op == '3':
        topo_pilha(pilha)
    elif op == '0':
        pass
    else:
        print('Opção inválida')