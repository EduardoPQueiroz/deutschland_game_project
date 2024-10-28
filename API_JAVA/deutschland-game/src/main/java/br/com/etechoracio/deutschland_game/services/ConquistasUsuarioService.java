package br.com.etechoracio.deutschland_game.services;

import br.com.etechoracio.deutschland_game.dtos.ConquistasUsuarioDto;
import br.com.etechoracio.deutschland_game.dtos.LoadConsequenciasConquistasDto;
import br.com.etechoracio.deutschland_game.entities.Conquistas;
import br.com.etechoracio.deutschland_game.entities.ConquistasUsuario;
import br.com.etechoracio.deutschland_game.entities.Usuario;
import br.com.etechoracio.deutschland_game.repositories.ConquistasRepository;
import br.com.etechoracio.deutschland_game.repositories.ConquistasUsuarioRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;
import java.util.List;

@Service

public class ConquistasUsuarioService {

    private final ConquistasUsuarioRepository conquistasUsuarioRepository;

    private final ConquistasRepository conquistasRepository;

    public ConquistasUsuarioService(ConquistasUsuarioRepository conquistasUsuarioRepository, ConquistasRepository conquistasRepository) {
        this.conquistasUsuarioRepository = conquistasUsuarioRepository;
        this.conquistasRepository = conquistasRepository;
    }

    public void updateMultipleConquistas(List<LoadConsequenciasConquistasDto> conquistasUsuarioDtoList, Long userID) {
        for (LoadConsequenciasConquistasDto model : conquistasUsuarioDtoList) {
            Optional<ConquistasUsuario> optionalConquistasUsuario = conquistasUsuarioRepository
                    .findByConquistaIdAndUsuarioId(model.id_conquistas(), userID);
            if (optionalConquistasUsuario.isEmpty()) {
                throw new RuntimeException("Conquista ou Usuário não encontrado");
            }
            ConquistasUsuario conquistasUsuario = optionalConquistasUsuario.get();
            conquistasUsuario.setValor((int) (conquistasUsuario.getValor() + model.valor_acrescentado()));
            conquistasUsuarioRepository.save(conquistasUsuario);
        }
    }

    public void createAllConquistasUsuarioWithUser(Usuario usuario){

        List<Conquistas> conquistas = conquistasRepository.findAll();
        var conquistasUsuarios = new ArrayList<ConquistasUsuario>();

        for(Conquistas conquista: conquistas){
            var conquistaUsuario = new ConquistasUsuario();
            conquistaUsuario.setUsuario(usuario);
            conquistaUsuario.setConquista(conquista);
            conquistaUsuario.setValor(100);

            conquistasUsuarios.add(conquistaUsuario);
        }

        conquistasUsuarioRepository.saveAll(conquistasUsuarios);

    }

    public List<LoadConsequenciasConquistasDto> getConquistasByUserID(Usuario usuario){
        var conquistasUsuario = conquistasUsuarioRepository.findByUsuario(usuario);
        var conquistasUsuarioDto = new ArrayList<LoadConsequenciasConquistasDto>();

        for (ConquistasUsuario conquista : conquistasUsuario){
            var idConquista = conquista.getConquista().getId();
            var valor = conquista.getValor();
            var nome = conquista.getConquista().getAtributo();

            conquistasUsuarioDto.add(new LoadConsequenciasConquistasDto(idConquista, nome, valor));
        }

        return conquistasUsuarioDto;

    }
}