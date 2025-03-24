package org.generationitaly.cinehub.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

@Entity
@Table(name= "film")
public class Film {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    @Column (name= "id")
    private Integer id;

    @Column (name = "titolo" , nullable = false, length = 100)
    private String titolo;

    @Column(name = "descrizione", columnDefinition = "TEXT")
    private String descrizione;

    @Column(name = "link_trailer", length = 255)
    private String linkTrailer;

    @Column(name = "durata", nullable = false)
    private int durata;

    @Column(name = "data_uscita")
    private LocalDate dataUscita;
}
