package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.CadastroUsuarioDto;
import br.com.etechoracio.deutschland_game.entities.Usuario;
import br.com.etechoracio.deutschland_game.exceptions.UserNameExceededCharLimitException;
import br.com.etechoracio.deutschland_game.exceptions.UserNameSpecialCharsException;
import br.com.etechoracio.deutschland_game.exceptions.UserNotFoundByIdException;
import br.com.etechoracio.deutschland_game.repositories.UsuarioRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    private final UsuarioRepository usuarioRepository;
    private final ConquistasUsuarioService conquistasUsuarioService;

    public UsuarioService(UsuarioRepository usuarioRepository, ConquistasUsuarioService conquistasUsuarioService) {
        this.usuarioRepository = usuarioRepository;
        this.conquistasUsuarioService = conquistasUsuarioService;
    }

    public Long cadastrar(CadastroUsuarioDto model){
        var user = new Usuario();
        BeanUtils.copyProperties(model, user);

        if(user.isNameLengthValid()) throw new UserNameExceededCharLimitException();

        if(user.isNameCharsValid()) throw new UserNameSpecialCharsException();

        Usuario userInDB= usuarioRepository.save(user);
        conquistasUsuarioService.createAllConquistasUsuarioWithUser(userInDB);

        return user.getId();
    }

    public void deletar(Long id){
        var user = usuarioRepository.findById(id).orElseThrow(UserNotFoundByIdException::new);

        usuarioRepository.delete(user);
    }

}
