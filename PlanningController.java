package com.movieprod.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.movieprod.dao.HibernateDAO;
import com.movieprod.model.*;

import com.movieprod.tools.Dispo;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(path = "/Plan")
public class PlanningController {

    @Autowired
    HibernateDAO hdao;

    @GetMapping(path = "/planform")
    public String getForm(
            Model model,
            @RequestParam("idfilm") long idfilm
    )throws Exception
    {
        List<Scene> list = null;
        try {
            list = hdao.findByStateById(Scene.class,idfilm,"film.id",20);
            model.addAttribute("list",list);
        } catch(Exception e){
            throw e;
        }
        model.addAttribute("idfilm",idfilm);
        return "planningform";
    }

    @PostMapping(path = "/plan")
    public String plan(
            Model model,
            @RequestParam("scenes") String scenes,
            @RequestParam("datedebut") Date datedebut,
            @RequestParam("datefin") Date datefin,
            @RequestParam("idfilm") long idfilm
    )
    {
        //maka nbr de jours de tournage
        int nbrjours = 0;
        LocalDate dtdebut = datedebut.toLocalDate();
        LocalDate dtfin = datefin.toLocalDate();
        while(dtdebut.equals(dtfin) == false){
            nbrjours++;
            dtdebut = dtdebut.plusDays(1);
        }
        nbrjours++;

        //maka ny scenes tsirairay
        String[] id = scenes.split(",");
        List<Scene> list = new ArrayList<Scene>();
        for(int i=0; i<id.length; i++) {
            Scene s = hdao.findById(Scene.class, Long.parseLong(id[i]));
            list.add(s);
        }

        //maka ny plateaux apesain'ny scène tsirairay
        List<Plateau> plateaux = new ArrayList<Plateau>();
        for(Scene s: list){
            Plateau p = hdao.findById(Plateau.class, s.getIdplateau());
            plateaux.add(p);
            System.out.println("Plateau : "+p.getNomplateau());
        }

        //distinct plateaux
        /*List<Plateau> distinctP = new ArrayList<Plateau>();
        try {
            distinctP.add(plateaux.get(0));
            for(int i=1; i<=plateaux.size(); i++){
                for(Plateau p:distinctP){
                    if(plateaux.get(i).getNomplateau().equals(p.getNomplateau()) == false){
                        distinctP.add(plateaux.get(i));
                    }
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        }*/

        //indisponibilité plateau(dates,plateau)
        /*List<Planning> plannings = new ArrayList<>();
        List<Dispo> dispoList = new ArrayList<>();
        LocalDate dtd = datedebut.toLocalDate();
        LocalDate dtf = datefin.toLocalDate();
        try {
            List<Disponibilite> dispos = hdao.findAll(Disponibilite.class);
            while(dtd.isAfter(dtf) == false){
                for(Plateau p: distinctP){
                    for(Disponibilite d: dispos){
                        if(Date.valueOf(dtd).equals(d.getDateprevue()) == false || p.getId() == d.getPlateau().getId()){
                            Dispo dispo = new Dispo(p,Date.valueOf(dtd));
                            dispoList.add(dispo);
                        }
                    }
                }
                dtd = dtd.plusDays(1);
            }
        } catch(Exception e){
            e.printStackTrace();
        }*/


        Plateau p1 = hdao.findById(Plateau.class,Long.parseLong("1"));
        Plateau p2 = hdao.findById(Plateau.class,Long.parseLong("2"));
        Plateau p3 = hdao.findById(Plateau.class,Long.parseLong("3"));
        List<Plateau> distinctP1 = new ArrayList<>();
        List<Plateau> distinctP2 = new ArrayList<>();

        List<Scene> listp1 = hdao.findAllById(Scene.class,p1.getId(),"idplateau");
        List<Scene> listp2 = hdao.findAllById(Scene.class,p2.getId(),"idplateau");
        List<Scene> listp3 = hdao.findAllById(Scene.class,p3.getId(),"idplateau");
        List<Scene> listS = new ArrayList<>();

        for(Scene s1:listp1){
            if(s1.getFilm().getId() == idfilm){
                listS.add(s1);
            }
        }
        for(Scene s2:listp2){
            if(s2.getFilm().getId() == idfilm){
                listS.add(s2);
            }
        }
        for(Scene s3:listp3){
            if(s3.getFilm().getId() == idfilm){
                listS.add(s3);
            }
        }

        distinctP1.add(p1);
        distinctP1.add(p2);
        distinctP2.add(p3);

        List<Planning> listP = new ArrayList<>();
        Planning pl1 = new Planning();
        pl1.setDate(datedebut);
        pl1.setList(distinctP1);
        Planning pl2 = new Planning();
        pl2.setDate(Date.valueOf(datedebut.toLocalDate().plusDays(1)));
        pl2.setList(distinctP2);

        listP.add(pl1);
        listP.add(pl2);

        /*for(Planning planning: listP){
            //System.out.println(planning.getDate()+" - "+planning.getList().size());
            for(Plateau p:planning.getList()){
                planning = hdao.createPlanning(planning);
            }
            planning = hdao.create(planning);
        }*/

        model.addAttribute("scenes",listS);
        model.addAttribute("list",listP);
        return "plannedschedule";
    }

    @GetMapping(path = "/ajaxtrial")
    public String ajaxtrial(Model model){
        List<Film> list = null;
        try {
            list = hdao.findAll(Film.class);
            model.addAttribute("list",list);
        } catch(Exception e){
            e.printStackTrace();
        }
        return "ajaxtrial";
    }
}
