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

delete from Era

INSERT INTO Era (nome, periodo) VALUES ('Sacro Império', '(962 - 1806)')
INSERT INTO Era (nome, periodo) VALUES ('Confederação do Reno', '(1806 - 1815)')
INSERT INTO Era (nome, periodo) VALUES ('Confederação Alemã', '(1815 - 1866)')
INSERT INTO Era (nome, periodo) VALUES ('Unificação Alemã', '(1860 - 1871)')
INSERT INTO Era (nome, periodo) VALUES ('Primeira Guerra Mundial', '(1914 - 1918)')
INSERT INTO Era (nome, periodo) VALUES ('Segunda Guerra Mundial', '(1939 - 1945)')


-- update Era set nome = 'Sacro Império', periodo = '(962 - 1806)'
-- where nome = 'Sacro Império (962 - 1806)'

-- update Era set nome = 'Confederação do Reno', periodo = '(1806 - 1815)'
-- where nome = 'Confederação do Reno (1806 - 1815)'

-- update Era set nome = 'Confederação Alemã', periodo = '(1815 - 1866)'
-- where nome = 'Confederação Alemã (1815 - 1866)'

-- DIALOGOS, RESPOSTAS E CONSEQUENCIAS

delete from Dialogo

select * from Dialogo
select * from RespostasTexto
select * from Consequencia

-- 1

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Os Normandos estão se expandindo demais e conquistando meus territórios.
Preciso de sua ajuda contra seu avanço no sul da Itália.', 3, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('O desejo de vossa santidade é meu desejo também.', 1, 1);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Sinto muito, porém não posso te ajudar.', 0, 1);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(1, 2, 1, 50); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(1, 5, 1, 25); -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(1, 2, 0, -50); -- igreja

-- 2
BEGIN
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('A influência do movimento protestante está aumentando. Precisamos de sua
garantia de submissão à Igreja Católica e que você suprima esses rebeldes.', 4, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Esses hereges não sairão impunes!', 1, 2);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Não posso te garantir nada por agora.', 0, 2);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(2, 2, 1, 50); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(2, 5, 1, 25); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(2, 2, 0, -50); -- igreja
end;
-- 3

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Senhor, os húngaros estão mais fortes do que nunca. Precisamos de mais
recursos para defender nossas fronteiras e garantir a segurança do império', 7, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Segurança acima de tudo.', 1, 3);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Nossos recursos serão bem gastos em outros locais', 0, 3);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(3, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(3, 4, 1, -75); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(3, 5, 0, -25); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(3, 4, 0, 20); -- economia

-- 4

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Os príncipes protestantes estão se rebelando contra vossa alteza. Queremos
autorização para enfrentar os rebeldes e garantir a estabilidade do império.', 8, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Ataque-os imediatamente!', 1, 4);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Deixe a situação se resolver por conta própria.', 0, 4);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(4, 2, 1, 25); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(4, 5, 1, 30); -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(4, 2, 0, -25); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(4, 5, 0, -30); -- exército

-- 5

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Senhor, os impostos imperiais são sufocantes e estão
causando fome e miséria nas vilas. Precisamos de uma redução nos impostos.', 5, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('O bem-estar do povo é o que mais importa.', 1, 5);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Você tem sorte de eu não os aumentar mais ainda depois de um pedido absurdo
como esse!', 0, 5);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(5, 1, 1, 75); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(5, 4, 1, -75); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(5, 1, 0, -50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(5, 4, 0, 55); -- economia

-- 6 

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Os senhores feudais praticam todo tipo de abuso contra os
camponeses e nada acontece! Precisamos de justiça nos campos e uma reforma no
sistema feudal.', 6, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('O sistema feudal ja está ultrapassado. Vamos fazer algo sobre isso.', 1, 6);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Os senhores feudais garantem a estabilidade do império. Nada mudará.', 0, 6);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(6, 1, 1, 50); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(6, 1, 0, -30); -- povo

-- 7

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('O Reino da França propõe uma aliança contra os reinos anglo-
saxões.', 1, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Uma aliança seria benéfica para ambos os lados.', 1, 7);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Não vou envolver meu império em uma rivalidade francesa.', 0, 7);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(7, 3, 1, 75); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(7, 5, 1, 75); -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(7, 3, 0, -50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(7, 5, 0, -70); -- exército

