package br.com.etechoracio.deutschland_game.dtos;

import br.com.etechoracio.deutschland_game.entities.Era;
import br.com.etechoracio.deutschland_game.entities.EraSprites;

public record LoadEraDataDto(Long id, String nome_era, String periodo, String sprite) {
}
