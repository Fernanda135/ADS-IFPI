-- 1. Criação da Tabela PRODUTOS
CREATE TABLE PRODUTOS (
    productId SERIAL PRIMARY KEY, -- ID único e gerado automaticamente
    name TEXT NOT NULL UNIQUE, -- Nome do produto (deve ser único)
    category TEXT NOT NULL, -- Categoria do produto (ex: 'Eletrônicos','Livros', 'Roupas')
    price NUMERIC(10, 2) NOT NULL,-- Preço do produto (com 2 casas decimais)
    status TEXT NOT NULL DEFAULT 'disponivel' -- Status do produto (ex:'disponivel', 'esgotado', 'desativado')
);
-- 2. Inserção de Registros Iniciais
INSERT INTO PRODUTOS (name, category, price, status) VALUES
('Smartphone X', 'Eletrônicos', 1500.00, 'disponivel'),
('Livro A', 'Livros', 45.50, 'disponivel'),
('Fone de Ouvido Bluetooth', 'Eletrônicos', 299.99, 'esgotado'),
('Camiseta Casual', 'Roupas', 79.90, 'disponivel');