-- 8

INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Como representante dos nobres do norte da Itália, gostaria de pedir
garantia de nossa autonomia e defesa por parte do Sacro Império em troca de nossa
vassalagem.', 2, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Já estava na hora de expandir nossas posses para a península itálica.', 1, 8);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES('Não precisamos de suas terras e nem de sua lealdade.', 0, 8);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(8, 3, 1, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(8, 4, 1, 120); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(8, 3, 0, -50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(8, 4, 0, -70); -- economia

-- 9

insert into Dialogo (mensagem, id_personagem, id_era) values ('Senhor, as tarifas das rotas comerciais do Mar Báltico impostas pelos suecos são muito pesadas. 
Precisamos que nos ajude com a redução delas.', 9, 1);

insert into RespostasTexto (conteudo, escolha, id_dialogo) values('Nossos comerciantes, nossas tarifas', 1, 9);
insert into RespostasTexto (conteudo, escolha, id_dialogo) values('Os suecos têm direito de tarifar barcos no Mar Báltico', 0, 9);

insert into Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) values(9, 3, 1, -60); -- diplomacia
insert into Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) values(9, 4, 1, 40); -- economia
insert into Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) values(9, 1, 1, 30); -- povo

insert into Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) values(9, 3, 0, 30); -- diplomacia
insert into Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) values(9, 4, 0, -40); -- economia
insert into Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) values(9, 1, 0, -40); -- povo

