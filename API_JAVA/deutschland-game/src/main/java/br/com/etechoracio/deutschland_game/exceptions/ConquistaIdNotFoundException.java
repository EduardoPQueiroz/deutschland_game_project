package br.com.etechoracio.deutschland_game.exceptions;

public class ConquistaIdNotFoundException extends RuntimeException{
    public ConquistaIdNotFoundException() {
        super("O id desta conquista não existe");
    }
}
