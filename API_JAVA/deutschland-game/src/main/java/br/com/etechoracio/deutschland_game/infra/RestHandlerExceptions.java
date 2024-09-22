package br.com.etechoracio.deutschland_game.infra;

import br.com.etechoracio.deutschland_game.exceptions.UserNameExceededCharLimitException;
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

}
