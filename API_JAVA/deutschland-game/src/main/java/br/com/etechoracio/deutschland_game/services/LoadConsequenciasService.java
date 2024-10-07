package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.LoadConsequenciasDto;
import br.com.etechoracio.deutschland_game.entities.Consequencia;
import br.com.etechoracio.deutschland_game.entities.Dialogos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoadConsequenciasService {

    private final LoadConquistasConsequenciaService loadConquistasConsequenciaService;
    private final ConsequenciasService consequenciasService;

    @Autowired
    public LoadConsequenciasService(LoadConquistasConsequenciaService loadConquistasConsequenciaService, ConsequenciasService consequenciasService) {
        this.loadConquistasConsequenciaService = loadConquistasConsequenciaService;
        this.consequenciasService = consequenciasService;
    }

    public LoadConsequenciasDto formataDto (Dialogos dialogos){

        var consequenciassAceita = consequenciasService.getAllConsequenciasByDialogo(dialogos, 1);
        var consequenciasRecusada = consequenciasService.getAllConsequenciasByDialogo(dialogos, 0);

        var aceito = loadConquistasConsequenciaService.formataDto(consequenciassAceita);
        var recusado = loadConquistasConsequenciaService.formataDto(consequenciasRecusada);

        return new LoadConsequenciasDto(aceito, recusado);

    }

}
