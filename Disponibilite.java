package com.movieprod.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "disponibilitep")
public class Disponibilite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "dateprevue")
    private Date dateprevue;

    @Column(name = "observation")
    private String observation;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, targetEntity = Plateau.class)
    @JoinColumn(name = "idplateau")
    private Plateau plateau;

    public Disponibilite() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getDateprevue() {
        return dateprevue;
    }

    public void setDateprevue(Date dateprevue) {
        this.dateprevue = dateprevue;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public Plateau getPlateau() {
        return plateau;
    }

    public void setPlateau(Plateau plateau) {
        this.plateau = plateau;
    }
}
