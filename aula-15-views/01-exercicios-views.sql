-- Aula 15 - View
-- Exercicios: criar as views a partir dos joins da aula anterior

CREATE DATABASE empresa_view;
USE empresa_view;

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

CREATE VIEW vw_funcionario_dois_dependentes AS
SELECT f.nome, COUNT(d.depcodigo) AS quantidade
FROM funcionario f
INNER JOIN dependente d ON f.funcodigo = d.funcodigo
GROUP BY f.nome
HAVING COUNT(d.depcodigo) > 2;

SELECT * FROM vw_funcionario_dois_dependentes;

-- 2 - Departamentos e os respectivos funcionarios em ordem alfabetica

CREATE VIEW vw_departamento_funcionario AS
SELECT dep.dnome, fun.nome
FROM departamento dep
INNER JOIN funcionario fun ON dep.dcodigo = fun.dcodigo
ORDER BY fun.nome;

SELECT * FROM vw_departamento_funcionario;

-- 3 - Nome do departamento e o maior salario

CREATE VIEW vw_departamento_maior_salario AS
SELECT dep.dnome, MAX(fun.salario) AS maior_salario
FROM departamento dep
INNER JOIN funcionario fun ON dep.dcodigo = fun.dcodigo
GROUP BY dep.dnome;

SELECT * FROM vw_departamento_maior_salario;

-- 4 - Funcionarios que possuem dependente e os que nao possuem

CREATE VIEW vw_funcionario_dependente AS
SELECT f.nome, COUNT(d.depcodigo) AS dependentes
FROM funcionario f
LEFT JOIN dependente d ON f.funcodigo = d.funcodigo
GROUP BY f.nome;

SELECT * FROM vw_funcionario_dependente;

-- 5 - Media salarial dos departamentos

CREATE VIEW vw_media_salarial_departamento AS
SELECT dep.dnome, AVG(fun.salario) AS media_salarial
FROM departamento dep
INNER JOIN funcionario fun ON dep.dcodigo = fun.dcodigo
GROUP BY dep.dnome;

SELECT * FROM vw_media_salarial_departamento;
