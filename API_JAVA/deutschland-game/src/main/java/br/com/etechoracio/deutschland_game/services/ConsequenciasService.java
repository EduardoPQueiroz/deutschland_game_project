package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.Consequencia;
import br.com.etechoracio.deutschland_game.repositories.ConsequenciasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ConsequenciasService {
    @Autowired
    private ConsequenciasRepository consequenciasRepository;

    public List<Consequencia> getAllConsequencias(){
        return consequenciasRepository.findAll();
    }
    public List<Consequencia> getAllConsequenciasByDialogo(Long id) {

        return consequenciasRepository.findAll().stream().filter(consequencia -> {
            return consequencia.getDialogos().getId().equals(id);
        }).collect(Collectors.toList());
    }

}
