--gestiunea bibloteaca scolara

drop table if exists  Apartine
drop table if exists  Scrisa
drop table if exists  Imprumut
drop table if exists  Angajat
drop table if exists  Domeniu
drop table if exists  FisaDeLectura
drop table if exists  Carte
drop table if exists  Autor
drop table if exists  Legitimatie
drop table if exists  Elev
drop table if exists  Biblioteca
drop SEQUENCE if exists SECV_ORAS
drop table if exists  Oras 
drop table if exists  Editura


--CREARE SI INSERARE IN TABELA AUTOR + CONSTRANGERI

create table Autor(
    id_autor              int identity(1,1)         not null,
    nume                     varchar(55)            not null,
    prenume                  varchar(55)            not null,
    constraint PK_Autor  primary key (id_autor)
); 

INSERT INTO Autor VALUES
    ('Armentrout','Jennifer'),  
    ('Morgan','Richard'),
    ('Eminescu','Mihai'),
    ('Kinney','Jeff'),  
    ('Twain','Mark'),  
    ('Petrescu','Cezar'),
    ('Ahern','Cecilia');


--CREARE SI INSERARE IN TABELA EDITURA + CONSTRANGERI

create table Editura(
    id_editura    int identity(1,1)        not null    primary key,
    nume            varchar(55)            not null,
    adresa          varchar(100),
    email           varchar(55)
); 

INSERT INTO Editura(nume,adresa,email)
VALUES
    ('Leda', 'Strada Mihai Eminescu Nr. 54A, Bucuresti 030167' ,'leda@ledascholars.org.'), 
    ('Leda Edge', 'Strada Mihai Eminescu Nr. 54A, Bucuresti 030167','leda@ledascholars.org.' ), 
    ('Litera',  ' Strada Moeciu Nr. 7A, Bucuresti 077190','contact@litera.ro'), 
    ('Paladin', 'Soseaua Unirii 216, Comuna Corbeanca', 'comenzi@editura-art.ro'), 
    ('Hodder & Stoughton General Division', null,'hukdcustomerservices@hachette.co.uk' ),
    ('All', ' Bulevardul Constructorilor 20A, Bucuresti 260512','info@all.ro' ),
    ('Art', 'Splaiul Independentei, Bucuresti 060043','manuscris@editura-art.ro.' );


--CREARE SI INSERARE IN TABELA DOMENIU + CONSTRANGERI

CREATE TABLE Domeniu(
    id_domeniu  int identity(1,1)    constraint pk_Domeniu primary key,
    nume            varchar(30)        not null
);

INSERT INTO Domeniu VALUES
    ('Fictiune'),
    ('Adolescenti'),
    ('Stiintifico-fantastic'),
    ('Fantasy'),
    ('Mister'),
    ('Politiste'),
    ('Psihologice'),
    ('Filozofice'),
    ('Dezvoltare personala');


--CREARE SI INSERARE IN TABELA Oras + CONSTRANGERI

CREATE TABLE Oras(
    id_oras	    int identity	constraint pk_Oras primary key,
    nume        varchar(20)         not null,
);


CREATE SEQUENCE SECV_ORAS
As int
INCREMENT by 1
START WITH 1
MAXVALUE 500
NO CYCLE;

SET IDENTITY_INSERT Oras ON

INSERT INTO Oras(id_oras,nume) VALUES
    (NEXT VALUE FOR SECV_ORAS,'Bucuresti'),
    (NEXT VALUE FOR SECV_ORAS,'Iasi'),
    (NEXT VALUE FOR SECV_ORAS,'Pitesti'),
    (NEXT VALUE FOR SECV_ORAS,'Timisoara'),
    (NEXT VALUE FOR SECV_ORAS,'Cluj-Napoca'),
    (NEXT VALUE FOR SECV_ORAS,'Ploiesti');

SET IDENTITY_INSERT Oras OFF



--CREARE SI INSERARE IN TABELA Elev + CONSTRANGERI

CREATE TABLE Elev(      
    id_elev        int identity(1,1)         not null    primary key,
    nume             varchar(55)             not null,
    prenume          varchar(55)             not null, 
    adresa           varchar(100),
    email            varchar(55),
    telefon          varchar(11)
);


