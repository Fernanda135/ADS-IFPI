from collections import deque
import time


"""
• Existem dois vasos: um de 4 litros e um de 3 litros, inicialmente vazios, e uma fonte que jorra água em abundância.
• Objetivo:
    o Conseguir 2 litros em qualquer um dos vasos.
• Ações possíveis:
    o Encher os vasos
    o Esvaziar os vasos
    o Completar um vaso com outro
    o Jogar o conteúdo de um vaso dentro do outro
"""





# vasos
VASO_4 = 4
VASO_3 = 3
ESTADO_INICIAL = (0, 0)

# verificar se um estado é objetivo
def objetivo(estado):
    a, b = estado
    return a == 2 or b == 2

# sucessores de um estado
def sucessores(estado):
    a, b = estado
    sucessores = []
    
    # encher 4
    if a < VASO_4:
        sucessores.append(((VASO_4, b), "Encher 4"))
    # encher 3
    if b < VASO_3:
        sucessores.append(((a, VASO_3), "Encher 3"))
    # esvaziar 4
    if a > 0:
        sucessores.append(((0, b), "Esvaziar 4"))
    # esvaziar 3
    if b > 0:
        sucessores.append(((a, 0), "Esvaziar 3"))
    # derramar 4 em 3
    if a > 0 and b < VASO_3:
        derramar = min(a, VASO_3 - b)
        sucessores.append(((a - derramar, b + derramar), f"Derramar {derramar} em 3"))
    # derramar 3 em 4
    if b > 0 and a < VASO_4:
        derramar = min(b, VASO_4 - a)
        sucessores.append(((a + derramar, b - derramar), f"Derramar {derramar} em 4"))
        
    return sucessores

# busca em largura
def bfs(estado_inicial=ESTADO_INICIAL):
    fila = deque([(estado_inicial, [])])
    visitado = set()
    
    while fila:
        estado, caminho = fila.popleft()
        print(f"Explorando: {estado}")
        print(f"Caminho: {caminho + [estado]}")
        
        if objetivo(estado):
            print('Solução encontrada!')
            return caminho + [estado], len(visitado)
        
        if estado in visitado:
            continue
        visitado.add(estado)
        
        for successor, acao in sucessores(estado):
            if successor not in visitado:
                print(f'    Sucessor: {acao} = {successor}')
                fila.append((successor, caminho + [estado]))
            else:
                print(f'    Sucessor já visitado: {acao} = {successor}')
                
        print()
    
    return None, len(visitado)


# busca em profundidade
def dfs(estado_inicial=ESTADO_INICIAL):
    pilha = [(estado_inicial, [])]
    visitado = set()
    
    while pilha:
        estado, caminho = pilha.pop()
        print(f"Explorando: {estado}")
        print(f"Caminho: {caminho + [estado]}")
        
        if objetivo(estado):
            print('Solução encontrada!')
            return caminho + [estado], len(visitado)
        
        if estado in visitado:
            continue
        visitado.add(estado)
        
        for successor, acao in sucessores(estado):
            if successor not in visitado:
                print(f'    Sucessor: {acao} = {successor}')
                pilha.append((successor, caminho + [estado]))
            else:
                print(f'    Sucessor já visitado: {acao} = {successor}')
                
        print()
    return None, len(visitado)


# busca em profundidade limitada (usada pela IDS)
def dls(estado_inicial, limite_profundidade):
    pilha = [(estado_inicial, [], 0)]
    visitados = 0
    
    while pilha:
        estado, caminho, profundidade = pilha.pop()
        visitados += 1
        
        print(f"Explorando: {estado} (profundidade: {profundidade})")
        print(f"Caminho: {caminho + [estado]}")
        
        if objetivo(estado):
            print('Solução encontrada!')
            return caminho + [estado], visitados
        
        if profundidade < limite_profundidade:
            for successor, acao in sucessores(estado):
                print(f'    Sucessor: {acao} = {successor}')
                pilha.append((successor, caminho + [estado], profundidade + 1))
        else:
            print(f'    Limite de profundidade {limite_profundidade} atingido')
                
        print()
    
    return None, visitados


# busca com profundidade iterativa
def ids(estado_inicial=ESTADO_INICIAL):
    limite = 0
    total_visitados_geral = 0
    
    while True:
        print(f'\n============================================')
        print(f'Tentando com limite de profundidade: {limite}')
        print(f'============================================')
        
        solucao, visitados = dls(estado_inicial, limite)
        total_visitados_geral += visitados
        
        if solucao:
            return solucao, total_visitados_geral
        
        limite += 1
        
        if limite > 50:
            print("Limite máximo de profundidade atingido.")
            return None, total_visitados_geral


def saida(caminho, visitados):
    nos = (len(caminho) - 1) + visitados
    
    return " → ".join(f"({s[0]},{s[1]})" for s in caminho) + f"\nNúmero de passos: {len(caminho) - 1}\nEstados visitados: {visitados + 1}\nNós expandidos: {nos}"

def main():
    
    
    print('============================================')
    print("Busca em Largura (BFS)")
    print('============================================')
    bfs_time_i = time.perf_counter()
    bfs_solucao, bfs_visitados = bfs()
    bfs_time_f = time.perf_counter()
    bfs_time = bfs_time_f - bfs_time_i
    if bfs_solucao:
        print()
        print(f'Resultado final: {saida(bfs_solucao, bfs_visitados)}')
        print(f'Tempo necessário: {bfs_time:.4f}s')
    else:
        print("Nenhuma solução encontrada.")
    print('============================================')
    print()
    
    
    print('============================================')
    print("Busca em Profundidade (DFS)")
    print('============================================')
    dfs_time_i = time.perf_counter()
    dfs_solucao, dfs_visitados = dfs()
    dfs_time_f = time.perf_counter()
    dfs_time = dfs_time_f - dfs_time_i
    if dfs_solucao:
        print()
        print(f'Resultado final: {saida(dfs_solucao, dfs_visitados)}')
        print(f'Tempo necessário: {dfs_time:.4f}s')
    else:
        print("Nenhuma solução encontrada.")
    print('============================================')
    print()
    
    
    print('============================================')
    print("Busca com Profundidade Iterativa (IDS)")
    print('============================================')
    ids_time_i = time.perf_counter()
    ids_solucao, ids_visitados = ids()
    ids_time_f = time.perf_counter()
    ids_time = ids_time_f - ids_time_i
    if ids_solucao:
        print()
        print(f'Resultado final: {saida(ids_solucao, ids_visitados)}')
        print(f'Tempo necessário: {ids_time:.4f}s')
    else:
        print("Nenhuma solução encontrada.")
    print('============================================')
    print()


main()