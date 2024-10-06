package br.com.etechoracio.deutschland_game.exceptions;

public class EraIdNotFoundException extends RuntimeException{

    public EraIdNotFoundException() {
        super("Era não encontrada!");
    }
}
