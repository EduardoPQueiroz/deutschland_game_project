package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.Conquistas;
import br.com.etechoracio.deutschland_game.exceptions.ConquistaIdNotFoundException;
import br.com.etechoracio.deutschland_game.services.ConquistasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/conquistas")
public class ConquistasController {
    @Autowired
    private ConquistasService conquistasService;

    @GetMapping(path = "/id/{id}")
    public ResponseEntity<Conquistas> getConquistaById(@PathVariable Long id) throws ConquistaIdNotFoundException {
        return ResponseEntity.status(HttpStatus.OK).body(conquistasService.getConquistaById(id));
    }

}
