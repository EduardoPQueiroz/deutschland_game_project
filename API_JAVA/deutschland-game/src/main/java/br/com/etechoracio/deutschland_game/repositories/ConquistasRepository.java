package br.com.etechoracio.deutschland_game.repositories;

import br.com.etechoracio.deutschland_game.entities.Conquistas;
import br.com.etechoracio.deutschland_game.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConquistasRepository extends JpaRepository<Conquistas, Long> {

}
