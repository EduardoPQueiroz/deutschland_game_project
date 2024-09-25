package br.com.etechoracio.deutschland_game.infra;

import br.com.etechoracio.deutschland_game.exceptions.PersonagemIdNotFoundException;
import br.com.etechoracio.deutschland_game.exceptions.UserNameExceededCharLimitException;
import br.com.etechoracio.deutschland_game.exceptions.UserNameSpecialCharsException;
import br.com.etechoracio.deutschland_game.exceptions.UserNotFoundByIdException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class RestHandlerExceptions extends ResponseEntityExceptionHandler {

    @ExceptionHandler(UserNameExceededCharLimitException.class)
    private ResponseEntity<String> userNameExceededCharLimitHandler(UserNameExceededCharLimitException e){
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
    }

    @ExceptionHandler(UserNameSpecialCharsException.class)
    private ResponseEntity<String> userNameSpecialCharsHandler(UserNameSpecialCharsException e){
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
    }

    @ExceptionHandler(UserNotFoundByIdException.class)
    private ResponseEntity<String> userNotFoundByIdHandler(UserNotFoundByIdException e){
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
    }

    @ExceptionHandler(PersonagemIdNotFoundException.class)
    private ResponseEntity<String> personagemIdNotFoundHandler(PersonagemIdNotFoundException e){
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
    }

}
