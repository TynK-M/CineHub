package org.generationitaly.cinehub.entity;

import java.time.LocalDateTime;
import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
@Table(name = "acquisto")
public class Acquisto {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "id_utente", nullable = false)
	private Utente utente;

	@ManyToOne
	@JoinColumn(name = "id_spettacolo", nullable = false)
	private Spettacolo spettacolo;

	@Column(name = "data_acquisto", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private LocalDateTime dataAcquisto = LocalDateTime.now();

	@OneToMany(mappedBy = "acquisto", fetch = FetchType.LAZY)
	private List<PostoAcquistato> postiAcquistati;
}
