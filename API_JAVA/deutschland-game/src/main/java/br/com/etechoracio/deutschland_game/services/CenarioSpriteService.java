package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.entities.CenarioSprite;
import br.com.etechoracio.deutschland_game.repositories.CenarioSpriteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

@Service
public class CenarioSpriteService {
    @Autowired
    private CenarioSpriteRepository cenarioSpriteRepository;

    public CenarioSprite getCenarioById(long id) {
        return cenarioSpriteRepository.findById(id).orElse(null);
    }

    public CenarioSprite saveSpriteCenario(MultipartFile spriteCenario) throws IOException {
        CenarioSprite cenarioSprite = new CenarioSprite();
        long newId = cenarioSpriteRepository.count() + 1;

        cenarioSprite.setId(newId);

        if (spriteCenario != null && !spriteCenario.isEmpty()) {
            String base64Image = Base64.getEncoder().encodeToString(spriteCenario.getBytes());
            cenarioSprite.setSpriteCenario(base64Image);
        }

        return cenarioSpriteRepository.save(cenarioSprite);
    }
}
