package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.ConquistasUsuarioDto;
import br.com.etechoracio.deutschland_game.entities.ConquistasUsuario;
import br.com.etechoracio.deutschland_game.repositories.ConquistasUsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service

public class ConquistasUsuarioService {
    @Autowired
    private ConquistasUsuarioRepository conquistasUsuarioRepository;

    public void updateConquistas(ConquistasUsuarioDto model){
        Optional<ConquistasUsuario> optionalConquistasUsuario = conquistasUsuarioRepository
                .findByConquistaIdAndUsuarioId(model.conquistas().getId(), model.usuario().getId());

        if (optionalConquistasUsuario.isPresent()) {
            ConquistasUsuario conquistasUsuario = optionalConquistasUsuario.get();
            conquistasUsuario.setValor(conquistasUsuario.getValor() + model.valor_acresc());
            conquistasUsuarioRepository.save(conquistasUsuario);
        } else {
            throw new RuntimeException("Conquista ou Usuário não encontrado");
        }
    }
    }
}
