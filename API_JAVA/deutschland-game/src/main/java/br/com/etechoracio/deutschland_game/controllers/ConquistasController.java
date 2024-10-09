package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.dtos.ConquistasUsuarioDto;
import br.com.etechoracio.deutschland_game.entities.Conquistas;
import br.com.etechoracio.deutschland_game.exceptions.ConquistaIdNotFoundException;
import br.com.etechoracio.deutschland_game.services.ConquistasService;
import br.com.etechoracio.deutschland_game.services.ConquistasUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/conquistas")
public class ConquistasController {
    @Autowired
    private ConquistasService conquistasService;

    @Autowired
    private ConquistasUsuarioService conquistasUsuarioService;

    @GetMapping(path = "/id/{id}")
    public ResponseEntity<Conquistas> getConquistaById(@PathVariable Long id) throws ConquistaIdNotFoundException {
        return ResponseEntity.status(HttpStatus.OK).body(conquistasService.getConquistaById(id));
    }
    @PutMapping("/update")
    public ResponseEntity<Void> updateConquistas(@RequestBody ConquistasUsuarioDto model){
        conquistasUsuarioService.updateConquistas(model);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}
