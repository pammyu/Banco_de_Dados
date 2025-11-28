CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
tipo_produto VARCHAR (255) NOT NULL,
requer_prescricao BOOLEAN DEFAULT FALSE, 
faixa_etaria VARCHAR(50), 
setor VARCHAR(50)
);

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (255) NOT NULL,
descricao VARCHAR (50),
estoque INT NOT NULL,
preco DECIMAL (6,2) NOT NULL,
id_categoria BIGINT NOT NULL,
FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_categorias (tipo_produto, requer_prescricao, faixa_etaria, setor) 
VALUES ("Antibiótico", TRUE, "Adulto", "Medicamentos"),
("Analgésicos e Antitérmicos", FALSE, "Geral", "Medicamentos"),
("Higiene Bucal", FALSE, "Geral", "Higiene e Beleza"),
("Vitaminas e Suplementos", FALSE, "Geral", "Suplementos" ),
("Curativos e Primeiros Socorros", FALSE, "Geral", "Primeiros Socorros"),
("Dermocosméticos", FALSE, "Adulto", "Dermocosméticos");

INSERT INTO tb_produtos (nome, descricao, estoque, preco, id_categoria) VALUES 
("Dipirona Sódica 1g", "Analgésico comprimidos", 120, 8.50, 2),
("Amoxicilina 500mg", "Antibiótico cápsulas", 30, 24.90, 1),
("Escova Dental Macia", "Escova para Higiene Bucal", 80, 12.99, 3),
("Vitamina C 500mg", "Suplemento vitamínico", 50, 29.90, 4),
("Band-Aid Médio", "Curativo adesivo", 150, 7.50, 5),
("Gel de Limpeza Facial Actine", "Dermocosmético para pele oleosa", 40, 79.90, 6),
("Ibuprofeno 400mg", "Anti-inflamatório", 100, 14.90, 2),
("Creme Hidratante Facial", "Dermocosmético hidratante", 35, 79.90, 6);

SELECT tb_produtos.nome, tb_produtos.descricao, tb_produtos.estoque, 
tb_produtos.preco, tb_categorias.tipo_produto, tb_categorias.faixa_etaria, tb_categorias.setor 
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id;

SELECT tb_produtos.nome, tb_produtos.descricao, tb_produtos.estoque, 
tb_produtos.preco, tb_categorias.tipo_produto, tb_categorias.faixa_etaria, tb_categorias.setor 
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id 
WHERE preco > 50.00;

SELECT tb_produtos.nome, tb_produtos.descricao, tb_produtos.estoque, 
tb_produtos.preco, tb_categorias.tipo_produto, tb_categorias.faixa_etaria, tb_categorias.setor 
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id 
WHERE preco BETWEEN 5.00 AND 60.00;

SELECT tb_produtos.nome, tb_produtos.descricao, tb_produtos.estoque, 
tb_produtos.preco, tb_categorias.tipo_produto, tb_categorias.faixa_etaria, tb_categorias.setor 
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id 
WHERE tb_produtos.nome LIKE "%c%";

SELECT tb_produtos.nome, tb_produtos.descricao, tb_produtos.estoque, 
tb_produtos.preco, tb_categorias.tipo_produto, tb_categorias.faixa_etaria, tb_categorias.setor 
FROM tb_produtos INNER JOIN tb_categorias ON tb_produtos.id_categoria = tb_categorias.id 
WHERE setor = "Dermocosméticos";
