package br.com.etechoracio.deutschland_game.repositories;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DialogosRepository extends JpaRepository<Dialogos, Long> {
    List<Dialogos> findByTexto(String Texto);

}
