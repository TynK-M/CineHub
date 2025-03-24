package org.generationitaly.cinehub.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name="posto_acquistato")
public class PostoAcquistato {

	@OneToOne
	@JoinColumn(name = "id_acquisto" )
	private Integer idAcquisto;
	
	@OneToOne
	@JoinColumn(name="ad_posto" )
	private Integer idPosto;
	
}
