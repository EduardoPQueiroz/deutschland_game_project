package br.com.etechoracio.deutschland_game.repositories;

import br.com.etechoracio.deutschland_game.entities.CenarioSprite;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CenarioSpriteRepository extends MongoRepository<CenarioSprite, Long> {
}
