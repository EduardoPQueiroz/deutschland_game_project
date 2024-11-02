CREATE DATABASE deutschland_game;
USE deutschland_game;

CREATE TABLE Usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(64) NOT NULL
);

CREATE TABLE Personagem (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(128) NOT NULL
);

CREATE TABLE Era (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL UNIQUE,
    periodo VARCHAR(20) NOT NULL
);

CREATE TABLE Dialogo (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    mensagem VARCHAR(256) NOT NULL,        
    id_personagem BIGINT NOT NULL, 
    id_era BIGINT NOT NULL,
    FOREIGN KEY (id_personagem) REFERENCES Personagem(id),
    FOREIGN KEY (id_era) REFERENCES Era(id)
);

CREATE TABLE Conquistas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    atributo VARCHAR(64) NOT NULL
);

CREATE TABLE ConquistasUsuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    valor INT NOT NULL,
    id_conquistas BIGINT NOT NULL,
    id_usuario BIGINT NOT NULL, 
    FOREIGN KEY (id_conquistas) REFERENCES Conquistas(id),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Consequencia (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    dialogo_id BIGINT NOT NULL,        
    conquista_id BIGINT NOT NULL,      
    resposta BOOLEAN NOT NULL,
    valor_mudanca DECIMAL(10,2) NOT NULL, 
    FOREIGN KEY (dialogo_id) REFERENCES Dialogo(id),
    FOREIGN KEY (conquista_id) REFERENCES Conquistas(id)
);

CREATE TABLE RespostasTexto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    conteudo VARCHAR(250) NOT NULL,
    escolha BOOLEAN NOT NULL,
    id_dialogo BIGINT NOT NULL,
    FOREIGN KEY (id_dialogo) REFERENCES Dialogo(id)
);
