class Stack:
    
    def __init__(self):
        self.stack = []

    def is_empty(self):
        return len(self.stack) == 0

    def push(self, item):
        self.stack.append(item)

    def pop(self):
        if not self.is_empty():
            return self.stack.pop()
        else:
            print("Stack empty!")
            return None
            
    def peek(self):
        if not self.is_empty():
            return self.stack[-1]
        else:
            print("Stack empty!")
            return None
            
    def size(self):
        return len(self.stack)
    
    def __str__(self):
        return f"Stack: {self.stack}"


stack = Stack()

op = ''

while op != '0':
    op = input("\n1 - Push\n2 - Pop\n3 - Peek\n4 - Size\n0 - Exit\n\nop: ")
    if op == '1':
        n = int(input('N: '))
        stack.push(n)
        print(stack)
    elif op == '2':
        stack.pop()
        print(stack)
    elif op == '3':
        stack.peek()
    elif op == '4':
        stack.size()
    elif op == '0':
        pass
    else:
        print('invalid')