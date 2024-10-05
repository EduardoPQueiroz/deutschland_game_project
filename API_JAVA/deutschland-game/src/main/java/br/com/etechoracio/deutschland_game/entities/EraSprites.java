package br.com.etechoracio.deutschland_game.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@Document(collection = "Era")
public class EraSprites {
    @Id
    private Long id;
    private String spriteEra;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSpriteEra() {
        return spriteEra;
    }

    public void setSpriteEra(String spriteEra) {
        this.spriteEra = spriteEra;
    }
}
