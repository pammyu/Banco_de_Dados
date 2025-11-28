CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_estudantes (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
nome_completo VARCHAR(255) NOT NULL, 
data_nascimento DATE,
telefone_responsavel VARCHAR(20),
ano_escolar VARCHAR(20),
turno CHAR(10),
nota_final DECIMAL(4,2)
);

INSERT INTO tb_estudantes (nome_completo, data_nascimento, telefone_responsavel, ano_escolar, turno, nota_final) VALUES 
('Yasmin Martins', '2009-11-26', '(51) 998124432', '2° EM', 'Manhã', '6.5'),
('Lucca Almeida', '2014-05-29', '(51) 984905568', '6°', 'Tarde', '8.0'),
('Marina Lemos', '2011-04-13', '(51) 993128740', '9°', 'Manhã', '10.0'),
('Isabella Nascimento', '2009-11-26', '(51) 983271098', '2° EM', 'Manhã', '8.8'),
('Enzo Gabriel Moura', '2014-05-29', '(51) 995637204', '6°', 'Tarde', '8.9'),
('Theodor Santana', '2011-04-13', '(51) 998124432', '9°', 'Manhã', '5.5'),
('Miguel Ribeiro', '2009-11-26', '(51) 997541098', '2° EM', 'Manhã', '6.0'),
('Beatriz Ribeiro', '2011-04-13', '(51) 992881914', '9°', 'Manhã', '9.7');

SELECT * FROM tb_estudantes;

SELECT * FROM tb_estudantes WHERE nota_final > 7.0;

SELECT * FROM tb_estudantes WHERE nota_final < 7.0;

UPDATE tb_estudantes SET nota_final = 10 WHERE id = 4;