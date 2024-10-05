package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.Consequencia;
import br.com.etechoracio.deutschland_game.services.ConsequenciasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/consequencias")
public class ConsequenciasController {
    @Autowired
    private ConsequenciasService consequenciasService;

    @GetMapping(path = "/listar")
    public ResponseEntity<List<Consequencia>> getAllConsequencias(){
        return ResponseEntity.status(HttpStatus.OK).body(consequenciasService.getAllConsequencias());
    }

    @GetMapping(path = "/dialogo/{id}")
    public ResponseEntity<List<Consequencia>> getAllConsequenciasByDialogo(@PathVariable("id") Long id){
        return ResponseEntity.status(HttpStatus.OK).body(consequenciasService.getAllConsequenciasByDialogo(id));
    }

}
