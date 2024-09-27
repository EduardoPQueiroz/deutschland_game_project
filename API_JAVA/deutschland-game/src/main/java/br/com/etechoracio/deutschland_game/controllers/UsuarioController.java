package br.com.etechoracio.deutschland_game.controllers;

import br.com.etechoracio.deutschland_game.dtos.CadastroUsuarioDto;
import br.com.etechoracio.deutschland_game.entities.Usuario;
import br.com.etechoracio.deutschland_game.services.UsuarioService;
import org.apache.coyote.Response;
import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/usuario/")
public class UsuarioController {

    private final UsuarioService usuarioService;

    @Autowired
    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @PostMapping (path = "cadastrar")
    public ResponseEntity<Usuario> cadastrar(@RequestBody CadastroUsuarioDto model){
        return ResponseEntity.status(HttpStatus.OK).body(usuarioService.cadastrar(model));
    }

    @DeleteMapping(path = "deletar/id/{id}")
    public ResponseEntity<String> deletar(@PathVariable("id") Long id){
        usuarioService.deletar(id);
        return ResponseEntity.status(HttpStatus.OK).body("Usuário deletedo com sucesso!");
    }

}
