package br.com.etechoracio.deutschland_game.dtos;

import br.com.etechoracio.deutschland_game.entities.Conquistas;
import br.com.etechoracio.deutschland_game.entities.Usuario;

public record ConquistasUsuarioDto(Conquistas conquistas, int valor_acresc, Usuario usuario) {
}
