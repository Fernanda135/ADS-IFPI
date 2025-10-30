numeros = [10, 20, 30, 36]

for num in numeros:
  for i in range(num):
    def fibonacci_recursivo(n):
        if n <= 0:
            return 0 
        elif n == 1:
            return 1 
        else:
            return fibonacci_recursivo(n - 1) + fibonacci_recursivo(n - 2) 
  print(fibonacci_recursivo(num))