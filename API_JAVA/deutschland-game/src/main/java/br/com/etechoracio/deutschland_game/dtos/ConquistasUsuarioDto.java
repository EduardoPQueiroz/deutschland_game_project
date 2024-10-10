package br.com.etechoracio.deutschland_game.dtos;

import br.com.etechoracio.deutschland_game.entities.Conquistas;
import br.com.etechoracio.deutschland_game.entities.Usuario;

public record ConquistasUsuarioDto(Long id_conquista, int valor_acresc, Long id_usuario) {
}
