package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.LoadConsequenciasConquistasDto;
import br.com.etechoracio.deutschland_game.entities.Consequencia;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LoadConquistasConsequenciaService {

    public List<LoadConsequenciasConquistasDto> formataDto(List<Consequencia> consequencias){

        List<LoadConsequenciasConquistasDto> loadConsequenciasConquistasDtoList = new ArrayList<>();

        for (Consequencia consequencia : consequencias){

            var id_conquistas = consequencia.getConquistas().getId();
            var nome_conquistas = consequencia.getConquistas().getAtributo();
            var valor_acrescentado = consequencia.getValorMudanca();

            var dtoFilled = new LoadConsequenciasConquistasDto(id_conquistas, nome_conquistas, valor_acrescentado);

            loadConsequenciasConquistasDtoList.add(dtoFilled);

        }

        return loadConsequenciasConquistasDtoList;


    }

}
