package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.repositories.DialogosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DialogosService {
    @Autowired
    private DialogosRepository repository;
    public List<Dialogos> listar(){return repository.findAll();}
    public Dialogos cadastrar(Dialogos dialogos){
        var existe = repository.findByTexto(dialogos.getTextoDialogo());
        if (!existe.isEmpty()) {
            throw new RuntimeException("Dialógo já cadastrado");
        }
        return repository.save(dialogos);
    }
}