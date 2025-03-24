package org.generationitaly.cinehub.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
 *CREATE TABLE `newsletter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oggetto` varchar(100) NOT NULL,
  `messaggio` text NOT NULL,
  `data_invio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
)
 */


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
@Table(name = "newsletter")
public class Newsletter {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", nullable = false)
	private int id;

	@Column(name = "oggetto", nullable = false, length = 100)
	private String oggetto;
	
	@Column(name = "messaggio", nullable = false, columnDefinition = "TEXT")  
	private String messaggio;
	
	@Column(name = "data_invio", nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP") 
	private LocalDateTime dataInvio = LocalDateTime.now();
	
	
	
}
