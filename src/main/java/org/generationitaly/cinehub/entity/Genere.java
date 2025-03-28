package org.generationitaly.cinehub.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.JoinColumnOrFormula;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "genere")
public class Genere {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "nome", unique = true)
    private String nome;

    @OneToMany(mappedBy = "genere")
    private List<Film> film;

    @Override
    public String toString() {
        return nome; // evito problemi con le jsp
    }
}
