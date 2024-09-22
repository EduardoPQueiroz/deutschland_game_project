package br.com.etechoracio.deutschland_game.exceptions;

public class UserNotFoundByIdException extends RuntimeException{

    public UserNotFoundByIdException() {
        super("Usuario não encontrado!");
    }
}
