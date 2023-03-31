insert into acteur(nom,prenom,datenaissance,sexe) values
    ('Robert','Downey JR','1963-02-01','homme'),
    ('Chris','Evans','1978-09-01','homme'),
    ('Scarlett','Johanson','1977-03-03','femme'),
    ('Mark','Ruffalo','1972-04-28','homme'),
    ('Tom','Holland','1997-10-12','homme'),
    ('Marisa','Tomei','1969-06-23','femme'),
    ('Tobey','McGuire','1975-03-01','homme'),
    ('Andrew','Garfield','1985-11-07','homme'),
    ('Emma','Stone','1987-01-14','femme');

insert into film(nomfilm,production,datesortie,duree,logo,synopsis,realisateur,genre,affiche) values
    ('Avengers','USA','2012-06-03','01:45:00','assets/images/avengers.png','Lorsque Nick Fury, le directeur du S.H.I.E.L.D., l organisation qui preserve la paix au plan mondial, cherche à former une equipe de choc pour empecher la destruction du monde, Iron Man, Hulk, Thor, Captain America, Hawkeye et Black Widow repondent presents.Les Avengers ont beau constituer la plus fantastique des equipes, il leur reste encore à apprendre à travailler ensemble, et non les uns contre les autres, d autant que le redoutable Loki a reussi à acceder au Cube Cosmique et à son pouvoir illimite...','Joss Whedon','Action, Aventure, Science-fiction','assets/images/avengers.jpg'),
    ('Spiderman No Way Home','USA','2021-12-17','02:35:00','assets/images/nowayhome.png','Apres les evenements lies à l affrontement avec Mysterio1, l identite secrete de Spider-Man a ete revelee au monde entier. Il est poursuivi par le gouvernement americain, qui l accuse du meurtre de Mysterio, et est traque par les medias. Cet evenement a egalement des consequences terribles sur la vie de sa petite amie M. J. (Michelle Jones-Watson) et de son meilleur ami Ned. Desempare, Peter Parker demande alors de l aide au Docteur Strange. Ce dernier lance un sort pour que tout le monde oublie que Peter est Spider-Man. Mais les choses ne se passent pas comme prevu et cette action altere la stabilite de l espace-temps. Cela ouvre le « Multivers », un concept terrifiant dont ils ne savent quasiment rien. Il menera le combat de sa vie contre les redoutables super-vilains qui vont apparaître : le Bouffon vert, le Docteur Octopus, l Homme-sable qui sont du meme univers alternatif. Mais ce n est pas tout : encore deux autres adversaires qui viennent dans une autre realite differente vont aussi se manifester : le Lezard et Electro dans une grande bataille epique.','Jon Watts','Action, Aventure, Fantastique','assets/images/nowayhome.jpg'),
    ('Spiderman Homecoming','USA','2017-09-03','02:00:00','assets/images/homecoming.png','Apres ses spectaculaires debuts dans Captain America : Civil War, le jeune Peter Parker decouvre peu à peu sa nouvelle identite, celle de Spider-Man, le super-heros lanceur de toile. Galvanise par son experience avec les Avengers, Peter rentre chez lui aupres de sa tante May, sous l œil attentif de son nouveau mentor, Tony Stark. Il s efforce de reprendre sa vie d avant, mais au fond de lui, Peter reve de se prouver qu il est plus que le sympathique super heros du quartier. L apparition d un nouvel ennemi, le Vautour, va mettre en danger tout ce qui compte pour lui...','Jon Watts','Action, Aventure','assets/images/homecoming.jpg'),
    ('Avengers Infiniti War','USA','2018-06-17','02:15:00','assets/images/infinitiwar.png','Pere adoptif de Gamora et Nebula, Thanos a commence à recueillir les six Pierres d Anfinite : la Pierre du Pouvoir, la Pierre de l Aspace, la Pierre de Realite, la Pierre de l Ame, la Pierre du Temps et la Pierre de l Asprit. Son objectif est de reunir ces six gemmes sur un gantelet dore, forge par le nain Eitri sur Nidavellir, afin d Atiliser leur immense puissance pour detruire la moitie de la population de l Anivers et retablir ainsi un certain equilibre. Dans sa quete le menant sur diverses planetes, la Terre, Knowhere et Vormir, Thanos est aide par ses enfants adoptifs : Ebony Maw, Cull Obsidian, Corvus Glaive et Proxima Midnight. Face à cette nouvelle menace qui concerne l Anivers entier, le groupe de super-heros des Avengers, divise depuis 2 ans, doit se reformer, et s Associer au Docteur Strange, aux Gardiens de la Galaxie et au peuple du Wakanda.','Joe Russo, Anthony Russo','Action, Aventure, Fantastique','assets/images/infinitiwar.jpg'),
    ('Avengers Endgame','USA','2019-07-12','02:30:00','assets/images/endgame.png','Thanos ayant aneanti la moitie de l univers, les Avengers restants resserrent les rangs dans ce vingt-deuxieme film des Studios Marvel, grande conclusion d un des chapitres de l Univers Cinematographique Marvel.','Joe Russo, Anthony Russo','Action, Aventure, Fantastique','assets/images/endgame.jpg');


insert into plateau(nomplateau,lieu) values
    ('Plateau1','Lieu1'),
    ('Plateau2','Lieu2'),
    ('Plateau3','Lieu3'),
    ('Plateau4','Lieu4'),
    ('Plateau5','Lieu5'),
    ('Plateau6','Lieu6'),
    ('Plateau7','Lieu7');


insert into scene (scenelabel, duree, etat, ordre, auteur, idfilm, idplateau) values
    ('scene1', 15, 20, 1, 'auteur1', 1, 1),
    ('scene2', 10, 20, 2, 'auteur1', 1, 2),
    ('scene3', 20, 20, 3, 'auteur2', 1, 2),
    ('scene4', 5, 20, 4, 'auteur1', 1, 3),
    ('scene5', 12, 20, 5, 'auteur2', 1, 1),
    ('scene1', 15, 20, 1, 'auteur3', 2, 1),
    ('scene2', 10, 20, 2, 'auteur3', 2, 2),
    ('scene3', 20, 20, 3, 'auteur4', 2, 2),
    ('scene4', 5, 20, 4, 'auteur3', 2, 3),
    ('scene5', 12, 20, 5, 'auteur4', 2, 1)
;

insert into acteurscene values
    (1, 1),
    (2, 1),
    (1, 2),
    (3, 2),
    (4, 2),
    (1, 3),
    (2, 3),
    (4, 3),
    (4, 4),
    (2, 5),
    (5, 5)
;

insert into disponibilitep (idplateau, dateprevue) values 
    (1, '2023-03-29'),
    (3, '2023-03-28')
;

insert into planning(dateplanned,idplateau) values
    ('2023-03-28',1),
    ('2023-03-28',2),
    ('2023-03-29',3);