package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.repositories.DialogosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class DialogosService {

    @Autowired
    private DialogosRepository repository;

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
            int randomIndex = random.nextInt(dialogos.size());//Me fale se essa perte pode melhorar
            dialogosSorteados.add(dialogos.remove(randomIndex));
        }

        return dialogosSorteados;
    }
}
