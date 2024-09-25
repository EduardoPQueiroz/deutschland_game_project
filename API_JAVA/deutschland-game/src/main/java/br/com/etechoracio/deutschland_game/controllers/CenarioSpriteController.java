package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.CenarioSprite;
import br.com.etechoracio.deutschland_game.services.CenarioSpriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/cenarios")
public class CenarioSpriteController {
    @Autowired
    private CenarioSpriteService cenarioSpriteService;

    @GetMapping(path = "/id/{id}")
    public CenarioSprite getCenarioById(@PathVariable("id") long id){
        return cenarioSpriteService.getCenarioById(id);
    }

    @PostMapping(consumes = "multipart/form-data")
    public CenarioSprite saveSpriteCenario(@RequestPart("spriteCenario")MultipartFile spriteCenario) throws IOException{
        return cenarioSpriteService.saveSpriteCenario(spriteCenario);
    }


}
