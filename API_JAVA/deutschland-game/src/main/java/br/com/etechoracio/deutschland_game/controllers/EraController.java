package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.dtos.LoadEraDataDto;
import br.com.etechoracio.deutschland_game.services.EraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/era/")
@RestController
public class EraController {

    private final EraService eraService;

    @Autowired
    public EraController(EraService eraService) {
        this.eraService = eraService;
    }

    @GetMapping(path = "id/{id}")
    public ResponseEntity<LoadEraDataDto> findById(@PathVariable("id") Long id){
        return ResponseEntity.status(HttpStatus.OK).body(eraService.getEra(id));
    }

}
