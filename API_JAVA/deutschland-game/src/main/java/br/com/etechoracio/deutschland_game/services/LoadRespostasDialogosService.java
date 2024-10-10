package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.LoadRespostasDialogosDto;
import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.entities.RespostasTexto;
import br.com.etechoracio.deutschland_game.repositories.RespostasTextoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoadRespostasDialogosService {
    private final RespostasTextoRepository respostasTextoRepository;

    @Autowired
    public LoadRespostasDialogosService(RespostasTextoRepository respostasTextoRepository) {
        this.respostasTextoRepository = respostasTextoRepository;
    }

    public LoadRespostasDialogosDto formataDto(Dialogos dialogo){

        var aceito = respostasTextoRepository.findByDialogosAndEscolha(dialogo, 1).get().getConteudo();
        var recusado = respostasTextoRepository.findByDialogosAndEscolha(dialogo, 0).get().getConteudo();

        return new LoadRespostasDialogosDto(aceito, recusado);

    }

}
