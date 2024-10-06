package br.com.etechoracio.deutschland_game.dtos;

import br.com.etechoracio.deutschland_game.entities.Era;
import br.com.etechoracio.deutschland_game.entities.EraSprites;

public record LoadEraDataDto(Era era, EraSprites sprite) {
}
