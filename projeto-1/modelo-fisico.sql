-- =====================================================================
--  Projeto 1 - Banco de Dados (Parte 1)
--  Universidade BR - modelo fisico
--
--  Compilar no MySQL/MariaDB:
--      sudo mysql universidade_br < modelo-fisico.sql
--  (o script cria o banco se ele ainda nao existir)
--
--  Todos os 11 INSERT carregam 5 registros, conforme o enunciado.
-- =====================================================================

CREATE DATABASE universidade_br;
USE universidade_br;

-- ---------------------------------------------------------------------
-- 1. CURSO  (a universidade possui 15; aqui vao 5 de exemplo)
-- ---------------------------------------------------------------------
CREATE TABLE curso (
    codigo integer PRIMARY KEY,
    nome varchar(60) NOT NULL,
    turno varchar(20)
);

-- ---------------------------------------------------------------------
-- 2. DEPARTAMENTO  (cada departamento controla UM curso especifico -> 1:1)
-- ---------------------------------------------------------------------
CREATE TABLE departamento (
    codigo integer PRIMARY KEY,
    nome varchar(60) NOT NULL,
    codigo_curso integer,
    FOREIGN KEY (codigo_curso) REFERENCES curso(codigo)
);

-- ---------------------------------------------------------------------
-- 3. TURMA_INGRESSO  (turma do curso: o aluno pertence a apenas uma)
-- ---------------------------------------------------------------------
CREATE TABLE turma_ingresso (
    codigo integer PRIMARY KEY,
    semestre varchar(7),
    codigo_curso integer,
    FOREIGN KEY (codigo_curso) REFERENCES curso(codigo)
);

-- ---------------------------------------------------------------------
-- 4. ALUNO  (nome, sobrenome, cpf, rg, filiacao, endereco e telefone)
--     endereco decomposto em 1FN; matricula pode ser trancada
-- ---------------------------------------------------------------------
CREATE TABLE aluno (
    cpf varchar(11) PRIMARY KEY,
    nome varchar(60) NOT NULL,
    sobrenome varchar(60) NOT NULL,
    rg varchar(20),
    filiacao varchar(120),
    rua varchar(80),
    numero varchar(10),
    bairro varchar(60),
    cidade varchar(60),
    uf char(2),
    cep varchar(8),
    telefone varchar(20),
    situacao_matricula varchar(20),
    codigo_curso integer,
    codigo_turma integer,
    FOREIGN KEY (codigo_curso) REFERENCES curso(codigo),
    FOREIGN KEY (codigo_turma) REFERENCES turma_ingresso(codigo)
);

-- ---------------------------------------------------------------------
-- 5. DISCIPLINA  (nome, descricao, quantidade de alunos, carga horaria;
--     pertence a um departamento)
-- ---------------------------------------------------------------------
CREATE TABLE disciplina (
    codigo integer PRIMARY KEY,
    nome varchar(60) NOT NULL,
    descricao varchar(255),
    carga_horaria integer,
    quantidade_alunos integer,
    codigo_departamento integer,
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

-- ---------------------------------------------------------------------
-- 6. TURMA  (oferta de disciplina; no maximo 40 alunos por turma)
-- ---------------------------------------------------------------------
CREATE TABLE turma (
    codigo integer PRIMARY KEY,
    semestre varchar(7),
    max_alunos integer,
    codigo_disciplina integer,
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo)
);

-- ---------------------------------------------------------------------
-- 7. PROFESSOR  (sempre vinculado a um departamento;
--     leciona no maximo 7 disciplinas ou nenhuma)
-- ---------------------------------------------------------------------
CREATE TABLE professor (
    matricula integer PRIMARY KEY,
    nome varchar(60) NOT NULL,
    cpf varchar(11),
    codigo_departamento integer,
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

-- ---------------------------------------------------------------------
-- 8. CURSO_DISCIPLINA  (N:N: obrigatoria ou optativa depende do curso)
-- ---------------------------------------------------------------------
CREATE TABLE curso_disciplina (
    codigo_curso integer,
    codigo_disciplina integer,
    tipo varchar(20),
    PRIMARY KEY (codigo_curso, codigo_disciplina),
    FOREIGN KEY (codigo_curso) REFERENCES curso(codigo),
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo)
);

-- ---------------------------------------------------------------------
-- 9. DISCIPLINA_PRE_REQUISITO  (N:N da disciplina consigo mesma)
-- ---------------------------------------------------------------------
CREATE TABLE disciplina_pre_requisito (
    codigo_disciplina integer,
    codigo_pre_requisito integer,
    PRIMARY KEY (codigo_disciplina, codigo_pre_requisito),
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo),
    FOREIGN KEY (codigo_pre_requisito) REFERENCES disciplina(codigo)
);

-- ---------------------------------------------------------------------
-- 10. PROFESSOR_DISCIPLINA  (leciona; N:N professor x disciplina)
-- ---------------------------------------------------------------------
CREATE TABLE professor_disciplina (
    matricula integer,
    codigo_disciplina integer,
    PRIMARY KEY (matricula, codigo_disciplina),
    FOREIGN KEY (matricula) REFERENCES professor(matricula),
    FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo)
);

-- ---------------------------------------------------------------------
-- 11. HISTORICO  (aluno x turma: nota final, frequencia e periodo;
--     tambem e a matricula do aluno na turma da disciplina)
-- ---------------------------------------------------------------------
CREATE TABLE historico (
    codigo integer PRIMARY KEY,
    cpf_aluno varchar(11),
    codigo_turma integer,
    nota_final numeric(4,2),
    frequencia integer,
    periodo varchar(7),
    situacao varchar(20),
    FOREIGN KEY (cpf_aluno) REFERENCES aluno(cpf),
    FOREIGN KEY (codigo_turma) REFERENCES turma(codigo)
);

