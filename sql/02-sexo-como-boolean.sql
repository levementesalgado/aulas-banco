-- Criação do banco (opcional)
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Tabela com sexofunc como booleano (0 = F, 1 = M)
DROP TABLE IF EXISTS funcionarios;
CREATE TABLE funcionarios (
    Codfunc INT PRIMARY KEY,
    nomefunc VARCHAR(100) NOT NULL,
    sexofunc INT(1) NOT NULL,  -- 0=Feminino, 1=Masculino
    bairrofunc VARCHAR(50) NOT NULL,
    salfunc DECIMAL(10,2) NOT NULL,
    setorfunc VARCHAR(30) NOT NULL
);

-- Inserção dos registros (1 = M, 0 = F)
INSERT INTO funcionarios (Codfunc, nomefunc, sexofunc, bairrofunc, salfunc, setorfunc) VALUES
(1, 'Larissa Menezes', 0, 'Jabaquara', 1200.00, 'Marketing'),
(2, 'Selma Nunes', 0, 'Grajaú', 3800.00, 'Vendas'),
(3, 'Leandro Henrique', 1, 'Socorro', 2950.00, 'RH'),
(4, 'Amélia Jeremias', 0, 'Socorro', 4200.00, 'Marketing'),
(5, 'Cláudio Jorge Silva', 1, 'Jabaquara', 1480.00, 'Vendas'),
(6, 'Luciano Souza', 1, 'Pedreira', 1000.00, 'Vendas'),
(7, 'Gabriela Santos Nunes', 0, 'Jurubatuba', 4150.00, 'Marketing'),
(8, 'Rafaela Vieira Jr', 0, 'Jabaquara', 700.00, 'Marketing'),
(9, 'Suzana Crispim', 0, 'Grajaú', 5600.00, 'Produção'),
(10, 'Sabrina Oliveira Castro', 0, 'Pedreira', 2900.00, 'Marketing'),
(11, 'Jarbas Silva Nunes', 1, 'Jurubatuba', 5300.00, 'Produção'),
(12, 'Ralf Borges', 1, 'Jabaquara', 1600.00, 'Marketing');

SELECT 
    Codfunc,
    nomefunc,
    CASE WHEN sexofunc = 1 THEN 'M' ELSE 'F' END AS sexofunc,
    bairrofunc,
    salfunc,
    setorfunc
FROM funcionarios
ORDER BY Codfunc;
