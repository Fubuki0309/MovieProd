package com.movieprod.model;

import javax.persistence.*;

@Entity
@Table(name = "plateau")
public class Plateau {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "nomplateau")
    private String nomplateau;

    @Column(name = "lieu")
    private String lieu;

    public Plateau() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNomplateau() {
        return nomplateau;
    }

    public void setNomplateau(String nomplateau) {
        this.nomplateau = nomplateau;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }
}
