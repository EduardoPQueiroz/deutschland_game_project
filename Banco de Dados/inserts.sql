use deutschland_game

-- PERSONAGENS

-- Diplomacia
INSERT INTO Personagem (nome) VALUES ('Joachim von Ribbentrop'); -- 1
INSERT INTO Personagem (nome) VALUES ('Friedrich von Hohenstaufen'); -- 2

-- Igreja
INSERT INTO Personagem (nome) VALUES ('Martinho Lutero'); -- 3
INSERT INTO Personagem (nome) VALUES ('Papa Pio XII'); -- 4

-- Povo
INSERT INTO Personagem (nome) VALUES ('Micheal Braun'); -- 5
INSERT INTO Personagem (nome) VALUES ('Thomas Fritz'); -- 6

-- Exército
INSERT INTO Personagem (nome) VALUES ('Johann Tserclaes'); -- 7
INSERT INTO Personagem (nome) VALUES ('Gerd von Rundstedt'); -- 8

-- Dinheiro
INSERT INTO Personagem (nome) VALUES ('Jakob Fugger'); -- 9 
INSERT INTO Personagem (nome) VALUES ('Hjalmar Schacht'); -- 10

-- CONQUISTAS

	select * from Conquistas 

	delete Conquistas

	INSERT INTO Conquistas (atributo) VALUES ('Popularidade') -- 1
	INSERT INTO Conquistas (atributo) VALUES ('Igreja') -- 2
	INSERT INTO Conquistas (atributo) VALUES ('Diplomacia') -- 3
	INSERT INTO Conquistas (atributo) VALUES ('Economia') -- 4
	INSERT INTO Conquistas (atributo) VALUES ('Exército') -- 5


-- ERAS

select * from Era

INSERT INTO Era (nome) VALUES ('Sacro Império (962 - 1806)')
INSERT INTO Era (nome) VALUES ('Confederação do Reno (1806 - 1815)')
INSERT INTO Era (nome) VALUES ('Confederação Alemã (1815 - 1866)')

-- DIALOGOS, RESPOSTAS E CONSEQUENCIAS

select * from Dialogo
select * from RespostasTexto
select * from Consequencia

-- 1

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Os Normandos estão se expandindo demais e conquistando meus territórios.
Preciso de sua ajuda contra seu avanço no sul da Itália.', 3, 1) 

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('O desejo de vossa santidade é meu desejo também.', 1, 1)
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Sinto muito, porém não posso te ajudar.', 0, 1)

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(1, 2, 1, 50) -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(1, 5, 1, 25) -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(1, 2, 0, -50) -- igreja

-- 2

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('A influência do movimento protestante está aumentando. Precisamos de sua
garantia de submissão à Igreja Católica e que você suprima esses rebeldes.', 4, 1)

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Esses hereges não sairão impunes!', 1, 2)
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Não posso te garantir nada por agora.', 0, 2)

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(2, 2, 1, 50) -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(2, 5, 1, 25) -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(2, 2, 0, -50) -- igreja

-- 3

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Senhor, os húngaros estão mais fortes do que nunca. Precisamos de mais
recursos para defender nossas fronteiras e garantir a segurança do império', 7, 1)

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Segurança acima de tudo.', 1, 3)
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Nossos recursos serão bem gastos em outros locais', 0, 3)

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(3, 5, 1, 50) -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(3, 4, 1, -75) -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(3, 5, 0, -25) -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(3, 4, 0, 20) -- economia

-- 4

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Os príncipes protestantes estão se rebelando contra vossa alteza. Queremos
autorização para enfrentar os rebeldes e garantir a estabilidade do império.', 8, 1)

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Ataque-os imediatamente!', 1, 4)
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Deixe a situação se resolver por conta própria.', 0, 4)

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(4, 2, 1, 25) -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(4, 5, 1, 30) -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(4, 2, 0, -25) -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(4, 5, 0, -30) -- exército

-- 5

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Senhor, os impostos imperiais são sufocantes e estão
causando fome e miséria nas vilas. Precisamos de uma redução nos impostos.', 5, 1)

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('O bem-estar do povo é o que mais importa.', 1, 5)
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Você tem sorte de eu não os aumentar mais ainda depois de um pedido absurdo
como esse!', 0, 5)

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(5, 1, 1, 75) -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(5, 4, 1, -75) -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(5, 1, 0, -50) -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(5, 4, 0, 55) -- economia

-- 6 

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Os senhores feudais praticam todo tipo de abuso contra os
camponeses e nada acontece! Precisamos de justiça nos campos e uma reforma no
sistema feudal.', 6, 1)

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('O sistema feudal ja está ultrapassado. Vamos fazer algo sobre isso.', 1, 6)
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Os senhores feudais garantem a estabilidade do império. Nada mudará.', 0, 6)

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(6, 1, 1, 50) -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(6, 1, 0, -30) -- povo

-- 7

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('O Reino da França propõe uma aliança contra os reinos anglo-
saxões.', 1, 1)

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Uma aliança seria benéfica para ambos os lados.', 1, 7)
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Não vou envolver meu império em uma rivalidade francesa.', 0, 7)

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(7, 3, 1, 75) -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(7, 5, 1, 75) -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(7, 3, 0, -50) -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(7, 5, 0, -70) -- exército

-- 8

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Como representante dos nobres do norte da Itália, gostaria de pedir
garantia de nossa autonomia e defesa por parte do Sacro Império em troca de nossa
vassalagem.', 2, 1)

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Já estava na hora de expandir nossas posses para a península itálica.', 1, 8)
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Não precisamos de suas terras e nem de sua lealdade.', 0, 8)

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(8, 3, 1, 50) -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(8, 4, 1, 120) -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(8, 3, 0, -50) -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(8, 4, 0, -70) -- economia

SELECT * FROM Personagem 

DBCC CHECKIDENT ('Conquistas', RESEED, 0); -- isso reseta o identity (autoincremento do id)
DBCC CHECKIDENT ('ConquistasUsuario', RESEED, 1)
DBCC CHECKIDENT ('Consequencia', RESEED, 1)
DBCC CHECKIDENT ('Dialogo', RESEED, 1)
DBCC CHECKIDENT ('Era', RESEED, 1)
DBCC CHECKIDENT ('Personagem', RESEED, 1)
DBCC CHECKIDENT ('RespostasTexto', RESEED, 1)
DBCC CHECKIDENT ('Usuario', RESEED, 1)

select * from Consequencia where dialogo_id = 1 and resposta = 1
