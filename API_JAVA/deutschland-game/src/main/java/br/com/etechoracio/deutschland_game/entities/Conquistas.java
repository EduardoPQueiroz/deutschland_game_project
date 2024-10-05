package br.com.etechoracio.deutschland_game.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Conquistas")
@Getter
@Setter
public class Conquistas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", columnDefinition = "BIGINT")
    private Long id;

    @Column(name = "atributo")
    private String atributo;

    @Column(name = "valor", columnDefinition = "DECIMAL(10,2)")
    private Double valor;

    @JoinColumn(name = "id_usuario")
    @OneToOne
    private Usuario usuario;

}
