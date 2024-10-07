package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.LoadDialogosDatasDto;
import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.entities.Era;
import br.com.etechoracio.deutschland_game.entities.PersonagensSprite;
import br.com.etechoracio.deutschland_game.repositories.DialogosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

@Service
public class DialogosService {

    @Autowired
    private DialogosRepository repository;

    @Autowired
    private PersonagemSpriteService personagemSpriteService;

    public List<Dialogos> dialogosByEraID(Era idEra){
        return repository.findAllByEras(idEra);
    }

    public List<Dialogos> sortearDialogos(List<Dialogos> dialogos){
        Collections.shuffle(dialogos);
        Collections.shuffle(dialogos);

        return dialogos.subList(0, 4);
    }

}
