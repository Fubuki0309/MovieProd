package com.movieprod.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "planning")
public class Planning {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "dateplanned")
    private Date date;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "idplateau")
    private List<Plateau> list = new ArrayList<>();

    public Planning() {
    }

    public long getId() {


        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<Plateau> getList() {
        return list;
    }

    public void setList(List<Plateau> list) {
        this.list = list;
    }
}
