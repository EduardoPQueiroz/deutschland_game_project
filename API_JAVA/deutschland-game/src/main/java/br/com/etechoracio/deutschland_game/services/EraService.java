package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.LoadEraDataDto;
import br.com.etechoracio.deutschland_game.entities.EraSprites;
import br.com.etechoracio.deutschland_game.exceptions.EraIdNotFoundException;
import br.com.etechoracio.deutschland_game.repositories.EraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EraService {

    private final EraRepository eraRepository;
    private final EraSpritesService eraSpritesService;

    @Autowired
    public EraService(EraRepository eraRepository, EraSpritesService eraSpritesService) {
        this.eraRepository = eraRepository;
        this.eraSpritesService = eraSpritesService;
    }

    public LoadEraDataDto getEra(Long id){

        var era = eraRepository.findById(id).orElseThrow(EraIdNotFoundException::new);
        var eraSprite = eraSpritesService.getEraById(id);

        return new LoadEraDataDto(era, eraSprite);

    }

}
