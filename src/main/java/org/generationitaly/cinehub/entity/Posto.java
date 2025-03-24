package org.generationitaly.cinehub.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "posto",
        uniqueConstraints = @UniqueConstraint(columnNames = {"numero", "id_sala"})
)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Posto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private int numero;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_sala", nullable = false)
    private Sala sala;
}