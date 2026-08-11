-- Aula 13 - Funções de grupo e subconsulta
-- Atividade: soma, contagem, média, MAX/MIN, GROUP BY e HAVING
-- Base: script do professor (anexo da aula)

create database funcionario;
use funcionario;

CREATE TABLE funcionarios (
    codfunc INT PRIMARY KEY auto_increment,
    nomefunc VARCHAR(100) NOT NULL,
    sexofunc CHAR(1) NOT NULL,
    bairrofunc VARCHAR(100),
    salfunc DECIMAL(10, 2),
    setorfunc VARCHAR(50)
);

INSERT INTO funcionarios (codfunc, nomefunc, sexofunc, bairrofunc, salfunc, setorfunc)
VALUES
(1, 'Larissa Menezes', 'F', 'Jabaquara', 1200.00, 'Marketing'),
(2, 'Selma Nunes', 'F', 'Grajau', 3800.00, 'Vendas'),
(3, 'Leandro Henrique', 'M', 'Socorro', 2950.00, 'RH'),
(4, 'Amelia Jeremias', 'F', 'Socorro', 4200.00, 'Marketing'),
(5, 'Claudio Jorge Silva', 'M', 'Jabaquara', 1480.00, 'Vendas'),
(6, 'Luciano Souza', 'M', 'Pedreira', 1000.00, 'Vendas'),
(7, 'Gabriela Santos Nunes', 'F', 'Jurubatuba', 4150.00, 'Marketing'),
(8, 'Rafaela Vieira Jr', 'F', 'Jabaquara', 700.00, 'Marketing'),
(9, 'Suzana Crispim', 'F', 'Grajau', 5600.00, 'Producao'),
(10, 'Sabrina Oliveira Castro', 'F', 'Pedreira', 2900.00, 'Marketing'),
(11, 'Jarbas Silva Nunes', 'M', 'Jurubatuba', 5300.00, 'Producao'),
(12, 'Ralf Borges', 'M', 'Jabaquara', 1600.00, 'Marketing');

-- 1 - A soma dos salarios de todos os funcionarios

SELECT SUM(salfunc) FROM funcionarios;

-- 2 - A quantidade de funcionarios do setor de Marketing

SELECT COUNT(*) FROM funcionarios WHERE setorfunc = 'Marketing';

-- 3 - A media dos salarios por setor, ordenado pela media (decrescente)

SELECT setorfunc, AVG(salfunc)
FROM funcionarios
GROUP BY setorfunc
ORDER BY AVG(salfunc) DESC;

-- 4 - A quantidade de funcionarios que ganha menos de 3000 e mora no Socorro

SELECT COUNT(*) FROM funcionarios
WHERE salfunc < 3000 AND bairrofunc = 'Socorro';

-- 5 - Os setores que possuem mais do que 3 funcionarios

SELECT setorfunc, COUNT(*)
FROM funcionarios
GROUP BY setorfunc
HAVING COUNT(*) > 3;
