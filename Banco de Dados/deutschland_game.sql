CREATE DATABASE deutschland_game;
USE deutschland_game;

CREATE TABLE Usuario (
    id BIGINT IDENTITY PRIMARY KEY,
    nome_usuario VARCHAR(64) NOT NULL
);

CREATE TABLE Personagem (
    id BIGINT IDENTITY PRIMARY KEY,
    nome VARCHAR(128) NOT NULL
);

CREATE TABLE Era (
    id BIGINT IDENTITY PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE Dialogo (
    id BIGINT IDENTITY PRIMARY KEY,
    mensagem VARCHAR(256) NOT NULL,        
    id_personagem BIGINT NOT NULL, 
    id_era BIGINT NOT NULL,
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_era) REFERENCES Era(id)
);

CREATE TABLE Conquistas (
    id BIGINT IDENTITY PRIMARY KEY,
    atributo VARCHAR(64) NOT NULL, 
);

create table ConquistasUsuario(

    id bigint IDENTITY PRIMARY KEY,
    valor int NOT NULL,
    id_conquistas bigint NOT NULL,
    id_usuario bigint NOT NULL, 
    FOREIGN KEY (id_conquistas) REFERENCES Conquistas(id),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
	
)

CREATE TABLE Consequencia (
    id BIGINT IDENTITY PRIMARY KEY,
    dialogo_id BIGINT NOT NULL,        
    conquista_id BIGINT NOT NULL,      
    resposta BIT NOT NULL,
    valor_mudanca DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY (dialogo_id) REFERENCES Dialogo(id),
    FOREIGN KEY (conquista_id) REFERENCES Conquistas(id)
);

CREATE TABLE RespostasTexto (
    id BIGINT NOT NULL PRIMARY KEY IDENTITY,
    conteudo VARCHAR(250) NOT NULL,
    escolha BIT NOT NULL,
    id_dialogo BIGINT NOT NULL,
    FOREIGN KEY (id_dialogo) REFERENCES Dialogo(id)
);
