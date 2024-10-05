package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.EraSprites;
import br.com.etechoracio.deutschland_game.entities.PersonagensSprite;
import br.com.etechoracio.deutschland_game.services.EraSpritesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping("/erasMongo")
public class EraSpritesController {
    @Autowired
    private EraSpritesService spritesService;

    @GetMapping(path = "/id/{id}")
    public EraSprites getEraById(@PathVariable("id") long id){
        return spritesService.getEraById(id);
    }

    @PostMapping(consumes = "multipart/form-data")
    public EraSprites uploadEras(@RequestPart("spriteEra")MultipartFile spriteEra) throws IOException{
        return spritesService.saveSpriteEra(spriteEra);
    }
}