INSERT INTO Elev VALUES
    ('Stefan', 'Ovidiu', 'Calea Victoriei 63,Bucuresti', 'stefanovidiu@gmail.com', '0738586317'), 
    ('Ilie', 'Ovidiu', 'Strada Dristorului 10,Bucuresti', 'ilieovidiu@gmail.com', '0726081740'), 
    ('Popescu', 'Lucian', 'Strada Lipscani 43,Bucuresti', 'popesculucian@gmail.com', '0723735665'), 
    ('Ionescu', 'Bogdan', 'Soseaua Mihai Bravu 25,Bucuresti', 'ionescubogdan@gmail.com', '0723503235'), 
    ('Mihail', 'Dan', 'Strada Grigore Alexandrescu 7,Bucuresti', 'mihaildan@gmail.com', '0735518610'), 
    ('Popa', 'Alin', 'Strada Agricultori 21,Bucuresti', 'popaalin@gmail.com', '0742624114'), 
    ('Negoitescu', 'Alin', 'Calea Victoriei 63,Bucuresti', 'negoitescualin@gmail.com', '0700535017'), 
    ('Dumitrescu', 'Mircea', 'Str. Calea Vitan 55,Bucuresti', 'dumitrescumircea@gmail.com', '0778123420'), 
    ('Vlad', 'Lucian', 'Str. Calea Vitan 55,Bucuresti', 'vladlucian@gmail.com', '0708432251'), 
    ('Mocanu', 'Gheorghe', 'Calea Mosilor 13,Bucuresti', 'mocanugheorghe@gmail.com', '0716055030'), 
    ('Rusu', 'Mircea', 'Calea Mosilor 13,Bucuresti', 'rusumircea@gmail.com', '0776704550'), 
    ('Barbu', 'Mircea', 'Calea Aurel Vlaicu 15,Bucuresti', 'barbumircea@gmail.com', '0754885133'), 
    ('Dobre', 'Manuel', 'Str. Calea Vitan 55,Bucuresti', 'dobremanuel@gmail.com', '0735731517'), 
    ('Dinescu', 'Viorel', 'Soseaua Mihai Bravu 25,Bucuresti', 'dinescuviorel@gmail.com', '0731476668'), 
    ('Codreanu', 'Horia', 'Strada Berzei 2,Bucuresti', 'codreanuhoria@gmail.com', '0746327686'), 
    ('Draghici', 'Lucian', 'Strada Grigore Alexandrescu 7,Bucuresti', 'draghicilucian@gmail.com', '0727556710'), 
    ('Pop', 'Manuel', 'Calea Mosilor 13,Bucuresti', 'popmanuel@gmail.com', '0773263442'), 
    ('Nicolescu', 'Ovidiu', 'Strada Berzei 2,Bucuresti', 'nicolescuovidiu@gmail.com', '0706216628'), 
    ('Tudor', 'Horia', 'Calea Aurel Vlaicu 15,Bucuresti', 'tudorhoria@gmail.com', '0728563567'), 
    ('Marin', 'Manuel', 'Str. Calea Vitan 55,Bucuresti', 'marinmanuel@gmail.com', '0705142207'), 
    ('Tanase', 'Gabriel', 'Soseaua Oltenitei 12,Bucuresti', 'tanasegabriel@gmail.com', '0722812520');



--CREARE SI INSERARE IN TABELA CARTE + CONSTRANGERI

CREATE TABLE Carte(  
    id_carte                    int identity(1,1) constraint pk_Carte primary key,
    titlu                           varchar(1000)             not null,
    seria                           varchar(200),
    numar_volum                        float,
    pret                                float                 not null,
    limba                           varchar(200),
    numar_pagini                        int,
    ISBN                            varchar(21),
    id_editura                          int						not null, 
    constraint fk_Carte foreign key (id_editura) references Editura(id_editura)
 
);