-- =====================================================================
-- 5 registros por tabela
-- =====================================================================

INSERT INTO curso (codigo, nome, turno) VALUES
(1, 'Analise e Desenvolvimento de Sistemas', 'noturno'),
(2, 'Gestao Empresarial', 'vespertino'),
(3, 'Eletronica Industrial', 'matutino'),
(4, 'Logistica', 'noturno'),
(5, 'Marketing', 'vespertino');

INSERT INTO departamento (codigo, nome, codigo_curso) VALUES
(10, 'Departamento de Computacao', 1),
(20, 'Departamento de Gestao', 2),
(30, 'Departamento de Eletronica', 3),
(40, 'Departamento de Logistica', 4),
(50, 'Departamento de Marketing', 5);

INSERT INTO turma_ingresso (codigo, semestre, codigo_curso) VALUES
(101, '2024.1', 1),
(102, '2025.1', 1),
(103, '2024.2', 2),
(104, '2025.1', 3),
(105, '2025.2', 4);

INSERT INTO aluno (cpf, nome, sobrenome, rg, filiacao, rua, numero, bairro,
                   cidade, uf, cep, telefone, situacao_matricula,
                   codigo_curso, codigo_turma) VALUES
('11111111111', 'Ana',   'Silva',    '1234567', 'Maria Silva e Joao Silva',
 'Rua das Flores', '10', 'Centro', 'Capao Bonito', 'SP', '18300000',
 '(15) 99999-1111', 'ativa', 1, 101),
('22222222222', 'Bruno', 'Souza',    '2345678', 'Ana Souza e Carlos Souza',
 'Av. Brasil', '200', 'Jardim', 'Capao Bonito', 'SP', '18300001',
 '(15) 99999-2222', 'ativa', 1, 102),
('33333333333', 'Carla', 'Oliveira', '3456789', 'Lucia Oliveira e Pedro Oliveira',
 'Rua Goias', '30', 'Vila Nova', 'Piedade', 'SP', '18301000',
 '(15) 99999-3333', 'trancada', 2, 103),
('44444444444', 'Diego', 'Pereira',  '4567890', 'Rosa Pereira e Mario Pereira',
 'Rua Bahia', '45', 'Centro', 'Sao Roque', 'SP', '18400000',
 '(15) 99999-4444', 'ativa', 3, 104),
('55555555555', 'Elisa', 'Costa',    '5678901', 'Vera Costa e Paulo Costa',
 'Rua Sao Paulo', '500', 'Estacao', 'Ibiuna', 'SP', '18500000',
 '(15) 99999-5555', 'ativa', 4, 105);

INSERT INTO disciplina (codigo, nome, descricao, carga_horaria,
                        quantidade_alunos, codigo_departamento) VALUES
(201, 'Banco de Dados', 'Modelagem e linguagem SQL', 80, 40, 10),
(202, 'Logica de Programacao', 'Algoritmos e estruturas basicas', 80, 40, 10),
(203, 'Programacao Web', 'Desenvolvimento de aplicacoes web', 80, 35, 10),
(204, 'Gestao de Suprimentos', 'Compras, estoque e distribuicao', 60, 30, 40),
(205, 'Comportamento do Consumidor', 'Perfil e decisao de compra', 60, 25, 50);

INSERT INTO turma (codigo, semestre, max_alunos, codigo_disciplina) VALUES
(1001, '2026.1', 40, 201),
(1002, '2026.1', 40, 202),
(1003, '2026.1', 40, 203),
(1004, '2026.1', 40, 204),
(1005, '2026.1', 40, 205);

INSERT INTO professor (matricula, nome, cpf, codigo_departamento) VALUES
(501, 'Fernanda Lima',  '66666666666', 10),
(502, 'Gabriel Santos', '77777777777', 10),
(503, 'Helena Rocha',   '88888888888', 40),
(504, 'Ivan Martins',   '99999999999', 20),
(505, 'Julia Almeida',  '10101010101', 50);

INSERT INTO curso_disciplina (codigo_curso, codigo_disciplina, tipo) VALUES
(1, 201, 'obrigatoria'),
(1, 202, 'obrigatoria'),
(1, 203, 'optativa'),
(4, 204, 'obrigatoria'),
(5, 205, 'obrigatoria');

INSERT INTO disciplina_pre_requisito (codigo_disciplina,
                                      codigo_pre_requisito) VALUES
(201, 202),
(203, 202),
(204, 202),
(205, 204),
(201, 203);

INSERT INTO professor_disciplina (matricula, codigo_disciplina) VALUES
(501, 201),
(502, 202),
(502, 203),
(503, 204),
(505, 205);

INSERT INTO historico (codigo, cpf_aluno, codigo_turma, nota_final,
                       frequencia, periodo, situacao) VALUES
(9001, '11111111111', 1001, 8.50, 95, '2026.1', 'cursando'),
(9002, '11111111111', 1002, 9.00, 100, '2026.1', 'cursando'),
(9003, '22222222222', 1001, 4.00, 70, '2026.1', 'cursando'),
(9004, '33333333333', 1004, 7.25, 85, '2026.1', 'cursando'),
(9005, '55555555555', 1005, 6.75, 90, '2026.1', 'cursando');
