package br.com.etechoracio.deutschland_game.repositories;

import br.com.etechoracio.deutschland_game.entities.Conquistas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ConquistasRepository extends JpaRepository<Conquistas, Long> {
}
