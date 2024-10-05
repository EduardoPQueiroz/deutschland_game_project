package br.com.etechoracio.deutschland_game.exceptions;

//Para testes
public class PersonagemIdNotFoundException extends RuntimeException{
    public PersonagemIdNotFoundException() {
        super("O personagem com este Id não existe");
    }
}
