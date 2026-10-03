-- Criação do banco de dados (opcional)
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Criação da tabela funcionarios
DROP TABLE IF EXISTS funcionarios;
CREATE TABLE funcionarios (
    Codfunc INT PRIMARY KEY,
    nomefunc VARCHAR(100) NOT NULL,
    sexofunc CHAR(1) NOT NULL,
    bairrofunc VARCHAR(50) NOT NULL,
    salfunc DECIMAL(10,2) NOT NULL,
    setorfunc VARCHAR(30) NOT NULL
);

-- Inserção dos registros
INSERT INTO funcionarios (Codfunc, nomefunc, sexofunc, bairrofunc, salfunc, setorfunc) VALUES
(1, 'Larissa Menezes', 'F', 'Jabaquara', 1200.00, 'Marketing'),
(2, 'Selma Nunes', 'F', 'Grajaú', 3800.00, 'Vendas'),
(3, 'Leandro Henrique', 'M', 'Socorro', 2950.00, 'RH'),
(4, 'Amélia Jeremias', 'F', 'Socorro', 4200.00, 'Marketing'),
(5, 'Cláudio Jorge Silva', 'M', 'Jabaquara', 1480.00, 'Vendas'),
(6, 'Luciano Souza', 'M', 'Pedreira', 1000.00, 'Vendas'),
(7, 'Gabriela Santos Nunes', 'F', 'Jurubatuba', 4150.00, 'Marketing'),
(8, 'Rafaela Vieira Jr', 'F', 'Jabaquara', 700.00, 'Marketing'),
(9, 'Suzana Crispim', 'F', 'Grajaú', 5600.00, 'Produção'),
(10, 'Sabrina Oliveira Castro', 'F', 'Pedreira', 2900.00, 'Marketing'),
(11, 'Jarbas Silva Nunes', 'M', 'Jurubatuba', 5300.00, 'Produção'),
(12, 'Ralf Borges', 'M', 'Jabaquara', 1600.00, 'Marketing');

-- Consulta para verificar os dados inseridos
SELECT * FROM funcionarios ORDER BY Codfunc;
