CREATE DATABASE db_GestaoColaboradores;

USE db_GestaoColaboradores;

CREATE TABLE tb_colaboradores(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL, 
cpf CHAR(11) UNIQUE, 
cargo VARCHAR(50),
salario DECIMAL(10,2)
);

SELECT * FROM tb_colaboradores;

CREATE TABLE tb_departamentos(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (100) NOT NULL
);

SELECT * FROM tb_departamentos;

INSERT INTO tb_colaboradores (nome, cpf, cargo, salario) VALUES
('Pâmela dos Reis', 47857828033, 'Desenvolvedora Front-End Jr', 1800.00),
('Mateus Dorneles', 90370192001, 'Desenvolvedor Fullstack Jr', 4500.00),
('Arthur Barbosa', 32177302080, 'Analista de Treinamento', 4000.00),
('Bianca Cavalcanti', 58574242080, 'Analista de Testes (QA)', 3800.00),
('Samantha Correia', 35868291085, 'Assistente Financeiro', 2300.00);

ALTER TABLE tb_colaboradores ADD COLUMN departamento_id BIGINT, ADD CONSTRAINT fk_departamento FOREIGN KEY(departamento_id) REFERENCES tb_departamentos(id);

INSERT INTO tb_departamentos (nome)
VALUES ('Tecnologia'),
       ('Recursos Humanos'),
       ('Financeiro');
       
UPDATE tb_colaboradores SET departamento_id = 1 WHERE id IN (1, 2, 4);

UPDATE tb_colaboradores SET departamento_id = 2 WHERE id = 3;

UPDATE tb_colaboradores SET departamento_id = 3 WHERE id = 5;

SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

SELECT * FROM tb_colaboradores WHERE salario < 2000.00;