-- 10
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Grande parte dos impostos são direcionados para obras religiosas. Precisamos de menos igrejas e mais infraestrutura. 
A igreja já é poderosa o bastante.', 10, 1);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Você está certo. Mais para o povo, menos para Deus', 1, 10);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('A igreja possui um papel fundamental em nosso Império. Esse pedido é absurdo!', 0, 10);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(10, 4, 1, 50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(10, 1, 1, 20); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(10, 2, 1, -25); -- igreja

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(10, 4, 0, -50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(10, 1, 0, -20); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES(10, 2, 0, 25); -- igreja

-- 11
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Os valores liberais franceses estão se espalhando rapidamente entre o povo, ameaçando a ordem e estabilidade do império. 
Precisamos que faça alguma coisa!', 4, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Essas ideias revolucionárias devem ser suprimidas à todo custo!', 1, 11);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Tempos como esse exigem adaptação, não repressão.', 0, 11);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (11, 2, 1, 40); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (11, 5, 1, 30); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (11, 1, 1, -50); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (11, 2, 0, -40); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (11, 1, 0, 50); -- povo

-- 12
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('As reformas impostas por Napoleão têm reduzido nossa influência e agora também estão tomando nossas posses! 
Precisamos que algo seja feito imediatamente.', 3, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Vamos devolver à igreja o que é seu por direito', 1, 12);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Essas terras serão mais proveitosas nas mãos do rei.', 0, 12);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (12, 2, 1, 35); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (12, 4, 1, -50); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (12, 2, 0, -35); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (12, 4, 0, 50); -- economia

-- 13
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('O imperador Napoleão exige que mande tropas para suas batalhas contra a Rússia 
como forma de demonstrar sua lealdade ao império.', 7, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Que nossos homens provem sua lealdade no campo de batalha!', 1, 13);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Nossas tropas não morrerão por suas batalhas.', 0, 13);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (13, 5, 1, 40); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (13, 1, 1, -40); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (13, 3, 1, 30); -- diplomacia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (13, 5, 0, -40); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (13, 1, 0, 40); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (13, 3, 0, -30); -- diplomacia

-- 14
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('A ocupação francesa está acabando com a moral de nossos homens. 
Precisamos de mais fundos para manter a moral e evitar rebeliões.', 8, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Faça o que for necessário para manter o controle.', 1, 14);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Eles precisam se virar com o que têm.', 0, 14);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (14, 5, 1, 30); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (14, 4, 1, -40); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (14, 5, 0, -30); -- exército

-- 15
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('O custo das guerras napoleônicas está esmagando as finanças dos camponeses. 
Precisamos de um alívio nos impostos.', 5, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Se a população precisa, o rei proverá.', 1, 15);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Não posso comprometer nossas finanças dessa forma.', 0, 15);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (15, 1, 1, 50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (15, 4, 1, -60); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (15, 1, 0, -30); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (15, 4, 0, 40); -- economia

-- 16
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('As ideias liberais vindas da França estão motivando o povo. 
Eles pedem por mais participação na política.', 6, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('O povo merece ter voz!', 1, 16);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Essas ideias são perigosas. A ordem será mantida.', 0, 16);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (16, 1, 1, 40); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (16, 1, 0, -50); -- povo

-- 17
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('A Áustria está em busca de aliados alemães para combater os avanços de Napoleão e reestabelecer a ordem no continente. 
Você aceita se juntar à nossa causa?', 1, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('A aliança com a Áustria trará liberdade para a Europa!', 1, 17);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Nosso futuro está nas mãos de Napoleão, não de Francisco I.', 0, 17);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (17, 3, 1, 40); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (17, 5, 1, -30); -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (17, 3, 0, -40); -- diplomacia

-- 18
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('Napoleão propõe maior integração econômica entre a França e
a Confederação do Reno. Isso pode trazer grandes benefícios para ambos os lados.', 2, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Tal oportunidade não será desperdiçada!', 1, 18);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Nossa independência vale mais do que qualquer ganho financeiro.', 0, 18);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (18, 3, 1, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (18, 4, 1, 40); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (18, 3, 0, -40); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (18, 4, 0, -20); -- economia

-- 19
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('As tarifas impostas pelas potências estrangeiras estão prejudicando nosso comércio. 
Precisamos negociar a sua redução.', 9, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Vamos pressioná-los por tarifas melhores.', 1, 19);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Não podemos arriscar nossas parcerias atuais.', 0, 19);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (19, 3, 1, -30); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (19, 4, 1, 40); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (19, 1, 1, 50); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (19, 4, 0, -20); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (19, 1, 0, -30); -- povo

-- 20
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES ('A revolução industrial chegou.
Precisamos de mais investimentos em fábricas e infraestrutura como ferrovias, se não ficaremos para trás.', 10, 2);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Vamos modernizar a indústria e fortalecer a economia.', 1, 20);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES ('Nossos recursos são limitados. Devemos nos concentrar em outras áreas.', 0, 20);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (20, 4, 1, 70); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (20, 1, 1, 40); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (20, 4, 0, -60); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (20, 1, 0, -50); -- povo

-- 21
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'O avanço do movimento liberal ameaça os valores tradicionais e a autoridade da Igreja. 
Precisamos combater essas ideias subversivas antes que destruam o tecido social.', 3, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Devemos proteger a fé e a ordem a qualquer custo!', 1, 21);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Precisamos adaptar-nos aos novos tempos, não combatê-los.', 0, 21);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (21, 2, 1, 50); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (21, 1, 1, -25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (21, 2, 0, -30); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (21, 1, 0, 20); -- povo

-- 22
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'As secularizações forçadas pelos governos estão confiscando propriedades da Igreja, enfraquecendo nossa influência e segurança financeira.', 4, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Devolveremos as propriedades confiscadas à Igreja.', 1, 22);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Essas terras serão mais úteis nas mãos do Estado.', 0, 22);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (22, 2, 1, 45); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (22, 4, 1, -30); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (22, 2, 0, -40); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (22, 4, 0, 25); -- economia

-- 23
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'Para garantir a hegemonia da Prússia na Europa central, precisamos aumentar o contingente militar e preparar nossas tropas para enfrentar a Áustria.', 7, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Vamos mobilizar e preparar o exército para a batalha!', 1, 23);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Manteremos a paz enquanto for possível, sem grandes gastos.', 0, 23);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (23, 5, 1, 40); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (23, 4, 1, -35); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (23, 5, 0, -20); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (23, 4, 0, 30); -- economia

-- 24
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'As revoluções liberais de 1848 estão varrendo a Europa. Precisamos de mais tropas para manter a ordem e reprimir as revoltas internas.', 8, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Fortaleçam as guarnições para garantir a estabilidade!', 1, 24);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'A repressão só alimentará mais revoltas. Devemos ouvir o povo.', 0, 24);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (24, 5, 1, 30); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (24, 1, 1, -20); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (24, 5, 0, -25); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (24, 1, 0, 35); -- povo

