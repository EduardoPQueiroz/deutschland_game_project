package br.com.etechoracio.deutschland_game.repositories;

import br.com.etechoracio.deutschland_game.entities.EraSprites;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface EraSpritesRepository extends MongoRepository<EraSprites, Long> {
}
