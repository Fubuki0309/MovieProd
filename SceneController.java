package com.movieprod.controller;

import com.movieprod.dao.HibernateDAO;
import com.movieprod.model.Acteur;
import com.movieprod.model.Film;
import com.movieprod.model.Plateau;
import com.movieprod.model.Scene;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping(path = "Scene")
public class SceneController {

    @Autowired
    HibernateDAO hdao;

    @GetMapping(path = "/addform")
    public String addScene(
            Model model,
            @RequestParam("idfilm") long idfilm) throws Exception
    {
        List<Plateau> list = null;
        List<Acteur> acteurs = null;
        try {
            list = hdao.findAll(Plateau.class);
            acteurs = hdao.findAll(Acteur.class);
        } catch(Exception e){
            e.printStackTrace();
        }
        model.addAttribute("list",list);
        model.addAttribute("acteurs",acteurs);
        model.addAttribute("idfilm",idfilm);
        return "sceneform";
    }

    @PostMapping(path = "/addprocess")
    public String addProcess(
            Model model,
            @RequestParam("scenelabel") String scenelabel,
            @RequestParam("duree") int duree,
            @RequestParam("ordre") int ordre,
            @RequestParam("auteur") String auteur,
            @RequestParam("idplateau") long idplateau,
            @RequestParam("acteurs") String acteurs,
            @RequestParam("idfilm") long idfilm) throws Exception
    {
        Film film = null;
        Scene scene = new Scene();
        String[] idacteurs = acteurs.split(",");
        Set<Acteur> list = new HashSet<Acteur>();
        try {
            scene.setScenelabel(scenelabel);
            scene.setDuree(duree);
            scene.setOrdre(ordre);
            scene.setAuteur(auteur);
            scene.setIdplateau(idplateau);
            film = hdao.findById(Film.class,idfilm);
            scene.setFilm(film);
            for(int i=0; i<idacteurs.length; i++){
                Acteur a = hdao.findById(Acteur.class,Long.parseLong(idacteurs[i]));
                list.add(a);
            }
            scene.setActeurs(list);
            scene = hdao.create(scene);
        } catch(Exception e){
            e.printStackTrace();
        }
       return this.getDetails(model,idfilm);
    }

    @PostMapping(path = "/fiches")
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

    @PostMapping(path = "/delete")
    public String delete(
            Model model,
            @RequestParam("idfilm") long idfilm,
            @RequestParam("idscene") long idscene
    ) throws Exception
    {
        try {
            hdao.deleteById(Scene.class,idscene);
        } catch(Exception e){
            throw e;
        }
        return this.getDetails(model,idfilm);
    }

    @PostMapping(path = "/loadmodifform")
    public String modifform(
            Model model,
            @RequestParam("idscene") long idscene,
            @RequestParam("idfilm") long idfilm
    ) throws Exception
    {
        Scene s = null;
        Plateau p = null;
        List<Plateau> list = null;
        try {
            s = hdao.findById(Scene.class,idscene);
            list = hdao.findAll(Plateau.class);
            p = hdao.findById(Plateau.class,s.getIdplateau());
            model.addAttribute("scene",s);
            model.addAttribute("idfilm",idfilm);
            model.addAttribute("list",list);
            model.addAttribute("plateau",p);
        } catch(Exception e){
            throw e;
        }
        return "scenemodifform";
    }

    @PostMapping(path = "/modify")
    public String modify(
            Model model,
            @ModelAttribute Scene scene,
            @RequestParam("idplateau") long idplateau,
            @RequestParam("idfilm") long idfilm) throws Exception
    {
        Film film = null;
        try {
            film = hdao.findById(Film.class,idfilm);
            scene.setFilm(film);
            scene.setIdplateau(idplateau);
            scene = hdao.update(scene);
            System.out.println("Id de scene"+scene.getId());
        } catch(Exception e){
            e.printStackTrace();
        }

        return this.getDetails(model,idfilm);
    }
}
