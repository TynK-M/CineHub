package org.generationitaly.cinehub.entity;

import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
@Table (name = "giudizio")
public class Giudizio {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_utente", nullable = false)
	private Utente utente;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_film", nullable = false)
	private Film film;
	
	@Column(nullable = false)
	private int stelle;
	
	
	@Column (columnDefinition = "TEXT")
	private String commento;
	
	@Column(name ="data_giudizio")
	private LocalDateTime dataGiudizio = LocalDateTime.now();

}
