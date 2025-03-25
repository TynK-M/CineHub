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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 100)
    private String titolo;

    @Column(columnDefinition = "TEXT")
    private String descrizione;

    @Column(name = "link_trailer", length = 255)
    private String linkTrailer;

    @Column(nullable = false)
    private int durata;

    @Column(name = "data_uscita")
    private LocalDate dataUscita;

    @Column(length = 255)
    private String locandina;

    @Column(length = 50)
    private String genere;

    @Column(nullable = false, length = 50)
    private String nazione;

    @Column(nullable = false)
    private boolean vintage;

    @Column(name = "check_uscita", nullable = false)
    private boolean checkUscita;
}
