package br.com.etechoracio.deutschland_game.repositories;

import br.com.etechoracio.deutschland_game.entities.Consequencia;
import br.com.etechoracio.deutschland_game.entities.Dialogos;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConsequenciasRepository extends JpaRepository<Consequencia, Long> {

    List<Consequencia> findAllByDialogosAndResposta(Dialogos dialogos, Integer respostas);

}
