package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.dtos.ConquistasUsuarioDto;
import br.com.etechoracio.deutschland_game.entities.Conquistas;
import br.com.etechoracio.deutschland_game.entities.ConquistasUsuario;
import br.com.etechoracio.deutschland_game.entities.Usuario;
import br.com.etechoracio.deutschland_game.exceptions.ConquistaIdNotFoundException;
import br.com.etechoracio.deutschland_game.services.ConquistasService;
import br.com.etechoracio.deutschland_game.services.ConquistasUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
    //ou um json como:
    //    [
    //    {
    //        "id_conquista": 2,
    //       "valor_acresc": 50,
    //         "id_usuario": 4
    //    },
    //    {
    //        "id_conquista": 3,
    //       "valor_acresc": 50,
    //         "id_usuario": 4
    //    }
    //]
    @PutMapping("/update")
    public ResponseEntity<Void> updateConquistas(@RequestBody List<ConquistasUsuarioDto> conquistasUsuarioDtoList){
        conquistasUsuarioService.updateMultipleConquistas(conquistasUsuarioDtoList);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @GetMapping("/all/user/id/{id}")
    public ResponseEntity<List<ConquistasUsuarioDto>> findAllByUsuario(@PathVariable("id") Usuario usuario){
        return ResponseEntity.status(HttpStatus.OK).body(conquistasUsuarioService.getConquistasByUserID(usuario));
    }
}
