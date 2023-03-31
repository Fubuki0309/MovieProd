CREATE SEQUENCE "public".idacteur START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".iddisponibilitea START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".iddisponibilitep START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".idfilm START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".idplanning START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".idplateau START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".idscene START WITH 1 INCREMENT BY 1;

CREATE  TABLE "public".acteur ( 
	id                   integer DEFAULT nextval('idacteur'::regclass) NOT NULL  ,
	nom                  varchar(50)  NOT NULL  ,
	prenom               varchar(50)  NOT NULL  ,
	datenaissance        date  NOT NULL  ,
	sexe                 varchar(5)  NOT NULL  ,
	CONSTRAINT pk_acteur PRIMARY KEY ( id )
 );

CREATE  TABLE "public".film ( 
	id                   integer DEFAULT nextval('idfilm'::regclass) NOT NULL  ,
	nomfilm              varchar(100)  NOT NULL  ,
	production           varchar(50)  NOT NULL  ,
	datesortie           date  NOT NULL  ,
	duree                time  NOT NULL  ,
	logo                 varchar(200)    ,
	synopsis             text  NOT NULL  ,
	realisateur          varchar(100)  NOT NULL  ,
	genre                varchar(250)  NOT NULL  ,
	affiche              varchar(200)    ,
	CONSTRAINT pk_film PRIMARY KEY ( id )
 );

CREATE  TABLE "public".plateau ( 
	id                   integer DEFAULT nextval('idplateau'::regclass) NOT NULL  ,
	nomplateau           varchar(50)  NOT NULL  ,
	lieu                 varchar(50)  NOT NULL  ,
	CONSTRAINT pk_plateau PRIMARY KEY ( id )
 );

CREATE  TABLE "public".scene ( 
	id                   integer DEFAULT nextval('idscene'::regclass) NOT NULL  ,
	scenelabel           varchar(50)  NOT NULL  ,
	duree                integer  NOT NULL  ,
	etat                 integer DEFAULT 0 NOT NULL  ,
	ordre                integer  NOT NULL  ,
	auteur               varchar(50)  NOT NULL  ,
	idfilm               integer  NOT NULL  ,
	idplateau            integer  NOT NULL  ,
	CONSTRAINT pk_scene PRIMARY KEY ( id )
 );

CREATE  TABLE "public".acteurscene ( 
	idacteur             integer  NOT NULL  ,
	idscene              integer  NOT NULL  
 );

CREATE  TABLE "public".disponibilitea ( 
	id                   integer DEFAULT nextval('iddisponibilitea'::regclass) NOT NULL  ,
	idacteur             integer  NOT NULL  ,
	dateprevue           date  NOT NULL  ,
	observation          text    ,
	CONSTRAINT pk_disponibilitea PRIMARY KEY ( id )
 );

CREATE  TABLE "public".disponibilitep ( 
	id                   integer DEFAULT nextval('iddisponibilitep'::regclass) NOT NULL  ,
	idplateau            integer  NOT NULL  ,
	dateprevue           date  NOT NULL  ,
	observation          text    ,
	CONSTRAINT pk_disponibilitep PRIMARY KEY ( id )
 );

CREATE  TABLE "public".planning ( 
	id                   integer DEFAULT nextval('idplanning'::regclass) NOT NULL  ,
	dateplanned          date  NOT NULL  ,
	idplateau            integer  NOT NULL  ,
	CONSTRAINT pk_planning PRIMARY KEY ( id )
 );

ALTER TABLE "public".acteurscene ADD CONSTRAINT fk_acteurscene_acteur FOREIGN KEY ( idacteur ) REFERENCES "public".acteur( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public".acteurscene ADD CONSTRAINT fk_acteurscene_scene FOREIGN KEY ( idscene ) REFERENCES "public".scene( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public".disponibilitea ADD CONSTRAINT fk_disponibilitea_plateau FOREIGN KEY ( idacteur ) REFERENCES "public".plateau( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public".disponibilitep ADD CONSTRAINT fk_disponibilitep_plateau FOREIGN KEY ( idplateau ) REFERENCES "public".plateau( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public".planning ADD CONSTRAINT fk_planning_plateau FOREIGN KEY ( idplateau ) REFERENCES "public".plateau( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public".scene ADD CONSTRAINT fk_scene_film FOREIGN KEY ( idfilm ) REFERENCES "public".film( id ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE "public".scene ADD CONSTRAINT fk_scene_plateau FOREIGN KEY ( idplateau ) REFERENCES "public".plateau( id ) ON DELETE CASCADE ON UPDATE CASCADE;

COMMENT ON COLUMN "public".scene.etat IS '00 - cr‚‚e\n10 - en cours d''‚criture\n20 - ‚criture termin‚e\n30 - plannifi‚e\n40 - tourn‚e\n50 - mont‚e';
