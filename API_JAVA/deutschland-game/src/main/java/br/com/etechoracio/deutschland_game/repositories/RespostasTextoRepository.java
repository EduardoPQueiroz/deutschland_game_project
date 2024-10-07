package br.com.etechoracio.deutschland_game.repositories;

import br.com.etechoracio.deutschland_game.entities.Dialogos;
import br.com.etechoracio.deutschland_game.entities.RespostasTexto;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface RespostasTextoRepository extends JpaRepository<RespostasTexto, Long> {

    List<RespostasTexto> findAllByDialogos(Dialogos dialogos);

}