-- 25
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'Com o crescimento das fábricas, as condições de trabalho dos operários estão se deteriorando. Eles exigem regulamentações trabalhistas e a redução das jornadas de trabalho.', 5, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Vamos implementar leis para proteger os trabalhadores e melhorar suas condições.', 1, 25);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'As regulamentações atrapalharão a produtividade. Não podemos nos dar ao luxo de ceder a essas demandas.', 0, 25);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (25, 1, 1, 40); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (25, 4, 1, -30); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (25, 1, 0, -25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (25, 4, 0, 35); -- economia

-- 26
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'As ideias de liberdade e democracia estão se espalhando. O povo pede por uma constituição e maior participação política.', 6, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Vamos permitir maior representação do povo no governo.', 1, 26);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Essas ideias são perigosas para a ordem. Rejeitaremos qualquer mudança.', 0, 26);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (26, 1, 1, 30); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (26, 1, 0, -35); -- povo

-- 27
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'A Áustria está em busca de aliados alemães para combater os avanços de Napoleão e reestabelecer a ordem no continente. Você aceita se juntar à nossa causa?', 1, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'A aliança com a Áustria trará liberdade para a Europa!', 1, 27);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Nosso futuro está nas mãos de Napoleão, não de Francisco I.', 0, 27);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (27, 3, 1, 45); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (27, 5, 1, -30); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (27, 3, 0, -35); -- diplomacia

-- 28
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'Napoleão propõe maior integração econômica entre a França e a Confederação do Reno. Isso pode trazer grandes benefícios para ambos os lados.', 2, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Tal oportunidade não será desperdiçada!', 1, 28);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Nossa independência vale mais do que qualquer ganho financeiro.', 0, 28);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (28, 3, 1, 30); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (28, 4, 1, 25); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (28, 3, 0, -20); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (28, 4, 0, -25); -- economia

-- 29
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'Os altos impostos sobre os produtos estão dificultando o comércio entre os estados alemães. Precisamos reduzir as tarifas para incentivar o crescimento', 9, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Vamos reduzir as tarifas e fortalecer o comércio interno.', 1, 29);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Manteremos as tarifas para proteger nossa economia local.', 0, 29);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (29, 4, 1, 40); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (29, 1, 1, 30); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (29, 4, 0, -25); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (29, 1, 0, -20); -- povo

-- 30
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'Os produtos industrializados ingleses estão inundando nosso mercado! Precisamos de restrições de importação para estimular a indústria local!', 10, 3);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Os ingleses podem exportar para outras nações. Nossas indústrias serão as melhores da Europa!', 1, 30);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Não podemos interferir na economia de forma tão impactante', 0, 30);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (30, 4, 1, 50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (30, 1, 1, 30); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (30, 3, 1, -20); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (30, 4, 0, -30); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (30, 1, 0, -25); -- povo

-- 31
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'Com a crescente tensão entre os estados alemães, devemos preparar nosso exército para um possível conflito. 
	A mobilização custará, mas pode ser necessária para garantir a unificação.', 7, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Mobilizem as tropas! A unificação justifica o custo!', 1, 31);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Devemos tentar a diplomacia antes de qualquer ação.', 0, 31);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (31, 5, 1, 30); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (31, 4, 1, -20); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (31, 1, 1, -15); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (31, 3, 0, 20); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (31, 5, 0, -15); -- exército

-- 32
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'As vitórias recentes aumentaram o moral, mas temos inimigos em potencial ao nosso redor. 
	Um ataque preventivo pode ser arriscado, mas pode assegurar a unificação.', 7, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Vamos avançar! A vitória é nossa!', 1, 32);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Mantenha-se em posição defensiva e fortaleça nossas linhas.', 0, 32);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (32, 5, 1, 35); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (32, 3, 1, -20); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (32, 1, 1, -20); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (32, 1, 0, 25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (32, 5, 0, -15); -- exército

-- 33
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'A França está preocupada com a unificação da Alemanha. Se não houver garantias de paz, poderemos reconsiderar nossas alianças.', 2, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Prometemos respeitar a soberania dos países vizinhos.', 1, 33);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'A Alemanha deve se unir a qualquer custo!', 0, 33);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (33, 3, 1, 25); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (33, 5, 1, -20); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (33, 3, 0, -20); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (33, 5, 0, 30); -- exército

