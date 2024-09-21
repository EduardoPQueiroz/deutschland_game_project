CREATE DATABASE deutschland_game;
USE deutschland_game;

CREATE TABLE Usuario (
    id INT IDENTITY PRIMARY KEY,
    nome_usuario VARCHAR(64) NOT NULL
);

CREATE TABLE Conquistas (
    id INT IDENTITY PRIMARY KEY,
    atributo VARCHAR(64) NOT NULL, 
    valor DECIMAL(10,2) NOT NULL,  
    id_usuario INT NOT NULL,        
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Personagem (
    id INT IDENTITY PRIMARY KEY,
    nome VARCHAR(128) NOT NULL    
);

CREATE TABLE Dialogo (
    id INT IDENTITY PRIMARY KEY,
    mensagem VARCHAR(256) NOT NULL,        
    id_personagem INT NOT NULL, 
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id)
);

CREATE TABLE Consequencia (
    id INT IDENTITY PRIMARY KEY,
    dialogo_id INT NOT NULL,        
    conquista_id INT NOT NULL,      
	foiPositivo BIT NOT NULL,
    valor_mudanca DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY (dialogo_id) REFERENCES Dialogo(id),
    FOREIGN KEY (conquista_id) REFERENCES Conquistas(id)
);

-- Inserts de teste/exemplo

INSERT INTO Usuario (nome_usuario) VALUES ('João');
INSERT INTO Usuario (nome_usuario) VALUES ('Maria');
INSERT INTO Usuario (nome_usuario) VALUES ('Carlos');

-- Conquistas do João
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
INSERT INTO Personagem (nome) VALUES ('Conselheiro Luís');
INSERT INTO Personagem (nome) VALUES ('General Marcos');

INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Você deseja construir uma igreja?', 1);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Você deve aumentar os impostos para fortalecer o exército?', 2);
INSERT INTO Dialogo (mensagem, id_personagem) VALUES ('Você quer assinar um tratado de paz?', 3);

-- Consequências para o diálogo 1 (Construir igreja)
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (1, 1, 1, 10); -- Aumenta a reputação com a igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (1, 4, 1, -20); -- Reduz o dinheiro (economia)

-- Consequências para o diálogo 2 (Aumentar impostos)
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (2, 3, 1, 15); -- Aumenta o poder do exército
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (2, 2, 1, -10); -- Reduz a popularidade (povo)

-- Consequências para o diálogo 3 (Assinar tratado de paz)
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (3, 5, 1, 20); -- Aumenta a diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, foiPositivo, valor_mudanca) VALUES (3, 3, 1, -15); -- Reduz a força militar (exército)
