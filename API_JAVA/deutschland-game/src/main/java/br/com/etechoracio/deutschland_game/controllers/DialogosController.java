package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.services.DialogosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/dialogos")
public class DialogosController {

    @Autowired
    private DialogosService service;

    @GetMapping("/listar")
    public ResponseEntity<List<Dialogos>> listarDialogosAleatorios() {
        List<Dialogos> dialogos = service.obterDialogosAleatorios();
        if (dialogos.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(dialogos, HttpStatus.OK);
    }
}
