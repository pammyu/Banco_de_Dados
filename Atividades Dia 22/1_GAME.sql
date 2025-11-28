CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes (
id BIGINT PRIMARY KEY AUTO_INCREMENT, 
nome_classe VARCHAR (255) NOT NULL,
tipo_ataque VARCHAR (255),
bonus_classe VARCHAR (30)
);

SELECT * FROM tb_classes;

INSERT INTO tb_classes (nome_classe, tipo_ataque, bonus_classe) 
VALUES ("Guerreiro", "Físico", "+ 15% Força Física"), 
("Mago", "Mágico", "+ 20% Poder Arcano"),
("Arqueiro", "À distância", "+ 10% Precisão"),
("Paladino", "Físico/Sagrado", "+ 15% Defesa Sagrada"),
("Druida", "Mágico/Físico", "+ 12% Regeneração"), 
("Bárbaro", "Físico", "+ 20% Dano em Fúria");

CREATE TABLE tb_personagens (
id BIGINT PRIMARY KEY AUTO_INCREMENT,
nome_personagem VARCHAR (255) NOT NULL UNIQUE,
poder_ataque INT,
poder_defesa INT,
nivel INT,
id_classe BIGINT NOT NULL,
FOREIGN KEY (id_classe) REFERENCES tb_classes(id)
);

INSERT INTO tb_personagens (nome_personagem, poder_ataque, poder_defesa, nivel, id_classe) 
VALUES ("Mafe", 4200, 3800, 10, 1), ("Tricia", 3500, 1800, 8, 3), ("Pam", 3000, 2700, 9, 5),          
("Nana", 2800, 4500, 11, 4), ("Lia", 5000, 1500, 10, 2), ("Analei", 8000, 3000, 12, 6),    
("Seraphine", 4500, 4000, 7, 1), ("Orpheus", 3700, 1700, 8, 3);      

SELECT * FROM tb_personagens;

SELECT tb_personagens.id, tb_personagens.nome_personagem, tb_personagens.poder_ataque, 
tb_personagens.poder_defesa, tb_personagens.nivel, tb_classes.nome_classe AS classe
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id;

SELECT tb_personagens.id, tb_personagens.nome_personagem, tb_personagens.poder_ataque, tb_personagens.poder_defesa, tb_personagens.nivel, tb_classes.nome_classe 
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id WHERE poder_ataque > 2000;

SELECT tb_personagens.id, tb_personagens.nome_personagem, tb_personagens.poder_ataque, tb_personagens.poder_defesa, tb_personagens.nivel, tb_classes.nome_classe
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT tb_personagens.id, tb_personagens.nome_personagem, tb_personagens.poder_ataque, tb_personagens.poder_defesa, tb_personagens.nivel, tb_classes.nome_classe
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id WHERE nome_personagem LIKE "%c%";

SELECT tb_personagens.id, tb_personagens.nome_personagem, tb_personagens.poder_ataque, tb_personagens.poder_defesa, tb_personagens.nivel, tb_classes.nome_classe
FROM tb_personagens INNER JOIN tb_classes ON tb_personagens.id_classe = tb_classes.id WHERE nome_classe = "Guerreiro";