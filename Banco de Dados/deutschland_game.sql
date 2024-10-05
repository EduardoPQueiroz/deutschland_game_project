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
    nome VARCHAR(30) NOT NULL UNIQUE
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
    valor DECIMAL(10,2) NOT NULL,  
    id_usuario BIGINT NOT NULL,        
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE ConquistasUsuario (
    id BIGINT IDENTITY PRIMARY KEY,
    id_user BIGINT NOT NULL,
    id_conquista BIGINT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_user) REFERENCES Usuario(id),         
    FOREIGN KEY (id_conquista) REFERENCES Conquistas(id)   
);


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


-- Inserts de teste/exemplo

-- 1. Inserindo Usuários
INSERT INTO Usuario (nome_usuario) VALUES ('Jogador1');
INSERT INTO Usuario (nome_usuario) VALUES ('Jogador2');

-- 2. Inserindo Eras
INSERT INTO Era (nome) VALUES ('Era1');
INSERT INTO Era (nome) VALUES ('Era2');
INSERT INTO Era (nome) VALUES ('Era3');

-- 3. Inserindo Personagens
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

-- 4. Inserindo Conquistas (para os dois jogadores)
-- Jogador 1
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('reputacao_igreja', 50.00, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('dinheiro', 200.00, 1);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('popularidade', 75.00, 1);

-- Jogador 2
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('reputacao_igreja', 40.00, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('dinheiro', 250.00, 2);
INSERT INTO Conquistas (atributo, valor, id_usuario) VALUES ('popularidade', 60.00, 2);

-- 5. Inserindo Diálogos com seus personagens e eras
-- Diplomatas
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você deseja assinar um tratado de paz com a França?', 1, 3); -- Joachim von Ribbentrop, Era Contemporânea
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Deve-se fortalecer alianças com os reinos vizinhos?', 2, 1); -- Friedrich von Hohenstaufen, Era Medieval

-- Igreja
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você deseja construir uma igreja?', 3, 2); -- Martinho Lutero, Era Moderna
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você deve seguir os princípios da Igreja Católica?', 4, 3); -- Papa Pio XII, Era Contemporânea

-- Povo
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você deve aprovar uma reforma agrária para o povo?', 5, 3); -- Micheal Braun, Era Contemporânea
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você deve reduzir os impostos para os pequenos comerciantes?', 6, 3); -- Thomas Fritz, Era Contemporânea

-- Exército
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você deseja atacar o inimigo agora?', 7, 2); -- Johann Tserclaes, Era Moderna
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você deve investir mais em fortificações?', 8, 3); -- Gerd von Rundstedt, Era Contemporânea

-- Dinheiro
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você quer investir em mais recursos financeiros?', 9, 3); -- Jakob Fugger, Era Contemporânea
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Você deseja cortar os gastos públicos?', 10, 3); -- Hjalmar Schacht, Era Contemporânea

-- 6. Inserindo Consequências para os diálogos
-- Consequências para Jogador 1
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (1, 2, 1, -100.00); -- Dinheiro -100 (tratado de paz)
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (1, 3, 1, 20.00); -- Popularidade +20
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (2, 3, 1, 15.00); -- Popularidade +15
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (3, 1, 1, 10.00); -- Reputação igreja +10 (construir igreja)
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (3, 2, 1, -50.00); -- Dinheiro -50
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (7, 3, 1, 20.00); -- Popularidade +20 (atacar inimigo)

-- Consequências para Jogador 2
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (4, 4, 1, 10.00); -- Reputação igreja +10 (seguir princípios da Igreja Católica)
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (4, 5, 1, -30.00); -- Dinheiro -30
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (5, 6, 1, 25.00); -- Popularidade +25 (reforma agrária)
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (6, 6, 1, 20.00); -- Popularidade +20 (reduzir impostos)
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (8, 4, 1, 15.00); -- Reputação exército +15 (fortificações)
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (9, 5, 1, -50.00); -- Dinheiro -50 (investir em recursos financeiros)

-- 7. Inserindo RespostasTexto para cada diálogo
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Sim, vamos assinar o tratado de paz', 1, 1); -- Escolha sim
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Não, devemos continuar o conflito', 0, 1); -- Escolha não
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Sim, fortaleça as alianças', 1, 2); -- Escolha sim
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Não, não precisamos de aliados', 0, 2); -- Escolha não
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Sim, vamos construir a igreja', 1, 3); -- Escolha sim
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Não, não vamos construir', 0, 3); -- Escolha não
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Sim, devemos seguir a Igreja Católica', 1, 4); -- Escolha sim
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Não, devemos seguir outra linha', 0, 4); -- Escolha não
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Sim, vamos aprovar a reforma agrária', 1, 5); -- Escolha sim
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Não, a reforma agrária não é necessária', 0, 5); -- Escolha não
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Sim, vamos reduzir os impostos', 1, 6); -- Escolha sim
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Não, os impostos são necessários', 0, 6); -- Escolha não
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Sim, devemos atacar o inimigo', 1, 7); -- Escolha sim




