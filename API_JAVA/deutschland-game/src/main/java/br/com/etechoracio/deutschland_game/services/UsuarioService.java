package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.CadastroUsuarioDto;
import br.com.etechoracio.deutschland_game.entities.Usuario;
import br.com.etechoracio.deutschland_game.exceptions.UserNameExceededCharLimitException;
import br.com.etechoracio.deutschland_game.exceptions.UserNameSpecialCharsException;
import br.com.etechoracio.deutschland_game.exceptions.UserNotFoundByIdException;
import br.com.etechoracio.deutschland_game.repositories.UsuarioRepository;
import org.apache.catalina.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.Optional;

@Service
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;

    @Autowired
    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    public Usuario cadastrar(CadastroUsuarioDto model){
        var user = new Usuario();
        BeanUtils.copyProperties(model, user);

        if(user.isNameLengthValid()) throw new UserNameExceededCharLimitException();

        if(user.isNameCharsValid()) throw new UserNameSpecialCharsException();

        return usuarioRepository.save(user);
    }

    public void deletar(Long id){
        var user = usuarioRepository.findById(id).orElseThrow(UserNotFoundByIdException::new);

        usuarioRepository.delete(user);
    }

}
