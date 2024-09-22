package br.com.etechoracio.deutschland_game.exceptions;

public class UserNameSpecialCharsException extends RuntimeException{

    public UserNameSpecialCharsException() {
        super("Nome de usuário não pode conter caracteres especiais!");
    }
}
