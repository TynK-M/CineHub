package org.generationitaly.cinehub.entity;

import lombok.*;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PostoAcquistatoId implements Serializable {
    private Integer acquisto;
    private Integer posto;
}
