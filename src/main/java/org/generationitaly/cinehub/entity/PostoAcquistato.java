package org.generationitaly.cinehub.entity;

import jakarta.persistence.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@IdClass(PostoAcquistatoId.class)
@Entity
@Table(name = "posto_acquistato")
public class PostoAcquistato {

	@Id
	@ManyToOne
	@JoinColumn(name = "id_acquisto")
	private Acquisto acquisto;

	@Id
	@ManyToOne
	@JoinColumn(name = "id_posto")
	private Posto posto;
}