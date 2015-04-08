/* ****************** CREACIO DE TAULES ******************* */

CREATE TABLE clients
	(
	DNI_cli		VARCHAR2(9),
	Nom_cli		VARCHAR2(20),
	Cog1_cli		VARCHAR2(20),
	Cog2_cli		VARCHAR2(20),
	Tel_cli			NUMBER(9),
	Nom_empresa_cli	VARCHAR2(30),
	Adreca_cli		VARCHAR2(30),
	CP_cli			NUMBER(5),
	Nom_pob		VARCHAR2(30),
	CONSTRAINT cli_DNI_pk PRIMARY KEY (DNI_cli)
	);

CREATE TABLE articles
	(
	ID_art			NUMBER(8),
	Desc_art		LONG NOT NULL,
	Preu_compra_art	NUMBER(8,2),
	Preu_venda_art	NUMBER(8,2),
	ID_cat			NUMBER(3),
	ID_com		NUMBER(8),
	ID_ven			NUMBER(8),
	ID_bot			NUMBER(3),
	ID_res			NUMBER(8),
	CONSTRAINT art_ID_pk PRIMARY KEY (ID_art)
	);

CREATE TABLE categories
	(
	ID_cat			NUMBER(3),
	Nom_cat		VARCHAR2(20) NOT NULL,
	CONSTRAINT cat_ID_pk PRIMARY KEY (ID_cat),
	CONSTRAINT cat_Nom_uk UNIQUE (Nom_cat)
	);

CREATE TABLE empleats
	(
	DNI_emp		VARCHAR2(9),
	Nom_emp		VARCHAR2(20) NOT NULL,
	Cog1_emp		VARCHAR2(20) NOT NULL,
	Cog2_emp		VARCHAR2(20) NOT NULL,
	Tel_emp		NUMBER(9) NOT NULL,
	Adreca_emp		VARCHAR2(30),
	CP_emp		NUMBER(5),
	DNI_encarregat_emp	VARCHAR2(9),
	CONSTRAINT emp_DNI_pk PRIMARY KEY (DNI_emp)
	);

CREATE TABLE compres
	(
	ID_com		NUMBER(8),
	Data_com		DATE NOT NULL,
	ID_pag			NUMBER(8),
	DNI_cli		VARCHAR2(9),
	DNI_emp		VARCHAR2(9),
	ID_bot			NUMBER(3),
	CONSTRAINT com_ID_pk PRIMARY KEY (ID_com)
	);

CREATE TABLE vendes
	(
	ID_ven			NUMBER(8),
	Data_ven		DATE NOT NULL,
	ID_pag			NUMBER(8),
	DNI_cli		VARCHAR2(9),
	DNI_emp		VARCHAR2(9),
	ID_iva			NUMBER(2),
	ID_bot			NUMBER(3),
	CONSTRAINT ven_ID_pk PRIMARY KEY (ID_ven)
	);
	
CREATE TABLE tipus_pagament
	(
	ID_pag			NUMBER(1),
	Desc_pag		VARCHAR2(10) NOT NULL,
	CONSTRAINT pag_ID_pk PRIMARY KEY (ID_pag),
	CONSTRAINT pag_Desc_uk UNIQUE (Desc_pag)
	);

CREATE TABLE iva
	(
	ID_iva			NUMBER(2),
	Tipus_iva		VARCHAR2(20) NOT NULL,
	Percentatge_iva	NUMBER(2) NOT NULL,
	CONSTRAINT iva_ID_pk PRIMARY KEY (ID_iva)
	);

CREATE TABLE reserves
	(
	ID_res			NUMBER(8),
	Mail_usu		VARCHAR2(30),
	ID_est			NUMBER(1),
	ID_bot			NUMBER(3),
	CONSTRAINT res_ID_pk PRIMARY KEY (ID_res)
	);

CREATE TABLE estats
	(
	ID_est		NUMBER(1),
	Nom_est	VARCHAR2(25) NOT NULL,
	CONSTRAINT est_ID_pk PRIMARY KEY (ID_est),
	CONSTRAINT est_Nom_uk UNIQUE (Nom_est)
	);

