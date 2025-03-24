package org.generationitaly.cinehub.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
/*CREATE TABLE `giudizio` (
		  `id` int NOT NULL AUTO_INCREMENT,
		  `id_utente` int NOT NULL,
		  `id_film` int DEFAULT NULL,
		  `stelle` int DEFAULT NULL,
		  `commento` text,
		  `data_giudizio` datetime DEFAULT CURRENT_TIMESTAMP,
		  PRIMARY KEY (`id`),
		  UNIQUE KEY `id_utente` (`id_utente`,`id_film`),
		  KEY `id_film` (`id_film`),
		  CONSTRAINT `giudizio_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utente` (`id`) ON DELETE CASCADE,
		  CONSTRAINT `giudizio_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`) ON DELETE SET NULL,
		  CONSTRAINT `giudizio_chk_1` CHECK ((`stelle` between 1 and 5))
		  */
@Entity
@Table (name = "giudizio")
public class Giudizio {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "id_utente", nullable = false)
	private Utente utente;
	
	@ManyToOne
	@JoinColumn(name = "id_film", nullable = false)
	private Film film;
	
	@Column(nullable = false)
	private int stelle;
	
	
	@Column (columnDefinition = "TEXT")
	private String commento;
	
	@Column(name ="data_giudizio", nullable =false)
	private LocalDateTime dataGiudizio;
	
	
	
	
	
}