INSERT INTO Carte VALUES
    ('Like the First Time', 'Origin ',0.5,42.50,'engleza',500, 9780487989169, 2), 
    ('The Darkest Star ', 'Origin ',1,50,'engleza',400, 9780262989169, 2), 
    ('The Burning Shadow ', 'Origin ',2,60.90,'engleza',300, 9780556989169, 2), 
    ('The Brightest Night ', 'Origin ',3,60,'engleza',450, 9780253989169, 2), 
    ('Daimon', ' Covenant',0.5,30.50,'engleza',100, 9780301989169, 5), 
    ('Half-Blood', ' Covenant',1,40.50,'engleza',200, 9780325989169, 5), 
    ('Pure', ' Covenant',2,45,'engleza',100, 9780562989169, 5), 
    ('Deity', ' Covenant',3,46,'engleza',130, 9780328989169, 5), 
    ('Elixir', ' Covenant',3.5,46.90,'engleza',300, 9780373989169, 5), 
    ('Apollyon', ' Covenant',4,50,'engleza',160, 9780397989169, 5), 
    ('The One & Only', ' Covenant',4.5,52.50,'engleza',100, 9780430989169, 5), 
    ('Sentinel', ' Covenant',5,60,'engleza',100, 9780424989169, 5), 
    ('Umbre', 'Lux',0.5,30,'romana',50, 9780328989169, 2), 
    ('Obsidian', 'Lux',1,30,'romana',100, 9780424989169, 1), 
    ('Onix', 'Lux',2,30,'romana',150, 9780547989169, 1), 
    ('Opal', 'Lux',3,30,'romana',150, 9780283989169, 1), 
    ('Origin', 'Lux',4,30,'romana',200, 9780571989169, 2), 
    ('Opozitie', 'Lux',5,30,'romana',250, 9780250989169, 2), 
    ('Carbon modificat ', null, null,29.30,'romana',500, 9780367989169, 4), 
    ('Portalul Ingerilor ', null, null,33.30,'romana',900, 9780553989169, 4),
    ('Poesii ', null, null,19.30,'romana',60, 9780367989169, 3),
    ('Jurnalul unui pusti#1', 'Jurnalul unui pusti', 1,19,'romana',50, 9780367987169, 7),
    ('Jurnalul unui pusti#2', 'Jurnalul unui pusti', 2,29,'romana',50, 9780367979169, 7),
    ('Print si cersetor', null, null,19.30,'romana',60, 9780367984169, 6),
    ('Fram ursul polar', null, null,19.30,'romana',120, 9780367489169, 6),
    ('Jocul trecutului', null, null,55.30,'romana',336, 9780567489169, 6);


--CREARE SI INSERARE IN TABELA BIBLIOTECA + CONSTRANGERI

CREATE TABLE Biblioteca(
    id_biblioteca  int identity(1,1) constraint pk_Biblioteca primary key,
    nume                varchar(200)     not null,
    adresa              varchar(60)     not null,
    id_oras             int             not null, 
    constraint fk_Biblioteca foreign key (id_oras) references Oras(id_oras),
);

INSERT INTO Biblioteca VALUES
    ('Biblioteca Liceului Teoretic „Al. I. Cuza”','Strada Ion Creanga 37, Iasi 700317',2),
    ('Biblioteca Liceului „Grigore Moisil” Timisoara', 'Strada Ghirlandei 4, Timisoara 300231',4),
    ('Biblioteca Liceului Teoretic „Ion Barbu”','Strada Transilvania 6, Pitesti',3),
    ('Biblioteca Colegiului National „Spiru Haret” din Bucuresti','Italiana 17, Bucuresti 021021',1),
    ('Biblioteca Liceului Teoretic „Avram Iancu” Cluj-Napoca','Strada Onisifor Ghibu 33, Cluj-Napoca 400394',5),
    ('Biblioteca Colegiului National „Ion Luca Caragiale” Ploiesti','Strada Gheorghe Doja 98, Ploiesti 100164',6);



--CREARE SI INSERARE IN TABELA APARTINE + CONSTRANGERI

CREATE TABLE Apartine(
    id_apartinere  int  identity(1,1) constraint pk_Apartinere primary key,
    id_carte        int,
    id_domeniu      int,
    constraint fk_apartine_domeniu foreign key (id_domeniu) references DOMENIU(id_domeniu),
    constraint fk_apartine_carte foreign key (id_carte) references CARTE(id_carte)
);

