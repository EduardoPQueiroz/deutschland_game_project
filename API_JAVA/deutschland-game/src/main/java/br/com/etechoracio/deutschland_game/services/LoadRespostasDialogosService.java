package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.LoadRespostasDialogosDto;
import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.entities.RespostasTexto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoadRespostasDialogosService {

    private final RespostasTextoService respostasTextoService;

    @Autowired
    public LoadRespostasDialogosService(RespostasTextoService respostasTextoService) {
        this.respostasTextoService = respostasTextoService;
    }

    public LoadRespostasDialogosDto formataDto(Dialogos dialogo){

        List<RespostasTexto> respostas = respostasTextoService.getRespostasByDialogos(dialogo);

        if(respostas.get(0).getEscolha() == 1) return new LoadRespostasDialogosDto(respostas.get(0).getConteudo(), respostas.get(1).getConteudo());
        return new LoadRespostasDialogosDto(respostas.get(1).getConteudo(), respostas.get(0).getConteudo());

    }

}
