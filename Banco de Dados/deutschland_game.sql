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
    foiAceito BIT NOT NULL,       
    id_personagem INT NOT NULL, 
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id)
);

CREATE TABLE Consequencia (
    id INT IDENTITY PRIMARY KEY,
    dialogo_id INT NOT NULL,        
    conquista_id INT NOT NULL,      
    valor_mudanca DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY (dialogo_id) REFERENCES Dialogo(id),
    FOREIGN KEY (conquista_id) REFERENCES Conquistas(id)
);