INSERT INTO Apartine VALUES
        (1,3),
        (2,3),
        (3,3),
        (4,3),
        (5,1),
        (6,1),
        (7,1),
        (8,1),
        (9,1),
        (10,1),
        (11,1),
        (12,1),
        (13,4),
        (15,4),
        (16,4),
        (17,4),
        (18,4),
        (19,5),
        (20,5),
        (19,3),
        (20,3),
        (19,1),
        (20,1),
        (21,2),
        (22,2),
        (23,2),
        (24,2),
        (25,2),
        (26,2),
        (1,1),
        (2,1),
        (3,1),
        (4,1),
        (22,1),
        (23,1);



--CREARE SI INSERARE IN TABELA SCRISA + CONSTRANGERI


create table Scrisa( 
       id_carte         int     not null references Carte(id_carte),
       id_autor         int     not null references Autor(id_autor),
       data_publicare   date,
       constraint PK_Scrisa primary key (id_carte, id_autor)
); 

INSERT INTO Scrisa VALUES
    (1,1,'2018-02-19'),
    (2,1,'2019-01-21'),
    (3,1,'2019-02-11'),
    (4,1,'2020-03-22'),
    (5,1,'2011-07-29'),
    (6,1,'2011-07-25'),
    (7,1,'2012-08-23'),
    (8,1,'2012-10-24'),
    (9,1,'2012-11-01'),
    (10,1,'2013-06-01'),
    (11,1,'2013-06-01'),
    (12,1,'2012-07-11'),
    (13,1,'2011-08-14'),
    (15,1,'2012-09-17'),
    (16,1,'2012-07-14'),
    (17,1,'2013-06-20'),
    (18,1,'2014-05-22'),
    (19,2,'2002-03-11'),
    (20,2,'2003-05-21'),
    (21,3,'1884-02-12'),
    (22,4,'2007-04-01'),
    (23,4,'2007-09-19'),
    (24,5,'1881-06-01'),
    (25,6,'1931-05-09'),
    (26,7,'2022-03-25');



--CREARE SI INSERARE IN TABELA Angajat + Constrangeri

CREATE TABLE Angajat(
    id_angajat      int identity(1,1)    constraint pk_Angajat primary key,
    nume            varchar(20)             not null,
    prenume         varchar(20)             not null,
    adresa          varchar(100),
    email           varchar(55),
    telefon         varchar(11),
    salariu             float,
    functie         varchar(30),
    data_angajarii      date,
    id_biblioteca       int                 not null,
    constraint fk_Angajat foreign key (id_biblioteca) references Biblioteca(id_biblioteca),
    constraint check_functie_angajat check (upper(functie) in ('MANAGER','BIBLIOTECAR','PAZNIC','INGRIJITOR','OPERATOR DE INTRODUCERE DATE'))
);

