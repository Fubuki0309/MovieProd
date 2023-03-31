package com.movieprod.model;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name = "film")
public class Film {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "nomfilm")
    private String nomfilm;

    @Column(name = "production")
    private String nationaliteproduction;

    @Column(name = "datesortie")
    private Date datesortie;

    @Column(name = "duree")
    private Time duree;

    @Column(name = "logo")
    private String logo;

    @Column(name = "synopsis")
    private String synopsis;

    @Column(name = "realisateur")
    private String realisateur;

    @Column(name = "genre")
    private String genre;

    @Column(name = "affiche")
    private String affiche;

    public Film() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNomfilm() {
        return nomfilm;
    }

    public void setNomfilm(String nomfilm) {
        this.nomfilm = nomfilm;
    }

    public String getNationaliteproduction() {
        return nationaliteproduction;
    }

    public void setNationaliteproduction(String nationaliteproduction) {
        this.nationaliteproduction = nationaliteproduction;
    }

    public Date getDatesortie() {
        return datesortie;
    }

    public void setDatesortie(Date datesortie) {
        this.datesortie = datesortie;
    }

    public Time getDuree() {
        return duree;
    }

    public void setDuree(Time duree) {
        this.duree = duree;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String banniere) {
        this.logo = banniere;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public String getRealisateur() {
        return realisateur;
    }

    public void setRealisateur(String realisateur) {
        this.realisateur = realisateur;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getAffiche() {
        return affiche;
    }

    public void setAffiche(String affiche) {
        this.affiche = affiche;
    }
}
