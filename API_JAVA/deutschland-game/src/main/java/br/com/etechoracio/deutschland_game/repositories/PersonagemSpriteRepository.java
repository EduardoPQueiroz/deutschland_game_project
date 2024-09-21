package br.com.etechoracio.deutschland_game.repositories;

import br.com.etechoracio.deutschland_game.entities.PersonagensSprite;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface PersonagemSpriteRepository extends MongoRepository<PersonagensSprite, Long> {
}
