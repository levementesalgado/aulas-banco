-- Aula 12 - Comandos DML
-- Atividade: banco de dados EMPRESA3

CREATE DATABASE empresa3;
USE empresa3;

CREATE TABLE departamento (
dcodigo integer PRIMARY KEY,
dnome varchar(50) );

CREATE TABLE funcionario (
funcodigo integer PRIMARY KEY,
dcodigo integer,
nome varchar(60),
nascimento date,
salario numeric,
FOREIGN KEY (dcodigo) REFERENCES departamento (dcodigo) );

CREATE TABLE dependente (
depcodigo integer PRIMARY KEY,
funcodigo integer,
depnome varchar(60),
FOREIGN KEY (funcodigo) REFERENCES funcionario (funcodigo) );

-- Atividade Insert: inserir 10 registros em cada tabela

INSERT INTO departamento (dcodigo, dnome) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnologia da Informacao'),
(3, 'Financeiro'),
(4, 'Marketing'),
(5, 'Vendas'),
(6, 'Operacoes'),
(7, 'Juridico'),
(8, 'Logistica'),
(9, 'Producao'),
(10, 'Qualidade');

INSERT INTO funcionario (funcodigo, dcodigo, nome, nascimento, salario) VALUES
(1, 1, 'Ana Silva', '1990-05-15', 5500.00),
(2, 1, 'Bruno Costa', '1988-11-01', 7200.00),
(3, 2, 'Carla Dias', '1995-02-20', 4800.00),
(4, 2, 'Daniel Moreira', '1992-09-30', 6100.00),
(5, 3, 'Elisa Fernandes', '1985-07-12', 8000.00),
(6, 3, 'Fabio Guedes', '1998-01-05', 3900.00),
(7, 4, 'Gabriela Lima', '1983-03-18', 9500.00),
(8, 4, 'Heitor Bastos', '1993-12-25', 4300.00),
(9, 1, 'Isabela Rocha', '1996-06-08', 4100.00),
(10, 2, 'Jonas Martins', '1991-04-14', 7600.00);

INSERT INTO dependente (depcodigo, funcodigo, depnome) VALUES
(1, 1, 'Filho 1 da Ana'),
(2, 1, 'Filho 2 da Ana'),
(3, 2, 'Filho do Bruno'),
(4, 3, 'Filha 1 da Carla'),
(5, 3, 'Filha 2 da Carla'),
(6, 5, 'Filho da Elisa'),
(7, 7, 'Filho 1 da Gabriela'),
(8, 7, 'Filho 2 da Gabriela'),
(9, 8, 'Filho do Heitor'),
(10, 4, 'Filho do Daniel');

-- Atividade Select: consultar os dados de todas as tabelas

SELECT * FROM departamento;
SELECT * FROM funcionario;
SELECT * FROM dependente;

-- Atividade Update: alterar 5 registros em cada tabela (nomes e salarios)

UPDATE departamento SET dnome = 'Departamento de Recursos Humanos' WHERE dcodigo = 1;
UPDATE departamento SET dnome = 'Departamento de TI' WHERE dcodigo = 2;
UPDATE departamento SET dnome = 'Departamento Financeiro' WHERE dcodigo = 3;
UPDATE departamento SET dnome = 'Departamento de Marketing' WHERE dcodigo = 4;
UPDATE departamento SET dnome = 'Departamento de Vendas' WHERE dcodigo = 5;

UPDATE funcionario SET nome = 'Ana Beatriz Silva', salario = 5800.00 WHERE funcodigo = 1;
UPDATE funcionario SET nome = 'Bruno A. Costa', salario = 7500.00 WHERE funcodigo = 2;
UPDATE funcionario SET nome = 'Carla Regina Dias', salario = 5000.00 WHERE funcodigo = 3;
UPDATE funcionario SET nome = 'Daniel O. Moreira', salario = 6300.00 WHERE funcodigo = 4;
UPDATE funcionario SET nome = 'Elisa M. Fernandes', salario = 8200.00 WHERE funcodigo = 5;

UPDATE dependente SET depnome = 'Pedro Silva' WHERE depcodigo = 1;
UPDATE dependente SET depnome = 'Paula Silva' WHERE depcodigo = 2;
UPDATE dependente SET depnome = 'Rafael Costa' WHERE depcodigo = 3;
UPDATE dependente SET depnome = 'Mariana Dias' WHERE depcodigo = 4;
UPDATE dependente SET depnome = 'Lucas Dias' WHERE depcodigo = 5;

-- Atividade Delete: excluir 6 registros da tabela departamento
-- (os departamentos 5 a 10 nao tem funcionario vinculado)

DELETE FROM departamento WHERE dcodigo IN (5, 6, 7, 8, 9, 10);

-- Atividade Select: consultar os dados da tabela departamento

SELECT * FROM departamento;
