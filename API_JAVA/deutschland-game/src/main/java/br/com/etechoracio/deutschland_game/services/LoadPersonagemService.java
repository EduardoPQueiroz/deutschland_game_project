package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.LoadPersonagemDto;
import br.com.etechoracio.deutschland_game.entities.Dialogos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoadPersonagemService {

    private final PersonagemSpriteService personagemSpriteService;

    @Autowired
    public LoadPersonagemService(PersonagemSpriteService personagemSpriteService) {
        this.personagemSpriteService = personagemSpriteService;
    }

    public LoadPersonagemDto formataResponse(Dialogos dialogo){
        var personagemNome = dialogo.getPersonagens().getNome();
        var personagemID = dialogo.getPersonagens().getId();
//        var personagemSprite = personagemSpriteService.getPersonagemById(personagemID).getspritePersonagem();

        return new LoadPersonagemDto(personagemNome, "img");
    }

}
