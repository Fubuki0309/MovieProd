package com.movieprod.controller;

import com.movieprod.dao.HibernateDAO;
import com.movieprod.model.Disponibilite;
import com.movieprod.model.Plateau;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping(path = "Plateau")
public class PlateauController {

    @Autowired
    HibernateDAO hdao;

    @GetMapping(path = "/loadindispform")
    public String getAll(Model model){
        List<Plateau> list = hdao.findAll(Plateau.class);
        model.addAttribute("list",list);
        return "formplateaux";
    }

    @PostMapping(path = "/process")
    private void process(
            Model model,
            @RequestParam("plateaux") String plateaux,
            @RequestParam("date") Date date,
            @RequestParam("observation") String observation
    )
    {
        String[] id = plateaux.split(",");
        try {
            for(int i=0; i<id.length; i++){
                Disponibilite d = new Disponibilite();
                //d.setIdplateau(Long.parseLong(id[i]));
                d.setDateprevue(date);
                d.setObservation(observation);
                d = hdao.create(d);
            }
        } catch(Exception e){
            e.printStackTrace();
        }


    }

    @GetMapping(path = "/indispcheck")
    public String displayPlateaux(Model model){
        List<Disponibilite> list = null;
        try {
            list = hdao.findAll(Disponibilite.class);
            model.addAttribute("list",list);
        } catch(Exception e){
            e.printStackTrace();
        }

        return "plateaux";
    }

    @PostMapping(path = "/deleteindisp")
    public String delete(
            Model model,
            @RequestParam("id") long id
    ){
        try {
            hdao.deleteById(Disponibilite.class,id);
        } catch(Exception e){
            e.printStackTrace();
        }

        return this.displayPlateaux(model);
    }
}
