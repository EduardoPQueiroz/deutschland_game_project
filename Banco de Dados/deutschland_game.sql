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
    nome VARCHAR(128) NOT NULL,
	personagemImg text
);

CREATE TABLE Dialogo (
    id BIGINT IDENTITY PRIMARY KEY,
    mensagem VARCHAR(256) NOT NULL,        
    id_personagem BIGINT NOT NULL, 
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id)
);

CREATE TABLE Consequencia (
    id BIGINT IDENTITY PRIMARY KEY,
    dialogo_id BIGINT NOT NULL,        
    conquista_id BIGINT NOT NULL,      
	foiPositivo BIT NOT NULL,
    valor_mudanca DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY (dialogo_id) REFERENCES Dialogo(id),
    FOREIGN KEY (conquista_id) REFERENCES Conquistas(id)
);

-- Inserts de teste/exemplo

INSERT INTO Usuario (nome_usuario) VALUES ('Jo�o');
INSERT INTO Usuario (nome_usuario) VALUES ('Maria');
INSERT INTO Usuario (nome_usuario) VALUES ('Carlos');

-- Conquistas do Jo�o
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('igreja', 50, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('povo', 40, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('exercito', 30, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('economia', 70, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('diplomacia', 60, 1);

-- Conquistas da Maria
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('igreja', 60, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('povo', 80, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('exercito', 40, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('economia', 90, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('diplomacia', 50, 2);

-- Conquistas do Carlos
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('igreja', 55, 3);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('povo', 35, 3);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('exercito', 50, 3);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('economia', 65, 3);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('diplomacia', 75, 3);

INSERT INTO Personagem (nome) VALUES ('Rei Fernando');
INSERT INTO Personagem (nome) VALUES ('Conselheiro Lu�s');
INSERT INTO Personagem (nome) VALUES ('General Marcos');

INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Voc� deseja construir uma igreja?', 1);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Voc� deve aumentar os impostos para fortalecer o ex�rcito?', 2);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Voc� quer assinar um tratado de paz?', 3);

-- Consequ�ncias para o di�logo 1 (Construir igreja)
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (1, 1, 1, 10); -- Aumenta a reputa��o com a igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (1, 4, 1, -20); -- Reduz o dinheiro (economia)

-- Consequ�ncias para o di�logo 2 (Aumentar impostos)
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (2, 3, 1, 15); -- Aumenta o poder do ex�rcito
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (2, 2, 1, -10); -- Reduz a popularidade (povo)

-- Consequ�ncias para o di�logo 3 (Assinar tratado de paz)
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (3, 5, 1, 20); -- Aumenta a diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (3, 3, 1, -15); -- Reduz a for�a militar (ex�rcito)
