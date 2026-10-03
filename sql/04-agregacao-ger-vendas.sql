-- Gerenciador de Vendas — funções de agregação
-- Dialeto: MySQL / MariaDB
--
-- Origem: ~/ger_verndas.sql
-- Correcoes aplicadas nesta versao:
--   1. virgula sobrando depois de  preco DECIMAL(10,2) NOT NULL,
--   2. linha invalida  INSERT INTO vendas produto;
--   3. falta de ponto e virgula em  SELECT count(*) ...
--   4. o arquivo original terminava cortado no meio ('produto ...' dentro do
--      VALUES e um SELECT sem fim). Ver os blocos marcados abaixo.

CREATE DATABASE IF NOT EXISTS ger_vendas;
USE ger_vendas;

DROP TABLE IF EXISTS vendas;

CREATE TABLE vendas (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    produto    VARCHAR(100) NOT NULL,
    quantidade INT          NOT NULL,
    preco      DECIMAL(10,2) NOT NULL
);

-- ATENCAO: a 6a linha do INSERT original estava cortada em "('produto ".
-- As 5 linhas abaixo sao as que estavam inteiras no arquivo.
-- Descomente e complete a 6a quando souber o valor correto.
INSERT INTO vendas (produto, quantidade, preco) VALUES
    ('produto a', 10, 19.99),
    ('produto b',  5, 29.99),
    ('produto a',  8, 19.99),
    ('produto c', 15, 39.99),
    ('produto b', 12, 29.99);
--     ('produto ?', ?, ?),     <-- linha cortada no original

-- ---------------------------------------------------------------- consultas

SELECT * FROM vendas;

SELECT COUNT(*) AS total_de_vendas FROM vendas;

SELECT SUM(quantidade) AS total_produtos_vendidos FROM vendas;

-- o SELECT final do original estava cortado logo no "SELECT".
-- A interpretacao mais provavel, pelo contexto da aula, e a receita:
SELECT SUM(quantidade * preco) AS receita_total FROM vendas;

-- o mesmo, agregado por produto
SELECT produto,
       COUNT(*)                 AS vendas,
       SUM(quantidade)          AS unidades,
       SUM(quantidade * preco)  AS receita,
       AVG(preco)               AS preco_medio
FROM vendas
GROUP BY produto
ORDER BY receita DESC;

-- having: so os produtos que venderam acima de 30 unidades
SELECT produto, SUM(quantidade) AS unidades
FROM vendas
GROUP BY produto
HAVING unidades > 30
ORDER BY unidades DESC;