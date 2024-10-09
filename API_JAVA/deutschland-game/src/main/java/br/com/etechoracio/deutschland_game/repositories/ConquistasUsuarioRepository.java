package br.com.etechoracio.deutschland_game.repositories;
import br.com.etechoracio.deutschland_game.entities.ConquistasUsuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ConquistasUsuarioRepository extends JpaRepository<ConquistasUsuario, Long> {
    Optional<ConquistasUsuario> findByConquistaIdAndUsuarioId(Long conquistaId, Long usuarioId);
}