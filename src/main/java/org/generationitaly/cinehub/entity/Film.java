package org.generationitaly.cinehub.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.time.LocalTime;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
 /* Classe entity gestita da JPA */
@Table(name= "film") /* Mappata alla tabella 'film' */
public class Film {
@Id /* Campo chiave primaria */
@GeneratedValue (strategy = GenerationType.IDENTITY) /* Auto-increment */
@Column (name= "id") /* Colonna ID */
private int id;

@Column (name = "titolo" , nullable = false, length = 100) /* Titolo obbligatorio max 100 char */
private String titolo;

@Column(name = "descrizione", columnDefinition = "TEXT") /* Descrizione come testo lungo */
private String descrizione;

@Column(name = "link_trailer", length = 255) /* Link max 255 char */
private String linkTrailer;

@Column(name = "durata", nullable = false) /* Durata in minuti, obbligatoria */
private int durata;

@Column(name = "data_uscita") /* Data di uscita */
private LocalDate dataUscita;


}