CREATE TABLE provincies
	(
	Nom_pro	VARCHAR2(20),
	CONSTRAINT pro_Nom_pk PRIMARY KEY (Nom_pro)
	);

CREATE TABLE poblacions
	(
	Nom_pob	VARCHAR2(20),
	Nom_pro	VARCHAR2(20),
	CONSTRAINT pob_Nom_pk PRIMARY KEY (Nom_pob)
	);

CREATE TABLE botigues
	(
	ID_bot		NUMBER(3),
	CP_bot	NUMBER(5) NOT NULL,
	Adreca_bot	VARCHAR2(30) NOT NULL,
	Nom_pob	VARCHAR2(20) NOT NULL,
	CONSTRAINT bot_ID_pk PRIMARY KEY (ID_bot)
	);

CREATE TABLE usuaris_online
	(
	Mail_usu	VARCHAR2(30),
	Nom_usu	VARCHAR2(20) NOT NULL,
	Cog1_usu	VARCHAR2(20) NOT NULL,
	Cog2_usu	VARCHAR2(20) NOT NULL,
	DNI_usu	VARCHAR2(9) NOT NULL,
	Tel_usu	NUMBER(9) NOT NULL,
	Pass_usu	VARCHAR2(64) NOT NULL,
	CONSTRAINT usu_Mail_pk PRIMARY KEY (Mail_usu)
	);

CREATE TABLE direccions_online
	(
	Mail_usu	VARCHAR2(30),
	Nom_pob	VARCHAR2(20),
	Cp_dir		NUMBER(5) NOT NULL, 
	Adreca_dir	VARCHAR2(30) NOT NULL,
	ID_dir		NUMBER(8) NOT NULL,
	CONSTRAINT dir_pk PRIMARY KEY (Mail_usu, Nom_pob),
	CONSTRAINT dir_ID_uk UNIQUE (ID_dir)
	);

CREATE TABLE vendes_online
	(
	ID_veo		NUMBER(8),
	tracking_veo	VARCHAR2(20),
	ID_Ven		NUMBER(8),
	ID_est		NUMBER(1),
	Mail_usu	VARCHAR2(30),
ID_dir		NUMBER(8) NOT NULL,
	CONSTRAINT veo_ID_pk PRIMARY KEY (ID_veo)
	);


/* ****************** CREACIO DE SEQUENCIES ******************* */

CREATE SEQUENCE ID_art
INCREMENT BY 1
START WITH 10000000
MAXVALUE 29999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE ID_com
INCREMENT BY 1
START WITH 30000000
MAXVALUE 49999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE ID_ven
INCREMENT BY 1
START WITH 50000000
MAXVALUE 69999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE ID_res
INCREMENT BY 1
START WITH 70000000
MAXVALUE 79999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE ID_veo
INCREMENT BY 1
START WITH 80000000
MAXVALUE 89999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE ID_dir
INCREMENT BY 1
START WITH 90000000
MAXVALUE 99999999
NOCACHE
NOCYCLE;

CREATE INDEX clients_index
ON clients(Cog1_cli);


/* ****************** INSERCIO DE DADES ******************* */

