package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.services.DialogosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/dialogos")
public class DialogosController {
    @Autowired
    private DialogosService service;
    @GetMapping("/listar")
    public List<Dialogos> listar(){return service.listar();}

//    @PostMapping
//    public Dialogos cadastrar(@RequestBody Dialogos dialogos){return service.cadastrar(dialogos);}
}
