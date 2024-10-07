package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.dtos.LoadDialogosDatasDto;
import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.entities.Era;
import br.com.etechoracio.deutschland_game.services.DialogosService;
import br.com.etechoracio.deutschland_game.services.LoadDialogosDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/dialogos")
public class DialogosController {

    private final DialogosService service;
    private final LoadDialogosDatasService dialogosDatasService;

    @Autowired
    public DialogosController(DialogosService service, LoadDialogosDatasService dialogosDatasService) {
        this.service = service;
        this.dialogosDatasService = dialogosDatasService;
    }
}
