package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.EraSprites;
import br.com.etechoracio.deutschland_game.repositories.EraSpritesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;

@Service
public class EraSpritesService {
    @Autowired
    private EraSpritesRepository repository;

    public EraSprites getEraById(long id){
        return repository.findById(id).orElse(null);
    }
    public EraSprites saveSpriteEra(MultipartFile spriteEra) throws IOException{
        EraSprites eraSprites = new EraSprites();
        long newId = repository.count() + 1;

        eraSprites.setId(newId);

        if (spriteEra != null && !spriteEra.isEmpty()){
            String base64Image = Base64.getEncoder().encodeToString(spriteEra.getBytes());
            eraSprites.setSpriteEra(base64Image);
        }

        return repository.save(eraSprites);
    }
}
