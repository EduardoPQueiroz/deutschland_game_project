package br.com.etechoracio.deutschland_game.entities;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "Personagens")
@Data
public class PersonagensSprite {
    @Id
    private Long id;
    private String spritePersonagem;

    public String getspritePersonagem() {
        return spritePersonagem;
    }

    public void setSpritePersonagem(String spritePersonagem) {
        this.spritePersonagem = spritePersonagem;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