INSERT INTO Angajat VALUES 
    ('Lungu', 'Gabriel', 'Soseaua Mihai Bravu 25', 'lungugabriel@gmail.com', '0700235234', 6210, 'INGRIJITOR', '2018-07-07', 1), 
    ('Ilie', 'Constantin', 'Strada Agricultori 21', 'ilieconstantin@gmail.com', '0778061180', 8352, 'PAZNIC', '2019-04-24', 2), 
    ('Popescu', 'Constantin', 'Bulevardul Timisoara 8', 'popescuconstantin@gmail.com', '0756057671', 7444, 'BIBLIOTECAR', '2017-10-22', 2), 
    ('Ionescu', 'Adrian', 'Strada Berzei 2', 'ionescuadrian@gmail.com', '0710824566', 9095, 'INGRIJITOR', '2012-07-25', 1), 
    ('Mihail', 'Viorel', 'Strada Barbu Vacarescu 20', 'mihailviorel@gmail.com', '0736357704', 8739, 'OPERATOR DE INTRODUCERE DATE', '2019-04-03', 3), 
    ('Popa', 'Gabriel', 'Calea Victoriei 26', 'popagabriel@gmail.com', '0703144330', 2309, 'INGRIJITOR', '2012-07-12', 4), 
    ('Negoitescu', 'Constantin', 'Calea Victoriei 63', 'negoitescuconstantin@gmail.com', '0734024300', 8960, 'PAZNIC', '2019-06-12', 4), 
    ('Dumitrescu', 'Bogdan', 'Calea Victoriei 63', 'dumitrescubogdan@gmail.com', '0777005444', 9040, 'PAZNIC', '2016-12-24', 4), 
    ('Vlad', 'Marius', 'Strada Dimitrie Bolintineanu 9', 'vladmarius@gmail.com', '0740775375', 5044, 'INGRIJITOR', '2013-01-11', 2), 
    ('Mocanu', 'Horia', 'Strada Lipscani 43', 'mocanuhoria@gmail.com', '0763551170', 2534, 'PAZNIC', '2018-09-04', 2), 
    ('Rusu', 'Mircea', 'Strada Lipscani 43', 'rusumircea@gmail.com', '0711120362', 3346, 'BIBLIOTECAR', '2018-02-22', 4), 
    ('Barbu', 'Gabriel', 'Calea Victoriei 63', 'barbugabriel@gmail.com', '0713644081', 4664, 'OPERATOR DE INTRODUCERE DATE', '2012-08-14', 3), 
    ('Dobre', 'Ovidiu', 'Bulevardul Ion Gheorghe Duca 8', 'dobreovidiu@gmail.com', '0738485151', 7943, 'INGRIJITOR', '2020-07-12', 4), 
    ('Dinescu', 'Manuel', 'Soseaua Stefan cel Mare 56', 'dinescumanuel@gmail.com', '0772552424', 3588, 'BIBLIOTECAR', '2013-11-22', 4), 
    ('Codreanu', 'Dan', 'Calea Victoriei 63', 'codreanudan@gmail.com', '0774216267', 6956, 'INGRIJITOR', '2013-06-05', 2), 
    ('Draghici', 'Bogdan', 'Bulevardul Ion Gheorghe Duca 8', 'draghicibogdan@gmail.com', '0733371865', 2657, 'OPERATOR DE INTRODUCERE DATE', '2014-05-27', 4), 
    ('Paun', 'Mihai', 'Soseaua Mihai Bravu 25', 'paunmihai@gmail.com', '0758485170', 8321, 'PAZNIC', '2016-11-25', 3), 
    ('Niculescu', 'Marius', 'Strada Armand Calinescu 17', 'niculescumarius@gmail.com', '0735827817', 7774, 'OPERATOR DE INTRODUCERE DATE', '2020-09-16', 1), 
    ('Tudor', 'Razvan', 'Calea Aurel Vlaicu 15', 'tudorrazvan@gmail.com', '0757260662', 4874, 'OPERATOR DE INTRODUCERE DATE', '2021-12-31', 4), 
    ('Marin', 'Horia', 'Str. Calea Vitan 55', 'marinhoria@gmail.com', '0734646068', 2648, 'PAZNIC', '2016-04-17', 3),
    ('Lungu', 'Razvan', 'Strada Agricultori 21', 'lungurazvan@gmail.com', '0774122440', 8532, 'MANAGER', '2013-08-24', 3), 
    ('Ilie', 'Lucian', 'Bulevardul Timisoara 8', 'ionesculucian@gmail.com', '0782825456', 6253, 'PAZNIC', '2020-03-22', 5), 
    ('Popescu', 'Ovidiu', 'Strada Lipscani 43', 'marinovidiu@gmail.com', '0781603477', 2978, 'BIBLIOTECAR', '2016-01-20', 3), 
    ('Ionescu', 'Adrian', 'Bulevardul Aerogarii 21', 'mocanuadrian@gmail.com', '0724864670', 8427, 'INGRIJITOR', '2018-11-05', 5), 
    ('Mihail', 'Ovidiu', 'Bulevardul Ion Gheorghe Duca 8', 'ilieovidiu@gmail.com', '0740226353', 4009, 'PAZNIC', '2020-06-22', 1), 
    ('Popa', 'Lucian', 'Strada Grigore Alexandrescu 7', 'dobrelucian@gmail.com', '0701125810', 6149, 'MANAGER', '2017-08-17', 5), 
    ('Negoitescu', 'Dan', 'Strada Barbu Vacarescu 20', 'dinescudan@gmail.com', '0708513280', 2569, 'MANAGER', '2018-06-23', 1), 
    ('Dumitrescu', 'Bogdan', 'Strada Cornul Luncii 2', 'dinescubogdan@gmail.com', '0774557068', 2777, 'OPERATOR DE INTRODUCERE DATE', '2012-06-09', 5), 
    ('Vlad', 'Mircea', 'Strada Armand Calinescu 17', 'tudormircea@gmail.com', '0774648405', 6185, 'MANAGER', '2018-02-16', 6), 
    ('Mocanu', 'Manuel', 'Soseaua Stefan cel Mare 56', 'marinmanuel@gmail.com', '0727655544', 7083, 'BIBLIOTECAR', '2018-03-20', 5), 
    ('Rusu', 'Lucian', 'Strada Cornul Luncii 2', 'popalucian@gmail.com', '0728184602', 5771, 'INGRIJITOR', '2020-04-08', 2), 
    ('Barbu', 'Gabriel', 'Strada Armand Calinescu 17', 'paungabriel@gmail.com', '0705142272', 5102, 'OPERATOR DE INTRODUCERE DATE', '2021-04-15', 3), 
    ('Dobre', 'Viorel', 'Strada Cornul Luncii 2', 'codreanuviorel@gmail.com', '0787822872', 9704, 'BIBLIOTECAR', '2013-09-28', 5), 
    ('Dinescu', 'Manuel', 'Soseaua Mihai Bravu 25', 'iliemanuel@gmail.com', '0731762787', 8144, 'BIBLIOTECAR', '2015-09-07', 3), 
    ('Codreanu', 'Ionel', 'Soseaua Oltenitei 12', 'barbuionel@gmail.com', '0752338436', 8029, 'BIBLIOTECAR', '2019-05-03', 2), 
    ('Draghici', 'Mihai', 'Strada Agricultori 21', 'mocanumihai@gmail.com', '0757455860', 4972, 'INGRIJITOR', '2021-05-07', 1), 
    ('Paun', 'Mircea', 'Calea Mosilor 13', 'rusumircea@gmail.com', '0741021121', 6275, 'PAZNIC', '2014-11-04', 6), 
    ('Niculescu', 'Mihai', 'Strada Dristorului 10', 'popescumihai@gmail.com', '0764022426', 3828, 'INGRIJITOR', '2021-09-23', 5), 
    ('Tudor', 'Bogdan', 'Calea Mosilor 13', 'marinbogdan@gmail.com', '0760846430', 7091, 'MANAGER', '2019-04-11', 4), 
    ('Marin', 'Gheorghe', 'Strada Barbu Vacarescu 20', 'popagheorghe@gmail.com', '0735157823', 2465, 'PAZNIC', '2019-08-25', 4)