INSERT INTO clients (DNI_cli,Nom_cli,Cog1_cli,Cog2_cli,Tel_cli,Nom_empresa_cli,Adreca_cli,CP_cli,Nom_pob) VALUES ('40373138L','Jordi','Reixach','Casadevall','972207716','','Camp dor 32','17007','Girona');
INSERT INTO clients (DNI_cli,Nom_cli,Cog1_cli,Cog2_cli,Tel_cli,Nom_empresa_cli,Adreca_cli,CP_cli,Nom_pob) VALUES ('00000000A','Aleix','Ayme','Jugon','978654654','','Carrer de la muntanya','17007','Girona');
INSERT INTO clients (DNI_cli,Nom_cli,Cog1_cli,Cog2_cli,Tel_cli,Nom_empresa_cli,Adreca_cli,CP_cli,Nom_pob) VALUES ('A00000000','','','','972519877','Construccions gimenez','Carrer de la muralla 12','17920','Banyoles');
INSERT INTO clients (DNI_cli,Nom_cli,Cog1_cli,Cog2_cli,Tel_cli,Nom_empresa_cli,Adreca_cli,CP_cli,Nom_pob) VALUES ('11111111B','Joan','Coll','Riera','972504965','','Carrer de la pujada','17007','Girona');
INSERT INTO clients (DNI_cli,Nom_cli,Cog1_cli,Cog2_cli,Tel_cli,Nom_empresa_cli,Adreca_cli,CP_cli,Nom_pob) VALUES ('B11111111','','','','972486512','Fustes Sils','Carrer sense nom 15','17402','Sils');
INSERT INTO articles (ID_art,Desc_art,Preu_compra_art,Preu_venda_art,ID_cat,ID_com,ID_ven,ID_bot,ID_res) VALUES (ID_art.NEXTVAL,'Estufa de bany','6.00','18.00','1','30000000','50000000','1','');
INSERT INTO articles (ID_art,Desc_art,Preu_compra_art,Preu_venda_art,ID_cat,ID_com,ID_ven,ID_bot,ID_res) VALUES (ID_art.NEXTVAL,'Mobil lliure Doogee DG550','15.00','160.00','4','30000001','50000000','1','70000000');
INSERT INTO articles (ID_art,Desc_art,Preu_compra_art,Preu_venda_art,ID_cat,ID_com,ID_ven,ID_bot,ID_res) VALUES (ID_art.NEXTVAL,'Funda mobil lliure Doogee DG550','0.50','3.00','4','30000001','50000000','1','70000000');
INSERT INTO articles (ID_art,Desc_art,Preu_compra_art,Preu_venda_art,ID_cat,ID_com,ID_ven,ID_bot,ID_res) VALUES (ID_art.NEXTVAL,'Playstation 3 Fat 60GB','60.00','130.00','3','30000002','','1','');
INSERT INTO articles (ID_art,Desc_art,Preu_compra_art,Preu_venda_art,ID_cat,ID_com,ID_ven,ID_bot,ID_res) VALUES (ID_art.NEXTVAL,'Call Of Duty 4 Modern Warfare','5.00','15.00','3','30000002','50000001','1','');
INSERT INTO categories (ID_cat,Nom_cat) VALUES ('1','Electrodomestics');
INSERT INTO categories (ID_cat,Nom_cat) VALUES ('2','Informatica');
INSERT INTO categories (ID_cat,Nom_cat) VALUES ('3','Videojocs');
INSERT INTO categories (ID_cat,Nom_cat) VALUES ('4','Telefonia i mobils');
INSERT INTO empleats (DNI_emp,Nom_emp,Cog1_emp,Cog2_emp,Tel_emp,Adreca_emp,CP_emp,DNI_encarregat_emp) VALUES ('22222222A','Jefe','Supremo','OfTheUniverse','616459845','Carrer vilafranc','17007','');
INSERT INTO empleats (DNI_emp,Nom_emp,Cog1_emp,Cog2_emp,Tel_emp,Adreca_emp,CP_emp,DNI_encarregat_emp) VALUES ('40373138L','Jordi','Reixach','Casadevall','633549945','Camp dor 32','17007','22222222A');
INSERT INTO compres (ID_com,Data_com,ID_pag,DNI_cli,DNI_emp,ID_bot) VALUES (ID_com.NEXTVAL,TO_DATE('FEB 3,2015', 'MON DD, YYYY'),'2','00000000A','40373138L','1');
INSERT INTO compres (ID_com,Data_com,ID_pag,DNI_cli,DNI_emp,ID_bot) VALUES (ID_com.NEXTVAL,TO_DATE('FEB 5,2015', 'MON DD, YYYY'),'2','11111111B','40373138L','1');
INSERT INTO compres (ID_com,Data_com,ID_pag,DNI_cli,DNI_emp,ID_bot) VALUES (ID_com.NEXTVAL,TO_DATE('FEB 7,2015', 'MON DD, YYYY'),'2','A00000000','40373138L','1');
INSERT INTO vendes (ID_ven,Data_ven,ID_pag,DNI_cli,DNI_emp,ID_iva,ID_bot) VALUES (ID_ven.NEXTVAL,TO_DATE('FEB 8,2015', 'MON DD, YYYY'),'2','B11111111','40373138L','1','1');
INSERT INTO vendes (ID_ven,Data_ven,ID_pag,DNI_cli,DNI_emp,ID_iva,ID_bot) VALUES (ID_ven.NEXTVAL,TO_DATE('FEB 12,2015', 'MON DD, YYYY'),'1','','40373138L','1','1');
INSERT INTO tipus_pagament (ID_pag,Desc_pag) VALUES ('1','Tarjeta');
INSERT INTO tipus_pagament (ID_pag,Desc_pag) VALUES ('2','Efectiu');
INSERT INTO iva (ID_iva,Tipus_iva,Percentatge_iva) VALUES ('1','General','21');
INSERT INTO reserves (ID_res,ID_est,ID_bot,Mail_usu) VALUES (ID_res.NEXTVAL,'4','1','reixacu@gmail.com');
INSERT INTO estats (ID_est,Nom_est) VALUES ('1','Pendent de pagament');
INSERT INTO estats (ID_est,Nom_est) VALUES ('2','Pendent denviament');
INSERT INTO estats (ID_est,Nom_est) VALUES ('3','Enviat');
INSERT INTO estats (ID_est,Nom_est) VALUES ('4','Rebut');
INSERT INTO estats (ID_est,Nom_est) VALUES ('5','Annulat');
INSERT INTO estats (ID_est,Nom_est) VALUES ('6','Incidencia');
INSERT INTO estats (ID_est,Nom_est) VALUES ('7','En preparacio');
INSERT INTO estats (ID_est,Nom_est) VALUES ('8','Llest per ser recollit');
INSERT INTO provincies (Nom_pro) VALUES ('Girona');
INSERT INTO provincies (Nom_pro) VALUES ('Barcelona');
INSERT INTO provincies (Nom_pro) VALUES ('Lleida');
INSERT INTO provincies (Nom_pro) VALUES ('Tarragona');
INSERT INTO poblacions (Nom_pob,Nom_pro) VALUES ('Girona','Girona');
INSERT INTO poblacions (Nom_pob,Nom_pro) VALUES ('Sils','Girona');
INSERT INTO poblacions (Nom_pob,Nom_pro) VALUES ('Banyoles','Girona');
INSERT INTO botigues (ID_bot,Nom_pob,CP_bot,Adreca_bot) VALUES ('1','Girona','17004','Carretera Barcelona 99');
INSERT INTO usuaris_online (Mail_usu,Nom_usu,Cog1_usu,Cog2_usu,DNI_usu,Tel_usu,Pass_usu) VALUES ('reixacu@gmail.com','Aleix','Aymerich','Ayme','00000000A','654324851','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855');
INSERT INTO direccions_online (Mail_usu,Nom_pob,Cp_dir,Adreca_dir,ID_dir) VALUES ('reixacu@gmail.com','Girona','17007','Camp dor 32',ID_dir.NEXTVAL);
INSERT INTO vendes_online (ID_veo,tracking_veo,ID_ven,ID_est,Mail_usu,ID_dir) VALUES (ID_veo.NEXTVAL,'','50000001','2','reixacu@gmail.com','90000000');


