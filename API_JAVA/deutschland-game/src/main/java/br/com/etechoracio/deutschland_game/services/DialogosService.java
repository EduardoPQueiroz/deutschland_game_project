package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.entities.PersonagensSprite;
import br.com.etechoracio.deutschland_game.repositories.DialogosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import br.com.etechoracio.deutschland_game.entities.Personagens;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class DialogosService {

    @Autowired
    private DialogosRepository repository;

    @Autowired
    private PersonagemSpriteService personagemSpriteService;


    public List<Dialogos> listar() {
        return repository.findAll();
    }

    public List<Dialogos> obterDialogosAleatorios() {
        List<Dialogos> dialogos = listar();
        if (dialogos.isEmpty()) {
            return new ArrayList<>();
        }

        Random random = new Random();
        List<Dialogos> dialogosSorteados = new ArrayList<>();


        for (int i = 0; i < 8 && !dialogos.isEmpty(); i++) {
            int randomIndex = random.nextInt(dialogos.size());//Me fale se essa parte pode melhorar 😎
            Dialogos dialogo = dialogos.remove(randomIndex);

            PersonagensSprite sprite = personagemSpriteService.getPersonagemById(dialogo.getPersonagens().getId());
            if (sprite != null) {
                dialogo.getPersonagens().setPersonagemImg(sprite.getspritePersonagem());
            }

            dialogosSorteados.add(dialogo);
        }

        return dialogosSorteados;
    }
}