-- 34
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'A Grã-Bretanha está observando de perto. Um aumento no poder alemão pode desestabilizar a Europa. Está disposto a dialogar?', 2, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Sim, precisamos da sua ajuda para garantir uma transição pacífica.', 1, 34);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'A Alemanha não deve ser impedida de se unir!', 0, 34);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (34, 3, 1, 30); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (34, 4, 1, -25); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (34, 3, 0, -30); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (34, 5, 0, 25); -- exército

-- 35
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'A Igreja pode ajudar a unir o povo sob uma causa comum, mas precisamos de garantias de que a guerra não será em vão. O que decide?', 4, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'A unificação é a nossa única esperança!', 1, 35);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'A guerra é inevitável. Preparem-se!', 0, 35);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (35, 2, 1, 30); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (35, 1, 1, 20); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (35, 4, 1, -20); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (35, 2, 0, -25); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (35, 5, 0, 20); -- exército

-- 36
INSERT INTO Dialogo (mensagem, id_personagem, id_era) VALUES (
    'A Igreja pode oferecer apoio espiritual, mas a divisão entre os estados ainda é forte. Precisamos de um apelo à paz.', 4, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'Promovamos um apelo pela unificação pacífica!', 1, 36);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) VALUES (
    'A guerra é o único caminho!', 0, 36);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (36, 2, 1, 25); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (36, 3, 1, 30); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (36, 5, 1, -15); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (36, 2, 0, -30); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) VALUES (36, 5, 0, 30); -- exército

