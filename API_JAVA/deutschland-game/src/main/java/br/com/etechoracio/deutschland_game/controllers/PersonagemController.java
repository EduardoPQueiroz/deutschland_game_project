package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.Personagens;
import br.com.etechoracio.deutschland_game.exceptions.PersonagemIdNotFoundException;
import br.com.etechoracio.deutschland_game.services.PersonagemSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/personagens")
public class PersonagemController {

    @Autowired
    private PersonagemSevice personagemService;

    @GetMapping("/{id}")
    public ResponseEntity<Personagens> getPersonagemById(@PathVariable("id") long id) throws PersonagemIdNotFoundException {
        return ResponseEntity.status(HttpStatus.OK).body(personagemService.getPersonagensById(id));
    }
}
