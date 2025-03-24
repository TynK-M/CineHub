package org.generationitaly.cinehub.entity;

import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.*;

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
	private Integer id;

	@Column(name = "oggetto", nullable = false, length = 100)
	private String oggetto;
	
	@Column(name = "messaggio", nullable = false, columnDefinition = "TEXT")  
	private String messaggio;
	
	@Column(name = "data_invio", nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP") 
	private LocalDateTime dataInvio = LocalDateTime.now();
}