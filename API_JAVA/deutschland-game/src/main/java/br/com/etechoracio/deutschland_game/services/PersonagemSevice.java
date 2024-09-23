package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.Personagens;
import br.com.etechoracio.deutschland_game.exceptions.PersonagemIdNotFoundException;
import br.com.etechoracio.deutschland_game.repositories.PersonagemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonagemSevice {

    @Autowired
    private PersonagemRepository personagemRepository;

    public Personagens getPersonagensById(Long id) throws PersonagemIdNotFoundException{
        return personagemRepository.findById(id).orElseThrow(PersonagemIdNotFoundException::new);
    }


}
