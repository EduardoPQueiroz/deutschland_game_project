package br.com.etechoracio.deutschland_game.dtos;

public record LoadDialogosDatasDto(Long id_dialogo, String mensagem, LoadRespostasDialogosDto respostas, LoadConsequenciasDto consequencias, LoadPersonagemDto personagem) {
}
