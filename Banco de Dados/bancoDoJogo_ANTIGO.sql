create database jogo;
use jogo;

create table Dialogos(
	id_dialogo int identity constraint Dialogos_id_dialogoPK primary key,
	tipo_dialogo varchar(30) constraint Dialogos_tipo_dialogoNN not null,
	texto_dialogo varchar(256) constraint Dialogos_texto_dialogoNN not null
);

create table Personagens(
	id_personagem int identity constraint Personagens_id_personagensPK primary key,
	tipo_personagem varchar(30) constraint Personagens_tipo_personagemNN not null,-- clero, nobre, banqueiro, cidadao, general,
	nome varchar(128) constraint Personagens_nomeNN not null 
);

create table Usuario(
	id_usuario int identity constraint Usuario_id_usuarioPK primary key,
	nome_usuario varchar(64) constraint Usuario_nome_usuarioNN not null,
	diplomacia numeric(3,1) constraint Usuario_diplomaciaNN not null,-- vai ser um status: 8.5
	rept_igreja numeric(3,1) constraint Usuario_rept_igrejaNN not null,-- vai ser um status: 8.5
	popularidade numeric(3,1) constraint Usuario_popularidadeNN not null, -- vai ser um status: 8.5
	dinheiro numeric(3,1) constraint Usuario_dinheiroNN not null,-- vai ser um status: 8.5
	exercito numeric(3,1) constraint Usuario_exercitoNN not null -- vai ser um status: 8.5
);

create table Dilemas(
	id_dilemas int identity constraint Dilemas_id_dilemasPK primary key,
	escolha numeric(1) constraint Dilemas_escolhaNN not null -- usuario vai poder escolher entre sim ou não: 0 ou 1
);

create table Opcao(
	id_opcao int identity constraint Opcao_id_opcaoPK primary key, 
	consequencia varchar(512) constraint Opcao_consequenciaNN not null, -- igreja: -3, diplomacia: + 4
);
