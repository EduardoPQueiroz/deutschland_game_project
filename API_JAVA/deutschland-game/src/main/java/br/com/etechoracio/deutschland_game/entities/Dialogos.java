package br.com.etechoracio.deutschland_game.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Table(name = "Dialogo")
@Entity
@Getter
@Setter
public class Dialogos {
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    @Column(name = "mensagem")
    private String mensagem;

    @JoinColumn(name = "id_personagem")
    @OneToOne
    private Personagens personagens;

    @JoinColumn(name = "id_era")
    @OneToOne
    private Era eras;

    @Transient
    private PersonagensSprite personagensSprite;
}
