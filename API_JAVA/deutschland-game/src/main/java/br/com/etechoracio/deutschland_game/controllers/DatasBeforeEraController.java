package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.dtos.LoadDialogosDatasDto;
import br.com.etechoracio.deutschland_game.entities.Era;
import br.com.etechoracio.deutschland_game.services.DialogosService;
import br.com.etechoracio.deutschland_game.services.LoadDialogosDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/allDatas/load")
@RestController
public class DatasBeforeEraController {

    private final LoadDialogosDatasService dialogosDatasService;
    private final DialogosService dialogosService;

    @Autowired
    public DatasBeforeEraController(LoadDialogosDatasService dialogosDatasService, DialogosService dialogosService) {
        this.dialogosDatasService = dialogosDatasService;
        this.dialogosService = dialogosService;
    }

    @GetMapping("/era/{id}")
    public ResponseEntity<List<LoadDialogosDatasDto>> carregar(@PathVariable("id") Era id){
        var dialogos = dialogosService.dialogosByEraID(id);
        var dialogosSorteados = dialogosService.sortearDialogos(dialogos);
        return ResponseEntity.status(HttpStatus.OK).body(dialogosDatasService.formataResponse(dialogosSorteados));
    }
}
