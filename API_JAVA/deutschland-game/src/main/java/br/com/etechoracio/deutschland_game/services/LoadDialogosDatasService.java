package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.LoadDialogosDatasDto;
import br.com.etechoracio.deutschland_game.entities.Dialogos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LoadDialogosDatasService {

    private final PersonagemSpriteService personagemSpriteService;
    private final LoadRespostasDialogosService loadRespostasDialogosService;
    private final RespostasTextoService respostasTextoService;
    private final LoadConsequenciasService loadConsequenciasService;

    private final LoadPersonagemService loadPersonagemService;

    public LoadDialogosDatasService(PersonagemSpriteService personagemSpriteService, LoadRespostasDialogosService loadRespostasDialogosService, RespostasTextoService respostasTextoService, LoadConsequenciasService loadConsequenciasService, LoadPersonagemService loadPersonagemService) {
        this.personagemSpriteService = personagemSpriteService;
        this.loadRespostasDialogosService = loadRespostasDialogosService;
        this.respostasTextoService = respostasTextoService;
        this.loadConsequenciasService = loadConsequenciasService;
        this.loadPersonagemService = loadPersonagemService;
    }

    public List<LoadDialogosDatasDto> formataResponse(List<Dialogos> dialogos){
        List<LoadDialogosDatasDto> finalResponse = new ArrayList<>();

        for(int i = 0; i < dialogos.size(); i++){
            var id_dialogo = dialogos.get(i).getId();
            var mensagem = dialogos.get(i).getMensagem();

            var loadRespostasDto = loadRespostasDialogosService.formataDto(dialogos.get(i));

            var loadPersonagemDto = loadPersonagemService.formataResponse(dialogos.get(i));

            var loadConsequencias = loadConsequenciasService.formataDto(dialogos.get(i));

            var loadDialogosDatasDto = new LoadDialogosDatasDto(id_dialogo, mensagem, loadRespostasDto, loadConsequencias, loadPersonagemDto);

            finalResponse.add(loadDialogosDatasDto);
        }
        return finalResponse;
    }

}
