package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.PersonagensSprite;
import br.com.etechoracio.deutschland_game.repositories.PersonagemSpriteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;
import java.util.List;


@Service
public class PersonagemSpriteService {
    @Autowired
    private PersonagemSpriteRepository personagemSpriteRepository;

    public List<PersonagensSprite> getAllPersonagens() {
        return personagemSpriteRepository.findAll();
    }

    public PersonagensSprite getPersonagemById(long id) {
        return personagemSpriteRepository.findById(id).orElse(null);
    }

    public PersonagensSprite saveSpritePersonagem(MultipartFile spritePersonagem) throws IOException {
        PersonagensSprite personagem = new PersonagensSprite();
        long newId = personagemSpriteRepository.count() + 1;

        personagem.setId(newId);

        if (spritePersonagem != null && !spritePersonagem.isEmpty()) {
            String base64Image = Base64.getEncoder().encodeToString(spritePersonagem.getBytes());
            personagem.setSpritePersonagem(base64Image);
        }

        return personagemSpriteRepository.save(personagem);
    }
}