/* ****************** CREACIO DE CLAUS FORANES ******************* */

ALTER TABLE clients
ADD CONSTRAINT cli_Nom_pob_fk
FOREIGN KEY(Nom_pob) REFERENCES poblacions(Nom_pob);

ALTER TABLE articles
ADD CONSTRAINT art_ID_cat_fk
FOREIGN KEY(ID_cat) REFERENCES categories(ID_cat);

ALTER TABLE articles
ADD CONSTRAINT art_ID_com_fk
FOREIGN KEY(ID_com) REFERENCES compres(ID_com);

ALTER TABLE articles
ADD CONSTRAINT art_ID_ven_fk
FOREIGN KEY(ID_ven) REFERENCES vendes(ID_ven);

ALTER TABLE articles
ADD CONSTRAINT art_ID_bot_fk
FOREIGN KEY(ID_bot) REFERENCES botigues(ID_bot);

ALTER TABLE articles
ADD CONSTRAINT art_ID_res_fk
FOREIGN KEY(ID_res) REFERENCES reserves(ID_res);

ALTER TABLE empleats
ADD CONSTRAINT emp_DNI_encarregat_emp_fk
FOREIGN KEY(DNI_encarregat_emp) REFERENCES empleats(DNI_emp);

ALTER TABLE compres
ADD CONSTRAINT com_ID_pag_fk
FOREIGN KEY(ID_pag) REFERENCES tipus_pagament(ID_pag);

