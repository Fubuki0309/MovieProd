package com.movieprod.controller;

import com.movieprod.dao.HibernateDAO;
import com.movieprod.model.Film;
import com.movieprod.model.Scene;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(path = "Film")
public class FilmController {

    @Autowired
    HibernateDAO hdao;

    @GetMapping(path = "/homepage")
    public String getMovies(Model model){
        List<Film> list = hdao.findAll(Film.class);
        model.addAttribute("list",list);
        return "movies";
    }

    @PostMapping(path = "/fiche")
    public String getDetails(
            Model model,
            @RequestParam("idfilm") long idfilm) throws Exception
    {
        Film f = null;
        List<Scene> list = null;
        try {
            f = hdao.findById(Film.class,idfilm);
            list = hdao.findAllById(Scene.class,idfilm,"film.id");
            model.addAttribute("film",f);
            model.addAttribute("list",list);
        } catch(Exception e){
            throw e;
        }
        return "fichefilm";
    }

    @PostMapping(path = "/validate")
    public String validate(){
        return "planning";
    }

}
