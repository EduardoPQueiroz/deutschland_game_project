package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.entities.RespostasTexto;
import br.com.etechoracio.deutschland_game.repositories.RespostasTextoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RespostasTextoService {

    private final RespostasTextoRepository respostasTextoRepository;

    @Autowired
    public RespostasTextoService(RespostasTextoRepository respostasTextoRepository) {
        this.respostasTextoRepository = respostasTextoRepository;
    }

    public List<RespostasTexto> getRespostasByDialogos(Dialogos dialogos){
        return respostasTextoRepository.findAllByDialogos(dialogos);
    }
}
