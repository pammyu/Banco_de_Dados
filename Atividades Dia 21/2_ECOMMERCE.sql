CREATE DATABASE db_amazonEcommerce;

USE db_amazonEcommerce;

CREATE TABLE tb_livros(
id BIGINT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(255) NOT NULL,
autor VARCHAR(255),
preco DECIMAL(10,2),
estoque INT
);

SELECT * FROM tb_livros;

CREATE TABLE tb_generos (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL
);

ALTER TABLE tb_livros ADD COLUMN genero_id BIGINT, ADD CONSTRAINT fk_genero FOREIGN KEY (genero_id) REFERENCES tb_generos(id);

SELECT * FROM tb_generos;

INSERT INTO tb_generos (nome)
VALUES ("Fantasia"),
       ("Terror"),
       ("Ficção Científica"),
       ("Infantojuvenil");
       
INSERT INTO tb_livros (titulo, autor, preco, genero_id)
VALUES 
("O Hobbit", "J.R.R. Tolkien", 89.90, 1),
("O Senhor dos Anéis", "J.R.R. Tolkien", 199.90, 1),
("IT: A Coisa", "Stephen King", 79.50, 2),
("O Iluminado", "Stephen King", 69.90, 2),
("Carrie", "Stephen King", 55.00, 2),
("Duna", "Frank Herbert", 120.00, 3),
("O Pequeno Príncipe", "Antoine de Saint-Exupéry", 35.00, 4),
("As Crônicas de Nárnia", "C.S. Lewis", 89.00, 1);

SELECT  livros.id, livros.titulo, livros.autor, livros.preco, livros.estoque, genero.nome AS genero FROM tb_livros livros
INNER JOIN tb_generos genero ON livros.genero_id = genero.id;

SET SQL_SAFE_UPDATES = 0;

UPDATE tb_livros SET estoque = 1000 WHERE id IN (1, 3, 5);
UPDATE tb_livros SET estoque = 380 WHERE id IN (2, 4);
UPDATE tb_livros SET estoque = 110 WHERE id IN (7, 8);
UPDATE tb_livros SET estoque = 2 WHERE id = 6;

SELECT * FROM tb_livros WHERE preco > 500;

SELECT * FROM tb_livros WHERE preco  < 500;

UPDATE tb_livros SET preco = 550.00 WHERE titulo = "Duna";
