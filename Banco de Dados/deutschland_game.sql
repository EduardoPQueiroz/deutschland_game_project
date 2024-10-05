CREATE DATABASE deutschland_game;
USE deutschland_game;

CREATE TABLE Usuario (
    id BIGINT IDENTITY PRIMARY KEY,
    nome_usuario VARCHAR(64) NOT NULL
);

CREATE TABLE Conquistas (
    id BIGINT IDENTITY PRIMARY KEY,
    atributo VARCHAR(64) NOT NULL, 
    valor DECIMAL(10,2) NOT NULL,  
    id_usuario BIGINT NOT NULL,        
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Personagem (
    id BIGINT IDENTITY PRIMARY KEY,
    nome VARCHAR(128) NOT NULL
);

CREATE TABLE Dialogo (
    id BIGINT IDENTITY PRIMARY KEY,
    mensagem VARCHAR(256) NOT NULL,        
    id_personagem BIGINT NOT NULL, 
    id_era BIGINT NOT NULL
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id)
    
);

ALTER TABLE Dialogo ADD COLUMN id_era bigint

CREATE TABLE Consequencia (
    id BIGINT IDENTITY PRIMARY KEY,
    dialogo_id BIGINT NOT NULL,        
    conquista_id BIGINT NOT NULL,      
	resposta BIT NOT NULL,
    valor_mudanca DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY (dialogo_id) REFERENCES Dialogo(id),
    FOREIGN KEY (conquista_id) REFERENCES Conquistas(id)
);

CREATE TABLE Era (

	id BIGINT IDENTITY PRIMARY KEY,
	nome varchar(30) NOT NULL UNIQUE,

)

alter table Dialogo add id_era bigint
alter table Dialogo add foreign key (id_era) references Era(id)

-- Inserts de teste/exemplo

-- 1. Inserindo Usuários
INSERT INTO Usuario (nome_usuario) VALUES ('Jogador1');
INSERT INTO Usuario (nome_usuario) VALUES ('Jogador2');

-- Diplomatas
INSERT INTO Personagem (nome) VALUES ('Joachim von Ribbentrop');
INSERT INTO Personagem (nome) VALUES ('Friedrich von Hohenstaufen');

-- Igreja
INSERT INTO Personagem (nome) VALUES ('Martinho Lutero');
INSERT INTO Personagem (nome) VALUES ('Papa Pio XII');

-- Povo
INSERT INTO Personagem (nome) VALUES ('Micheal Braun');
INSERT INTO Personagem (nome) VALUES ('Thomas Fritz');

-- Exército
INSERT INTO Personagem (nome) VALUES ('Johann Tserclaes');
INSERT INTO Personagem (nome) VALUES ('Gerd von Rundstedt');

-- Dinheiro
INSERT INTO Personagem (nome) VALUES ('Jakob Fugger');
INSERT INTO Personagem (nome) VALUES ('Hjalmar Schacht');

-- Diplomatas
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Você deseja negociar uma aliança militar com nossos vizinhos?', 1);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Deve-se fortalecer as relações diplomáticas com outras nações?', 2);

-- Igreja
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Você apoia a construção de uma nova catedral?', 3);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Devemos financiar uma nova cruzada para fortalecer a fé?', 4);

-- Povo
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Você deseja implementar novas políticas de bem-estar social?', 5);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Deve-se reduzir os impostos para o povo?', 6);

-- Exército
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Você quer expandir as forças armadas?', 7);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('É necessário modernizar o exército?', 8);

-- Dinheiro
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Você deseja investir em novos empreendimentos comerciais?', 9);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Deve-se reduzir a dívida nacional?', 10);

-- Atributos possíveis: Diplomacia, Exército, Reputação Igreja, Popularidade, Dinheiro.
-- Conquistas para o Jogador 1
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('diplomacia', 50.00, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('exercito', 70.00, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('rpt_igreja', 60.00, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('popularidade', 40.00, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('dinheiro', 100.00, 1);

-- Conquistas para o Jogador 2
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('diplomacia', 60.00, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('exercito', 80.00, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('rpt_igreja', 50.00, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('popularidade', 30.00, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('dinheiro', 110.00, 2);

-- 5. Inserindo Consequências
-- Diplomatas
-- Diálogo 1: Negociar aliança militar
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (1, 1, 1, 15); -- Se aceito, aumenta diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (1, 2, 1, 10); -- Se aceito, aumenta poder do exército
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (1, 5, 0, -20); -- Se recusado, diminui dinheiro

-- Diálogo 2: Fortalecer relações diplomáticas
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (2, 1, 1, 20); -- Se aceito, aumenta diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (2, 5, 0, -15); -- Se recusado, diminui dinheiro

-- Igreja
-- Diálogo 3: Construir nova catedral
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (3, 3, 1, 25); -- Se aceito, aumenta reputação com a igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (3, 5, 1, -30); -- Se aceito, diminui dinheiro
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (3, 3, 0, -15); -- Se recusado, diminui reputação com a igreja

-- Diálogo 4: Financiar nova cruzada
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (4, 3, 1, 20); -- Se aceito, aumenta reputação com a igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (4, 5, 1, -25); -- Se aceito, diminui dinheiro
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (4, 3, 0, -10); -- Se recusado, diminui reputação com a igreja

-- Povo
-- Diálogo 5: Implementar políticas de bem-estar social
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (5, 4, 1, 30); -- Se aceito, aumenta popularidade
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (5, 5, 1, -20); -- Se aceito, diminui dinheiro
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (5, 4, 0, -15); -- Se recusado, diminui popularidade

-- Diálogo 6: Reduzir impostos para o povo
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (6, 4, 1, 20); -- Se aceito, aumenta popularidade
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (6, 5, 1, -15); -- Se aceito, diminui dinheiro
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (6, 4, 0, -10); -- Se recusado, diminui popularidade

-- Exército
-- Diálogo 7: Expandir as forças armadas
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (7, 2, 1, 25); -- Se aceito, aumenta poder do exército
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (7, 5, 1, -35); -- Se aceito, diminui dinheiro
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (7, 2, 0, -20); -- Se recusado, diminui poder do exército

-- Diálogo 8: Modernizar o exército
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (8, 2, 1, 20); -- Se aceito, aumenta poder do exército
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (8, 5, 1, -30); -- Se aceito, diminui dinheiro
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (8, 2, 0, -15); -- Se recusado, diminui poder do exército
