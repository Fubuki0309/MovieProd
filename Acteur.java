package com.movieprod.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "acteur")
public class Acteur {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "nom")
    private String nom;

    @Column(name = "prenom")
    private String prenom;

    @Column(name = "datenaissance")
    private Date datenaissance;

    @Column(name = "sexe")
    private String sexe;

    @ManyToMany
    @JoinTable(name = "acteurscene", joinColumns = @JoinColumn(name = "idacteur"), inverseJoinColumns = @JoinColumn(name = "idscene"))
    private Set<Scene> acteurSet = new HashSet<Scene>();

    public Acteur() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Date getDatenaissance() {
        return datenaissance;
    }

    public void setDatenaissance(Date datenaissance) {
        this.datenaissance = datenaissance;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public Set<Scene> getActeurSet() {
        return acteurSet;
    }

    public void setActeurSet(Set<Scene> acteurSet) {
        this.acteurSet = acteurSet;
    }
}
