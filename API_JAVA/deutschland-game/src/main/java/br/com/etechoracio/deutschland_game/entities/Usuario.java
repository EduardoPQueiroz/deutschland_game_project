package br.com.etechoracio.deutschland_game.entities;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Entity
@Table(name = "Usuario")
@Getter
@Setter
public class Usuario {
    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "nome_usuario")
    private String nome;

    public Boolean isNameLengthValid(){
        return nome.length() > 32;
    }

    public Boolean isNameCharsValid(){
        Pattern pattern = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(nome);
        return matcher.find();
    }

}
