-- Aula 09 - Introdução ao SQL
-- Criar banco, criar tabelas e chave estrangeira (exemplos do slide)

CREATE DATABASE locadoras;
USE locadoras;

-- Tabela principal
CREATE TABLE produtos (
cod_prod integer PRIMARY KEY,
nome varchar(30),
preco numeric );

-- Tabela referenciada
CREATE TABLE pedidos (
cod_pedido integer PRIMARY KEY,
cod_prod integer,
quantidade integer,
FOREIGN KEY (cod_prod) REFERENCES produtos (cod_prod) );

INSERT INTO produtos (cod_prod, nome, preco) VALUES
(1, 'Notebook', 3500.00),
(2, 'Mouse', 45.90),
(3, 'Teclado', 120.00);

INSERT INTO pedidos (cod_pedido, cod_prod, quantidade) VALUES
(1, 1, 1),
(2, 3, 2),
(3, 2, 5);

SELECT * FROM produtos;
SELECT * FROM pedidos;
