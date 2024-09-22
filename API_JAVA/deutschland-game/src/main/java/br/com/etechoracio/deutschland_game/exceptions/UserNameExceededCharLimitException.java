package br.com.etechoracio.deutschland_game.exceptions;

public class UserNameExceededCharLimitException extends RuntimeException{

    public UserNameExceededCharLimitException() {
        super("Nome de usuário ultrapassou o limite de 32 caracteres!");
    }
}
