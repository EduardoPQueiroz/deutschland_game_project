package br.com.etechoracio.deutschland_game.dtos;

import java.util.List;

public record LoadConsequenciasDto(List<LoadConsequenciasConquistasDto> aceito, List<LoadConsequenciasConquistasDto> recusado) {
}
