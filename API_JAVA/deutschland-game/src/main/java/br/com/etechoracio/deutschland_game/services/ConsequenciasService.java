package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.Consequencia;
import br.com.etechoracio.deutschland_game.repositories.ConsequenciasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConsequenciasService {
    @Autowired
    private ConsequenciasRepository consequenciasRepository;

    public List<Consequencia> getAllConsequencias(){
        return consequenciasRepository.findAll();
    }
}
