package org.generationitaly.cinehub.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
/*
 * CREATE TABLE utente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL, -- Nome dell'utente
    cognome VARCHAR(50) NOT NULL, -- Cognome dell'utente
    email VARCHAR(100) UNIQUE NOT NULL, -- Email unica
    password VARCHAR(255) NOT NULL, -- Password cifrata
    consenso_newsletter BOOLEAN DEFAULT FALSE, -- Se l'utente accetta di ricevere newsletter
    data_registrazione DATETIME DEFAULT CURRENT_TIMESTAMP -- Data di registrazione automatica
);

 * */


@Entity
@Table(name = "utente")
public class Utente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;

	@Column(name = "nome", nullable = false,length=50)
	private String nome;

	@Column(name = "cognome", nullable = false,length=50)
	private String cognome;

	@Column(name = "email", nullable = false, unique = true,length=100)
	private String email;

	@Column(name = "password", nullable = false, length=255)
	private String password;

	@Column(name = "consenso_newsletter", columnDefinition = "TIMYINT(1) DEFAULT 0")
	private Boolean consensoNewsletter;

	@Column(name = "data_registrazione", nullable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private LocalDateTime dataRegistrazione = LocalDateTime.now();

}
