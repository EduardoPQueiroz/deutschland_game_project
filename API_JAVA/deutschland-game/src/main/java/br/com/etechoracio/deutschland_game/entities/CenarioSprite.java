package br.com.etechoracio.deutschland_game.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import java.util.Collection;

@Document(collection = "Cenarios")
@Data
public class CenarioSprite {
    @Id
    private long id;
    private String spriteCenario;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getSpriteCenario() {
        return spriteCenario;
    }

    public void setSpriteCenario(String spriteCenario) {
        this.spriteCenario = spriteCenario;
    }
}
