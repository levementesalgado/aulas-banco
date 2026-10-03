
-- empresa_joins.sql
DROP TABLE IF EXISTS dependente;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS departamento;

CREATE TABLE departamento (
    iddep INTEGER PRIMARY KEY AUTOINCREMENT,
    depnome VARCHAR(50)
);

CREATE TABLE funcionario (
    idfun INTEGER PRIMARY KEY AUTOINCREMENT,
    funnome VARCHAR(100),
    funnascimento DATE,
    funsalario DECIMAL(10,2),
    iddep INTEGER,
    FOREIGN KEY (iddep) REFERENCES departamento(iddep)
);

CREATE TABLE dependente (
    iddep2 INTEGER PRIMARY KEY AUTOINCREMENT,
    depnome VARCHAR(100),
    idfun INTEGER,
    FOREIGN KEY (idfun) REFERENCES funcionario(idfun)
);

INSERT INTO departamento (depnome) VALUES
('RECURSOS HUMANOS'), ('TECNOLOGIA EM INFORMAÇÃO'), ('FINANCEIRO'),
('MARKETING'), ('VENDAS'), ('OPERAÇÕES'), ('JURIDICO'),
('LOGISTICA'), ('PRODUÇÃO'), ('QUALIDADE');

INSERT INTO funcionario (iddep, funnome, funnascimento, funsalario) VALUES
(1, 'Ana Silva',       '1990-05-15', 5500.00),
(2, 'Bruno Costa',     '1988-11-01', 7200.00),
(3, 'Carla Dias',      '1995-02-20', 4800.00),
(4, 'Daniel Moreira',  '1992-09-30', 6100.00),
(5, 'Elisa Fernandes', '1985-07-12', 8000.00),
(1, 'Fábio Guedes',    '1998-01-05', 3900.00),
(2, 'Gabriela Lima',   '1983-03-18', 9500.00),
(8, 'Heitor Bastos',   '1993-12-25', 4300.00),
(9, 'Isabela Rocha',   '1996-06-08', 4100.00),
(5, 'Jonas Martins',   '1991-04-14', 7600.00);

INSERT INTO dependente (depnome, idfun) VALUES
('Filho 1 da Ana',      1),
('Filho 2 da Ana',      1),
('Filho 3 da Ana',      1),
('Filho do Bruno',      2),
('Filha 1 da Carla',    3),
('Filha 2 da Carla',    3),
('Filho da Elisa',      5),
('Filho 1 da Gabriela', 7),
('Filho 2 da Gabriela', 7),
('Filho do Heitor',     8);
