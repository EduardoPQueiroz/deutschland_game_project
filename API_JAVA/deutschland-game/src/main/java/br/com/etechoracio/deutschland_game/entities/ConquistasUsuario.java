package br.com.etechoracio.deutschland_game.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="ConquistasUsuario")
@Getter
@Setter
public class ConquistasUsuario {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id", columnDefinition = "bigint")
    private Long id;

    @Column(name="valor")
    private int valor;

    @JoinColumn(name="id_conquistas")
    @OneToOne
    private Conquistas conquista;

    @JoinColumn(name="id_usuario")
    @OneToOne
    private Usuario usuario;
}
