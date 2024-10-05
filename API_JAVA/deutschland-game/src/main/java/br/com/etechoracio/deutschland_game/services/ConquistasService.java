package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.Conquistas;
import br.com.etechoracio.deutschland_game.exceptions.ConquistaIdNotFoundException;
import br.com.etechoracio.deutschland_game.repositories.ConquistasRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConquistasService {
    @Autowired
    private ConquistasRepository conquistasRepository;
    public Conquistas getConquistaById(Long id){
        return conquistasRepository.findById(id).orElseThrow(ConquistaIdNotFoundException::new);
    }

}
