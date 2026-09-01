-- Aula 14 - Joins
-- Exercicios: inserir 5 registros para cada tabela e responder aos itens 1 a 7

CREATE DATABASE empresa_join;
USE empresa_join;

CREATE TABLE departamento (
dcodigo integer PRIMARY KEY,
dnome varchar(50) );

CREATE TABLE funcionario (
funcodigo integer PRIMARY KEY,
dcodigo integer,
nome varchar(60),
salario numeric,
FOREIGN KEY (dcodigo) REFERENCES departamento (dcodigo) );

CREATE TABLE dependente (
depcodigo integer PRIMARY KEY,
funcodigo integer,
depnome varchar(60),
FOREIGN KEY (funcodigo) REFERENCES funcionario (funcodigo) );

INSERT INTO departamento (dcodigo, dnome) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnologia da Informacao'),
(3, 'Financeiro'),
(4, 'Marketing'),
(5, 'Vendas');

INSERT INTO funcionario (funcodigo, dcodigo, nome, salario) VALUES
(1, 1, 'Ana Silva', 5500.00),
(2, 2, 'Bruno Costa', 7200.00),
(3, 3, 'Carla Dias', 4800.00),
(4, 4, 'Daniel Moreira', 6100.00),
(5, 5, 'Elisa Fernandes', 8000.00);

INSERT INTO dependente (depcodigo, funcodigo, depnome) VALUES
(1, 1, 'Filho 1 da Ana'),
(2, 1, 'Filho 2 da Ana'),
(3, 1, 'Filho 3 da Ana'),
(4, 2, 'Filho do Bruno'),
(5, 3, 'Filha da Carla');

-- 1 - Funcionarios que possuem mais do que 2 dependentes

SELECT f.nome, COUNT(d.depcodigo) AS quantidade
FROM funcionario f
INNER JOIN dependente d ON f.funcodigo = d.funcodigo
GROUP BY f.nome
HAVING COUNT(d.depcodigo) > 2;

-- 2 - Departamentos e os respectivos funcionarios em ordem alfabetica

SELECT dep.dnome, fun.nome
FROM departamento dep
INNER JOIN funcionario fun ON dep.dcodigo = fun.dcodigo
ORDER BY fun.nome;

-- 3 - Funcionarios que possuem dependente e os que nao possuem

SELECT f.nome
FROM funcionario f
INNER JOIN dependente d ON f.funcodigo = d.funcodigo
GROUP BY f.nome;

SELECT f.nome
FROM funcionario f
LEFT JOIN dependente d ON f.funcodigo = d.funcodigo
WHERE d.depcodigo IS NULL;

-- 4 - Media salarial dos departamentos

SELECT dep.dnome, AVG(fun.salario)
FROM departamento dep
INNER JOIN funcionario fun ON dep.dcodigo = fun.dcodigo
GROUP BY dep.dnome;

-- 5 - Departamentos que possuem e nao possuem funcionarios

SELECT dep.dnome, COUNT(fun.funcodigo) AS funcionarios
FROM departamento dep
LEFT JOIN funcionario fun ON dep.dcodigo = fun.dcodigo
GROUP BY dep.dnome;

SELECT dep.dnome
FROM departamento dep
LEFT JOIN funcionario fun ON dep.dcodigo = fun.dcodigo
WHERE fun.funcodigo IS NULL;

-- 6 - Quanto a empresa paga por mes de salarios

SELECT SUM(salario) FROM funcionario;

-- 7 - Quanto custa cada setor

SELECT dep.dnome, SUM(fun.salario) AS custo
FROM departamento dep
INNER JOIN funcionario fun ON dep.dcodigo = fun.dcodigo
GROUP BY dep.dnome;
