class Queue:
    
    def __init__(self):
        self.queue = []

    def is_empty(self):
        return len(self.queue) == 0

    def enqueue(self, item):
        self.queue.append(item)

    def dequeue(self):
        if not self.is_empty():
            return self.queue.pop(0)
        else:
            print("queue empty!")
            return None
            
    def peek(self):
        if not self.is_empty():
            return self.queue[0]
        else:
            print("queue empty!")
            return None
            
    def size(self):
        return len(self.queue)
    
    def __str__(self):
        return f"Queue: {self.queue}"


queue = Queue()

op = ''

while op != '0':
    op = input("\n1 - Enqueue\n2 - Dequeue\n3 - Peek\n4 - Size\n0 - Exit\n\nopção: ")
    if op == '1':
        n = int(input('N: '))
        queue.enqueue(n)
        print(queue)
    elif op == '2':
        queue.dequeue()
        print(queue)
    elif op == '3':
        queue.peek()
    elif op == '4':
        queue.size()
    elif op == '0':
        pass
    else:
        print('invalid')