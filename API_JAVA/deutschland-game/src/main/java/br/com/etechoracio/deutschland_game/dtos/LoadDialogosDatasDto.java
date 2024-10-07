package br.com.etechoracio.deutschland_game.dtos;

public record LoadDialogosDatasDto(Long id_dialogo, String mensagem, LoadPersonagemDto personagem, LoadRespostasDialogosDto respostas, LoadConsequenciasDto loadConsequenciasDto) {
}
