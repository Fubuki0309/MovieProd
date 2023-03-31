package com.movieprod.model;

import javax.persistence.*;
import java.sql.Time;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "scene")
public class Scene {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "scenelabel")
    private String scenelabel;

    @Column(name = "duree")
    private int duree;

    @Column(name = "ordre")
    private int ordre;
    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, targetEntity = Film.class)
    @JoinColumn(name = "idfilm")
    private Film film;

    @Column(name = "idplateau")
    private long idplateau;

    @Column(name = "etat")
    private int etat;

    @Column(name = "auteur")
    private String auteur;

    @ManyToMany
    @JoinTable(name = "acteurscene", joinColumns = @JoinColumn(name = "idscene"), inverseJoinColumns = @JoinColumn(name = "idacteur"))
    private Set<Acteur> acteurs = new HashSet<Acteur>();

    public Scene() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getScenelabel() {
        return scenelabel;
    }

    public void setScenelabel(String scenelabel) {
        this.scenelabel = scenelabel;
    }

    public int getDuree() {
        return duree;
    }

    public void setDuree(int duree) {
        this.duree = duree;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public int getOrdre() {
        return ordre;
    }

    public void setOrdre(int ordre) {
        this.ordre = ordre;
    }

    public long getIdplateau() {
        return idplateau;
    }

    public void setIdplateau(long idplateau) {
        this.idplateau = idplateau;
    }

    public String getAuteur() {
        return auteur;
    }

    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public Set<Acteur> getActeurs() {
        return acteurs;
    }

    public void setActeurs(Set<Acteur> acteurs) {
        this.acteurs = acteurs;
    }
}
