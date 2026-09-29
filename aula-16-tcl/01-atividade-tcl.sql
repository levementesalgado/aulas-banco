-- Aula 16 - TCL (Transaction Control Language)
-- Atividade: COMMIT, ROLLBACK e SAVEPOINT

CREATE DATABASE bd_export;
USE bd_export;

-- Target: criar a base BD_EXPORT, a tabela DEPARTAMENTO e inserir 5 registros

CREATE TABLE departamento (
dcodigo integer PRIMARY KEY,
dnome varchar(50) );

INSERT INTO departamento (dcodigo, dnome) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnologia da Informacao'),
(3, 'Financeiro'),
(4, 'Marketing'),
(5, 'Vendas');

-- Tabela usada na atividade (salario e nome do funcionario)

CREATE TABLE funcionario (
funcodigo integer PRIMARY KEY,
nome varchar(60),
salario numeric );

INSERT INTO funcionario (funcodigo, nome, salario) VALUES
(1, 'Ana Silva', 5500.00),
(2, 'Bruno Costa', 7200.00),
(3, 'Carla Dias', 4800.00),
(4, 'Daniel Moreira', 6100.00),
(5, 'Elisa Fernandes', 8000.00);

-- COMMIT: salva a alteracao do salario

START TRANSACTION;
UPDATE funcionario SET salario = salario + 500.00 WHERE funcodigo = 1;
COMMIT;

SELECT * FROM funcionario;

-- ROLLBACK: desfaz a alteracao do nome

START TRANSACTION;
UPDATE funcionario SET nome = 'Bruno A. Costa' WHERE funcodigo = 2;
ROLLBACK;

SELECT * FROM funcionario;

-- SAVEPOINT: guarda o ponto da alteracao de salario;
-- so a alteracao de nome feita depois e revertida

START TRANSACTION;
UPDATE funcionario SET salario = salario + 300.00 WHERE funcodigo = 3;
SAVEPOINT sp_salario;
UPDATE funcionario SET nome = 'Carla Dias Errada' WHERE funcodigo = 3;
ROLLBACK TO sp_salario;
COMMIT;

SELECT * FROM funcionario;
