CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
id BIGINT PRIMARY KEY AUTO_INCREMENT, 
sabor VARCHAR (255) NOT NULL, 
tamanho VARCHAR (50),
borda VARCHAR (50), 
preco DECIMAL (6,2) NOT NULL
);

SELECT * FROM tb_categorias;

CREATE TABLE tb_pizzas (
id BIGINT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(255) NOT NULL, 
descricao VARCHAR(500),
disponibilidade BOOLEAN DEFAULT TRUE,
id_categorias BIGINT,
FOREIGN KEY (id_categorias) REFERENCES tb_categorias(id)
);

SELECT * FROM tb_pizzas;

INSERT INTO tb_categorias (sabor, tamanho, borda, preco) 
VALUES ("Pepperoni", "Médio", "Tradicional", 45.00 ),
("Portuguesa", "Grande", "Catupiry", 75.00),
("Quatro Queijos", "Médio", "Tradicional", 50.00),
("M&M's", "Pequena", "Chocolate", 55.00),
("Frango com Catupiry", "Grande", "Cheddar", 89.00);

INSERT INTO tb_pizzas (nome, descricao, disponibilidade, id_categorias) 
VALUES ("Pepperoni Especial", "Pizza Clássica com pepperoni crocante!", TRUE, 1),
("Pepperoni Duplo", "Extra pepperoni + queijo extra", TRUE, 1),
("Portuguesinha", "Presunto, ovos, cebola, azeitona e orégano", TRUE, 2),
("Portuguesinha Premium", "Versão especial com mais recheio e borda recheada", FALSE, 2),
("Quatro Queijos da Casa", "Mistura de queijos especiais derretidos", TRUE, 3),
("Quatro Queijos Chique", "Versão gourmet com queijos importados", FALSE, 3),
("Chocolate M&M's", "Pizza doce com chocolate derretido e M&M's", FALSE, 4),
("Frango Catupiry Supreme", "Frango desfiado com catupiry original", TRUE, 5);

SELECT tb_pizzas.nome, tb_pizzas.descricao, tb_pizzas.disponibilidade, tb_categorias.sabor, 
tb_categorias.tamanho, tb_categorias.borda, tb_categorias.preco FROM tb_pizzas INNER JOIN tb_categorias ON
tb_pizzas.id_categorias = tb_categorias.id;

SELECT tb_pizzas.nome, tb_pizzas.descricao, tb_pizzas.disponibilidade, tb_categorias.sabor, 
tb_categorias.tamanho, tb_categorias.borda, tb_categorias.preco FROM tb_pizzas INNER JOIN tb_categorias ON
tb_pizzas.id_categorias = tb_categorias.id WHERE preco > 45.00;

SELECT tb_pizzas.nome, tb_pizzas.descricao, tb_pizzas.disponibilidade, tb_categorias.sabor, 
tb_categorias.tamanho, tb_categorias.borda, tb_categorias.preco FROM tb_pizzas INNER JOIN tb_categorias ON
tb_pizzas.id_categorias = tb_categorias.id WHERE preco BETWEEN 50.00 AND 100.00;

SELECT tb_pizzas.nome, tb_pizzas.descricao, tb_pizzas.disponibilidade, tb_categorias.sabor, 
tb_categorias.tamanho, tb_categorias.borda, tb_categorias.preco FROM tb_pizzas INNER JOIN tb_categorias ON
tb_pizzas.id_categorias = tb_categorias.id WHERE nome LIKE "%M%";

SELECT tb_pizzas.nome, tb_pizzas.descricao, tb_pizzas.disponibilidade, tb_categorias.sabor, 
tb_categorias.tamanho, tb_categorias.borda, tb_categorias.preco FROM tb_pizzas INNER JOIN tb_categorias ON
tb_pizzas.id_categorias = tb_categorias.id WHERE tamanho = "Grande";