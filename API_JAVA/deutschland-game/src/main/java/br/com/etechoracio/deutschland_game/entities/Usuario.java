package br.com.etechoracio.deutschland_game.entities;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Usuario")
@Getter
@Setter
public class Usuario {
    @Column(name = "id_usuario")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUsuario;

    @Column(name = "nome_usuario")
    private String nomeUsuario;

    @Column
    private float diplomacia;

    @Column(name = "rept_igreja")
    private float reptIgreja;

    @Column
    private float popularidade;

    @Column
    private float dinheiro;

    @Column
    private float exercito;
}
