package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.PersonagensSprite;
import br.com.etechoracio.deutschland_game.services.PersonagemSpriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/personagens")
public class PersonagemSpriteController {
    @Autowired
    private PersonagemSpriteService personagemSpriteService;

    @GetMapping
    public List<PersonagensSprite> getPersonagens(){
        return personagemSpriteService.getAllPersonagens();
    }

    @GetMapping("/{id}")
    public PersonagensSprite getPersonagemById(@PathVariable("id") long id) {
        return personagemSpriteService.getPersonagemById(id);
    }

    @PostMapping(consumes = "multipart/form-data")
    public PersonagensSprite uploadPersonagens(@RequestPart("spritePersonagem") MultipartFile spritePersonagem) throws IOException {
        return personagemSpriteService.saveSpritePersonagem(spritePersonagem);
    }
}