-- 37 -- PAROU AQUI 

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Estamos dispostos a financiar a mobilização das tropas, mas a unificação trará instabilidade econômica. Você está disposto a correr esse risco?', 10, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Sim, precisamos de seu apoio!', 1, 37);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('A economia deve ser nossa prioridade.', 0, 37);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (37, 4, 1, 50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (37, 1, 1, -25); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (37, 4, 0, -50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (37, 1, 0, 25); -- povo

-- 38

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('A instabilidade política está afetando meus negócios. Precisamos garantir que a unificação não traga mais conflitos.', 9, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Priorize a unificação!', 1, 38);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Vamos buscar acordos comerciais em vez de guerra.', 0, 38);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (38, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (38, 4, 1, -25); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (38, 1, 1, -25); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (38, 3, 0, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (38, 5, 0, -25); -- exército

-- 39

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Os trabalhadores estão preocupados com as promessas de unificação. Se não houver melhorias em nossas condições, a revolta pode ser iminente.', 6, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Melhoremos as condições dos trabalhadores para garantir apoio!', 1, 39);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('A unificação é mais importante agora!', 0, 39);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (39, 1, 1, 50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (39, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (39, 1, 0, -50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (39, 5, 0, 25); -- exército

-- 40

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('O povo quer um futuro melhor, mas a guerra não é a solução. Se não cuidarmos das necessidades básicas, a insatisfação crescerá.', 5, 4);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Vamos focar em necessidades civis!', 1, 40);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('A guerra é a única maneira de garantir a unificação!', 0, 40);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (40, 1, 1, 50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (40, 5, 1, -25); -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (40, 5, 0, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (40, 1, 0, -25); -- povo

-- 41

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('As tropas estão prontas para uma nova ofensiva. Devemos atacar agora, mas perderemos muitos homens e recursos. O que decide?', 8, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Atacar agora! A vitória é nosso único caminho!', 1, 41);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Mantenha as tropas em posição defensiva.', 0, 41);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (41, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (41, 1, 1, -25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (41, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (41, 1, 0, 25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (41, 5, 0, -50); -- exército

-- 42

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Os soldados estão desmotivados e o moral é baixo. Um ataque audacioso pode restaurar a confiança, mas a perda será grande.', 7, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Lidere a ofensiva! O sacrifício é necessário!', 1, 42);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Vamos dar um tempo e permitir que se recuperem.', 0, 42);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (42, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (42, 1, 1, 25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (42, 4, 1, -25); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (42, 3, 1, -25); -- diplomacia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (42, 1, 0, 25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (42, 5, 0, -25); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (42, 3, 0, 25); -- diplomacia

-- 43

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Seus avanços nos preocupam. A França não ficará parada enquanto vocês expandem seu império. Está disposto a negociar um acordo?', 2, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Não temos tempo para negociações!', 1, 43);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Sim, vamos discutir um tratado.', 0, 43);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (43, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (43, 3, 1, -25); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (43, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (43, 3, 0, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (43, 5, 0, -25); -- exército

-- 44

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('A Grã-Bretanha está preocupada com a sua situação. Se não tomarem medidas, podemos considerar o apoio a seus inimigos.', 1, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Não precisamos da Grã-Bretanha!', 1, 44);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Vamos trabalhar juntos para evitar um conflito maior.', 0, 44);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (44, 3, 1, -50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (44, 5, 1, 25); -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (44, 3, 0, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (44, 5, 0, -25); -- exército

-- 45

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('A guerra está afetando a moral do povo. A Igreja pode oferecer apoio, mas precisamos de garantias de que a violência não será em vão.', 3, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('A vitória trará redenção, padre. Apoie-nos!', 1, 45);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Desculpe, mas a guerra é inevitável.', 0, 45);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (45, 2, 1, 50); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (45, 3, 1, -25); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (45, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (45, 2, 0, -50); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (45, 5, 0, 25); -- exército

-- 46

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('A Igreja está preocupada com o sofrimento das almas. Podemos ajudar a restaurar a esperança, mas será necessário abordar o povo sobre o impacto da guerra.', 4, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Façam um apelo ao povo em apoio à guerra!', 1, 46);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('A Igreja deve ficar neutra.', 0, 46);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (46, 2, 1, 50); -- igreja
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (46, 1, 1, 25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (46, 3, 1, -25); -- diplomacia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (46, 3, 0, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (46, 2, 0, -50); -- igreja

-- 47

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('A guerra está custando uma fortuna, e precisamos garantir que os empréstimos sejam pagos. Podemos aumentar os impostos para financiar o esforço de guerra?', 9, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Sim, aumente os impostos! Precisamos dos recursos!', 1, 47);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Não, não podemos sobrecarregar a população.', 0, 47);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (47, 4, 1, 50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (47, 1, 1, -25); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (47, 1, 0, 50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (47, 4, 0, -50); -- economia

-- 48

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('As interrupções nas rotas comerciais estão afetando meus negócios. A guerra precisa acabar, ou todos sofreremos economicamente.', 10, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('O sacrifício é necessário para a unificação!', 1, 48);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Vamos negociar uma trégua!', 0, 48);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (48, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (48, 1, 1, -25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (48, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (48, 3, 0, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (48, 5, 0, -25); -- exército

-- 49

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Os trabalhadores estão enfrentando dificuldades devido à guerra. Precisamos de melhores condições ou haverá revoltas.', 5, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Conceder melhorias, mas precisamos aumentar os impostos.', 1, 49);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('A guerra é mais importante. Sejam pacientes!', 0, 49);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (49, 1, 1, 50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (49, 4, 1, -50); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (49, 1, 0, -50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (49, 5, 0, 25); -- exército

-- 50

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('O povo está cansado de ouvir sobre vitórias enquanto passamos fome. Se a situação não mudar, haverá consequências.', 6, 5);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Envie mais suprimentos para o exército!', 1, 50);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Prometemos mais assistência para os civis.', 0, 50);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (50, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (50, 1, 1, -25); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (50, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (50, 1, 0, 50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (50, 5, 0, -50); -- exército

-- 51

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('As forças inimigas estão em avanço, e precisamos de mais tropas imediatamente. Isso custará caro, mas se não agirmos, perderemos tudo.', 7, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Recrutem mais soldados! A vitória justifica o custo!', 1, 51);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Vamos nos concentrar na defesa e economizar recursos.', 0, 51);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (51, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (51, 4, 1, -50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (51, 1, 1, -25); -- povo

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (51, 4, 0, 50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (51, 5, 0, -50); -- exército

-- 52

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('A resistência está se tornando mais feroz. Uma nova estratégia de ataque pode ser arriscada, mas pode ser o que precisamos para mudar o curso da guerra.', 8, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Lidere o ataque com todas as forças disponíveis!', 1, 52);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Vamos esperar e fortalecer nossas defesas.', 0, 52);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (52, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (52, 3, 1, -50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (52, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (52, 3, 0, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (52, 5, 0, -50); -- exército


-- 53

-- 53

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Os oficiais superiores estão sugerindo uma mudança na liderança das tropas para melhorar a moral. Isso poderia aumentar a confiança dos soldados, mas também pode causar instabilidade.', 7, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Apoie a mudança de liderança!', 1, 53);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Mantenha a liderança atual para evitar riscos.', 0, 53);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (53, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (53, 3, 1, -25); -- diplomacia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (53, 3, 0, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (53, 5, 0, -25); -- exército

-- 54

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('A artilharia inimiga está causando sérios danos. Devemos redirecionar nossos recursos para aumentar nossa capacidade defensiva?', 8, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Sim, priorizem a defesa!', 1, 54);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Não, mantenham o foco no ataque!', 0, 54);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (54, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (54, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (54, 4, 0, 50); -- economia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (54, 5, 0, -50); -- exército

-- 55

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('A guerra está se prolongando e as condições nas frentes de batalha estão se deteriorando. Devemos enviar reforços?', 9, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Envie mais reforços imediatamente!', 1, 55);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Não, vamos aguardar uma oportunidade melhor.', 0, 55);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (55, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (55, 4, 1, -50); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (55, 5, 0, -25); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (55, 4, 0, 50); -- economia

-- 56

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('As tropas estão cansadas e os recursos são limitados. Devemos recuar para preservar nossas forças?', 8, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Sim, recuem e reagrupem.', 1, 56);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Não, continuem avançando!', 0, 56);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (56, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (56, 4, 1, -25); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (56, 5, 0, -50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (56, 4, 0, 50); -- economia

-- 57

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Há relatos de motins entre as tropas devido à falta de comida e suprimentos. Como devemos lidar com isso?', 9, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Reprimam os motins com força.', 1, 57);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Negociem com as tropas e ofereçam suprimentos.', 0, 57);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (57, 5, 1, -50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (57, 4, 1, 50); -- economia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (57, 5, 0, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (57, 4, 0, -50); -- economia

-- 58

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Estamos perdendo apoio internacional. Deveríamos focar em restaurar nossas relações diplomáticas?', 10, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Sim, precisamos de aliados.', 1, 58);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Não, a vitória militar é o mais importante.', 0, 58);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (58, 3, 1, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (58, 5, 1, -25); -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (58, 5, 0, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (58, 3, 0, -50); -- diplomacia

-- 59

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('O povo está exigindo um fim imediato à guerra. Como devemos proceder?', 6, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Ignorem as demandas e continuem a lutar.', 1, 59);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Comecem negociações de paz.', 0, 59);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (59, 1, 1, -50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (59, 5, 1, 50); -- exército

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (59, 1, 0, 50); -- povo
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (59, 5, 0, -50); -- exército

-- 60

INSERT INTO Dialogo (mensagem, id_personagem, id_era) 
VALUES ('Os líderes militares estão divididos sobre a estratégia final. Devemos continuar a guerra ou buscar um tratado de paz?', 7, 6);

INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Continuem a guerra até a vitória!', 1, 60);
INSERT INTO RespostasTexto (conteudo, escolha, id_dialogo) 
VALUES ('Busquem um tratado de paz para acabar com a guerra.', 0, 60);

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (60, 5, 1, 50); -- exército
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (60, 3, 1, -25); -- diplomacia

INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (60, 3, 0, 50); -- diplomacia
INSERT INTO Consequencia (dialogo_id, conquista_id, resposta, valor_mudanca) 
VALUES (60, 5, 0, -50); -- exército


SELECT * FROM Dialogo where id_era = 4

DBCC CHECKIDENT ('Conquistas', RESEED, 0); -- isso reseta o identity (autoincremento do id)
DBCC CHECKIDENT ('ConquistasUsuario', RESEED, 1)
DBCC CHECKIDENT ('Consequencia', RESEED, 0)
DBCC CHECKIDENT ('Dialogo', RESEED, 0)
DBCC CHECKIDENT ('Era', RESEED, 0)
DBCC CHECKIDENT ('Personagem', RESEED, 1)
DBCC CHECKIDENT ('RespostasTexto', RESEED, 0)
DBCC CHECKIDENT ('Usuario', RESEED, 1)

select * from Consequencia where dialogo_id = 1 and resposta = 1