--CREARE SI INSERARE IN TABELA Legitimatie + CONSTRANGERI

CREATE TABLE Legitimatie(
    id_legitimatie  int identity(1,1)   constraint pk_Legitimatie primary key,
    data_expirarii      date,
    id_elev             int             not null,
    constraint fk_Legitimatie foreign key(id_elev) references Elev(id_elev)
);

INSERT INTO Legitimatie VALUES
    ('2022-03-15',11),
    ('2021-07-29',3),
    ('2021-05-18',15),
    ('2021-11-18',10),
    ('2021-05-27',3),
    ('2020-10-22',10),
    ('2020-06-14',20),
    ('2022-02-19',19),
    ('2022-03-08',11),
    ('2020-08-30',13),
    ('2021-03-06',7),
    ('2021-02-16',16),
    ('2022-05-03',18),
    ('2022-03-30',6),
    ('2021-03-03',20);


--CREARE SI INSERARE IN TABELA Imprumut + CONSTRANGERI

CREATE TABLE Imprumut(
    id_imprumut     int identity(1,1)   constraint pk_Imprumut primary key,
    id_elev             int,
    id_carte            int,
    id_biblioteca       int,
    constraint fk_imprumut_elev foreign key(id_elev) references Elev(id_elev),
    constraint fk_imprumut_carte foreign key(id_carte) references Carte(id_carte),
    constraint fk_imprumut_biblioteca foreign key(id_biblioteca) references Biblioteca(id_biblioteca)
);



