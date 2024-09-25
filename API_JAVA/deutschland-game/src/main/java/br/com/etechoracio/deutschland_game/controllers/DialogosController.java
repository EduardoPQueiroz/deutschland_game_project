package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.services.DialogosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Random;

@RestController
@RequestMapping("/dialogos")
public class DialogosController {
    @Autowired
    private DialogosService service;

    @GetMapping(path = "/listar")
    public ResponseEntity<Dialogos> listarDialogoAleatorio() {
        List<Dialogos> dialogos = service.listar();
        if(dialogos.isEmpty()){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        Random random = new Random();
        int randomIndex = random.nextInt(dialogos.size());
        Dialogos dialogoSorterteado = dialogos.get(randomIndex);
        return new ResponseEntity<>(dialogoSorterteado, HttpStatus.OK);
    }
}
