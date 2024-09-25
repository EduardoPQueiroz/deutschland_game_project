package br.com.etechoracio.deutschland_game.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Consequencia")
@Getter
@Setter
public class Consequencia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "valor_mudanca", columnDefinition = "DECIMAL(10,2)")
    private Double valorMudanca;

    @Column(name = "foiPositivo", columnDefinition = "BIT")
    private Long foiPositivo;

    @JoinColumn(name = "conquista_id")
    @OneToOne
    private Conquistas conquistas;

    @JoinColumn(name = "dialogo_id")
    @OneToOne
    private Dialogos dialogos;

}