INSERT INTO Imprumut VALUES
    (19,26,1),
    (18,18,6),
    (15,16,3),
    (13,4,2),
    (15,9,6),
    (20,23,5),
    (7,10,1),
    (3,8,5),
    (11,1,5),
    (15,9,3),
    (20,11,2),
    (10,9,5),
    (19,9,2),
    (10,8,5),
    (11,2,6),
    (20,13,4),
    (13,5,1),
    (6,6,5),
    (20,24,2),
    (18,14,6),
    (3,14,1),
    (10,13,3),
    (10,12,4),
    (11,14,6),
    (7,25,1),
    (18,24,2),
    (20,7,5),
    (13,3,4),
    (16,4,4),
    (19,23,3);




--CREARE SI INSERARE IN TABELA FisaDeLectura + CONSTRANGERI

CREATE TABLE FisaDeLectura(
    id_fisa_de_lectura      int identity(1,1)       constraint pk_FisaDeLectura primary key,
    id_carte                    int                     not null,
    id_elev                     int                     not null,
    data_imprumutului           date,
    data_limita                 date,
    data_restituire             date,
    constraint fk_istoric_carte foreign key(id_carte) references CARTE(id_carte),
    constraint fk_istoric_elev foreign key(id_elev) references Elev(id_elev),
    constraint check_data check(data_limita>data_imprumutului)
);


INSERT INTO FisaDeLectura VALUES 
    (26,19,'2021-04-11','2021-12-26','2021-05-23'),
    (18,18,'2021-10-20','2022-05-22','2022-03-25'),
    (16,15,'2021-09-15','2022-03-27','2021-10-25'),
    (4,13,'2021-03-31','2021-12-12','2021-08-01'),
    (9,15,'2021-04-18','2021-08-18','2021-08-18'),
    (23,20,'2021-09-13','2021-12-05','2021-12-03'),
    (10,7,'2021-01-04','2021-04-18','2021-01-25'),
    (8,3,'2021-07-26','2022-02-10','2021-11-11'),
    (1,11,'2021-02-11','2021-03-01','2021-03-01'),
    (9,15,'2021-08-09','2021-10-13','2021-09-22'),
    (11,20,'2021-10-13','2022-03-11','2021-12-06'),
    (9,10,'2021-06-20','2022-03-16','2021-12-04'),
    (9,19,'2021-12-30','2022-05-21','2022-02-17'),
    (8,10,'2021-09-24','2022-05-12','2021-11-18'),
    (2,11,'2022-04-23','2022-05-03','2022-05-01'),
    (13,20,'2022-02-13','2022-07-09',NULL),
    (5,13,'2021-06-26','2022-04-11','2021-10-02'),
    (6,6,'2021-02-06','2021-08-07','2021-06-29'),
    (24,20,'2021-04-03','2021-09-09','2021-05-22'),
    (14,18,'2021-10-24','2022-06-18',NULL),
    (14,3,'2022-05-27','2022-06-17','2022-06-03'),
    (13,10,'2021-12-09','2022-06-30',NULL),
    (12,10,'2021-09-15','2022-04-18','2022-03-31'),
    (14,11,'2021-10-10','2022-04-22','2022-03-26'),
    (25,7,'2022-05-17','2022-05-27','2022-05-20'),
    (24,18,'2022-01-31','2022-06-15','2022-06-13'),
    (7,20,'2021-04-28','2021-08-31','2021-07-02'),
    (3,13,'2021-06-13','2021-08-20','2021-06-13'),
    (4,16,'2021-12-07','2022-01-03','2021-12-09'),
    (23,19,'2021-01-03','2021-11-01','2021-05-28');

--VERIFICARE DACA TOATE DATELE AU FOST INTRODUSE CORECT

select * from Angajat
select * from Apartine
select * from Autor
select * from Biblioteca
select * from Carte
select * from Domeniu
select * from Editura
select * from Elev
select * from FisaDeLectura
select * from Imprumut
select * from Legitimatie
select * from Oras
select * from Scrisa