ALTER TABLE compres
ADD CONSTRAINT com_DNI_cli_fk
FOREIGN KEY(DNI_cli) REFERENCES clients(DNI_cli);

ALTER TABLE empleats
ADD CONSTRAINT com_DNI_emp_fk
FOREIGN KEY(DNI_emp) REFERENCES empleats(DNI_emp);

ALTER TABLE compres
ADD CONSTRAINT com_ID_bot_fk
FOREIGN KEY(ID_bot) REFERENCES botigues(ID_bot);

ALTER TABLE vendes
ADD CONSTRAINT ven_ID_pag_fk
FOREIGN KEY(ID_pag) REFERENCES tipus_pagament(ID_pag);

ALTER TABLE vendes
ADD CONSTRAINT ven_DNI_cli_fk
FOREIGN KEY(DNI_cli) REFERENCES clients(DNI_cli);

ALTER TABLE vendes
ADD CONSTRAINT ven_DNI_emp_fk
FOREIGN KEY(DNI_emp) REFERENCES empleats(DNI_emp);

ALTER TABLE vendes
ADD CONSTRAINT ven_ID_iva_fk
FOREIGN KEY(ID_iva) REFERENCES iva(ID_iva);
ALTER TABLE vendes
ADD CONSTRAINT ven_ID_bot_fk
FOREIGN KEY(ID_bot) REFERENCES botigues(ID_bot);

ALTER TABLE reserves
ADD CONSTRAINT res_ID_est_fk
FOREIGN KEY(ID_est) REFERENCES estats(ID_est);

ALTER TABLE reserves
ADD CONSTRAINT res_ID_bot_fk
FOREIGN KEY(ID_bot) REFERENCES botigues(ID_bot);

ALTER TABLE reserves
ADD CONSTRAINT res_Mail_usu_fk
FOREIGN KEY(Mail_usu) REFERENCES usuaris_online(Mail_usu);

ALTER TABLE poblacions
ADD CONSTRAINT pob_Nom_pro_fk
FOREIGN KEY(Nom_pro) REFERENCES provincies(Nom_pro);

ALTER TABLE botigues
ADD CONSTRAINT bot_Nom_pob_fk
FOREIGN KEY(Nom_pob) REFERENCES poblacions(Nom_pob);

ALTER TABLE direccions_online
ADD CONSTRAINT dir_Mail_usu_fk
FOREIGN KEY(Mail_usu) REFERENCES usuaris_online(Mail_usu);

ALTER TABLE direccions_online
ADD CONSTRAINT dir_Nom_pob_fk
FOREIGN KEY(Nom_pob) REFERENCES poblacions(Nom_pob);

ALTER TABLE vendes_online
ADD CONSTRAINT veo_ID_ven_fk
FOREIGN KEY(ID_ven) REFERENCES vendes(ID_ven);

ALTER TABLE vendes_online
ADD CONSTRAINT veo_ID_est_fk
FOREIGN KEY(ID_est) REFERENCES estats(ID_est);

ALTER TABLE vendes_online
ADD CONSTRAINT veo_Mail_usu_fk
FOREIGN KEY(Mail_usu) REFERENCES usuaris_online(Mail_usu);

ALTER TABLE vendes_online
ADD CONSTRAINT veo_ID_dir_fk
FOREIGN KEY(ID_dir) REFERENCES direccions_online(ID_dir);