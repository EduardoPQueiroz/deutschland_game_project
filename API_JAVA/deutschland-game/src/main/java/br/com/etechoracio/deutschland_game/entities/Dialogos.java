package br.com.etechoracio.deutschland_game.entities;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Table(name = "Dialogos")
@Entity
@Getter
@Setter
public class Dialogos {
    @Column(name = "id_dialogo")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private int idDialogo;

    @Column(name = "tipo_dialogo")
    private String tipoDialogo;

    @Column(name = "texto_dialogo")
    private String textoDialogo;
}
