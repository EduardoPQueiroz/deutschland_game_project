package br.com.etechoracio.deutschland_game.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Table(name = "RespostasTexto")
@Entity
@Getter
@Setter
public class RespostasTexto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "conteudo")
    private String conteudo;

    @Column(name = "escolha", columnDefinition = "BIT")
    private Integer escolha;

    @JoinColumn(name = "id_dialogo")
    @OneToOne
    private Dialogos dialogos;

}
