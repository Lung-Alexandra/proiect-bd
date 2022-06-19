--Exercitiul 11.

--1. Sa se afiseze angajatii bibliotecilor(nume, prenume,telefon,functie si salariu initial) care se afla in orasul Cluj-Napoca, precum si
--salariul acestora, stiind ca li se acorda o majorare de salariu de 25%.

--In cadrul acestei cereri am utilizat urmatoarele elemente:
    --NVL(Oracle) => ISNULL (SQL server)  
    -- filtrare la nivel de linii 
    -- subcereri nesincronizate
	 -- functii pe siruri de caractere 

SELECT nume, prenume,telefon, functie, salariu as "Salariu", ISNULL(salariu+0.25*salariu,0) "Salariu Majorat"
FROM Angajat
WHERE id_biblioteca in (SELECT id_biblioteca FROM Biblioteca WHERE id_oras=
                        (SELECT id_oras FROM Oras WHERE upper(nume)='Cluj-Napoca'));




--2. Sa se afiseze elevii care au imprumutat carti din domeniile Fantasy,Fictiune sau carti scrise de Mark Twain 
--si care au imprumutat carti in luna a 4 sau in ziua a 6 din orice luna si le-au adus la timp, ordonati alfabetic dupa numele de familie.

--In cadrul acestei cereri am utilizat urmatoarele elemente:
    --am folosit join pe 4 tabele
    -- filtrare la nivel de linii
    -- subcereri nesincronizate pe 3 tabele
    -- ordonari
    -- pe date calendaristice.

SELECT distinct(e.id_elev),e.nume ,e.prenume,ca.titlu
FROM Elev e, FisaDeLectura f, Domeniu d, Carte ca
WHERE e.id_elev=f.id_elev and f.data_limita>=f.data_restituire and
f.id_carte=ca.id_carte and (MONTH(f.data_imprumutului) = 4 or DAY(f.data_imprumutului) = 6)
and ca.id_carte in (SELECT id_carte FROM Apartine WHERE id_domeniu in 
(SELECT id_domeniu FROM Domeniu WHERE nume='Fantasy' or nume='Fictiune')
or ca.id_carte in (SELECT id_carte FROM Scrisa WHERE id_autor=(SELECT id_autor
FROM Autor WHERE nume='Twain')))
ORDER BY e.nume;


--3. Sa se afiseze numele,data la care s-au angajat, functia angajatilor, biblioteca unde lucreaza si salariul 
--acestora stiind ca se majoreaza salariile astfel: 
    -- pentru manageri cu 15%, 
    -- pentru bibliotecari cu 20%
    -- pentru operator de introducere date cu 10%
    -- pentru paznici cu 5% 
    -- pentru ingrijitori cu 2%. 
--Afisati doar angajatii care s-au angajat dupa anul 2018 si luna a august, in ordinea lexicografica a functiilor.

--In cadrul acestei cereri am utilizat urmatoarele elemente:                        
    -- decode(oracle) => CASE(ssms)
    -- ordonare 
    -- functii pe date calendaristice
	-- functii pe siruri de caractere.

SELECT concat(a.nume,' ' ,a.prenume) as NumeAngajat,a.salariu,a.data_angajarii,a.functie,b.nume "Biblioteca",
CASE  upper(a.functie)  WHEN 'MANAGER' THEN  ISNULL(salariu+0.15*salariu,0)
                        WHEN 'BIBLIOTECAR' THEN  ISNULL(salariu+0.2*salariu,0) 
                        WHEN 'OPERATOR DE INTRODUCERE DATE' THEN  ISNULL(salariu+0.1*salariu,0)
                        WHEN 'PAZNIC' THEN  ISNULL(salariu+0.05*salariu,0)
                        WHEN 'INGRIJITOR' THEN  ISNULL(salariu+0.02*salariu,0) 
END "Salariu majorat"
FROM Angajat a, Biblioteca b
WHERE b.id_biblioteca=a.id_biblioteca and a.data_angajarii>='01-08-2018'
ORDER BY a.functie;




--4. Sa se afiseze numele si pretul cartilor care sunt incadrate in cel putin 2 domenii.
--Incadrarea cartilor in categorii dupa numarul de pagini se realizeaza astfel:
-- daca au sub 250 de pagini,sunt considerate lectura usoara, 
-- daca au intre 250 si 500 de pagini, sunt considerate lectura cu dificultate medie, 
-- daca au peste 500 de pagini sunt considerate lecturi grele.

--In cadrul acestei cereri am utilizat urmatoarele elemente:
    -- grupari de date
    -- functii grup
    -- filtrare la nivel de grupuri 
    -- functia CASE

SELECT c.titlu, c.pret, d.nr "Nr Domenii", 
CASE
    WHEN c.numar_pagini<250 THEN 'dificultate usoara'
    WHEN c.numar_pagini>=250 and c.numar_pagini<500 THEN 'dificultate medie'
    WHEN c.numar_pagini>=500 THEN 'dificultate grea'
END as "Dificultate"
FROM Carte c,(SELECT count(*) nr, id_carte idc
FROM Apartine
GROUP BY id_carte
HAVING count(*)>1) d
WHERE c.id_carte=d.idc;

--5. Sa se afiseze pentru fiecare angajat care are salariul mai mic decat media salariului angajatilor
-- prenumele, salariu, functia, salariul mediu per functie, numarul de angajati per functie si biblioteca unde lucreaza.

-- In cadrul acestei cereri am utilizat urmatoarele elemente:
    -- subcereri sincronizate
    -- filtrare la nivel de linii 
    -- clauza WITH


WITH Salariu_NumarAngajati_Per_Functie as(
SELECT avg(salariu) as medie
FROM angajat)
SELECT nume,prenume,salariu,a.functie,
(SELECT round(avg(salariu),3)
FROM angajat
WHERE functie=a.functie) "SALARIU MEDIU/FUNCTIE",
(SELECT count(*)
FROM angajat
WHERE functie=a.functie) "NR ANGAJATI/FUNCTIE",
(SELECT nume
FROM biblioteca
WHERE id_biblioteca=a.id_biblioteca) "BIBLIOTECA"
FROM angajat a, Salariu_NumarAngajati_Per_Functie s
WHERE a.salariu<s.medie
ORDER BY a.functie




--Exercitiul 12.

--Sa se micsoreze salariul angajatilor care lucreaza la bibliotecile scolare din  Bucuresti cu 10%.

UPDATE Angajat
SET salariu = salariu-0.2*salariu
WHERE id_biblioteca in (SELECT id_biblioteca FROM Biblioteca 
WHERE id_oras = (SELECT id_oras FROM Oras WHERE upper(nume) = 'BUCURESTI'));

--Sa se scumpeasca pretul cartilor publicate la editura Leda cu 30%.
UPDATE Carte
SET pret=pret+0.3*pret
WHERE id_carte in (SELECT id_carte FROM carte 
WHERE id_editura = (SELECT id_editura FROM editura WHERE upper(nume)='LEDA'));

--Sa se stearga domeniile care nu au carti.
DELETE FROM Domeniu
WHERE id_domeniu not in (SELECT id_domeniu FROM Apartine);






--Exercitiul 13.

--Secventele se gasesc in "Lung_Alexandra-creare_inserare.txt", la tabelele Autor, Elev, Carte, Scrisa, Abonament, Apartine, Angajat, Imprumut, FisaDeLectura, Oras, Biblioteca.
--exemplu din fisier

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





--Exercitiul 14.

-- Stergere vizualizare daca exista
DROP VIEW IF EXISTS sal_per_biblioteci

-- Secventa urmatoare creeaza o vedere complexa care contine 
-- numele, salariul minim, salariul maxim si salariul mediu pentru fiecare biblioteca

GO
CREATE VIEW sal_per_biblioteci(name, minsal, maxsal, avgsal)
AS SELECT d.nume, MIN(e.salariu), MAX(e.salariu), AVG(e.salariu)
FROM Angajat e, Biblioteca d
WHERE e.id_biblioteca =d.id_biblioteca
GROUP BY d.nume;
GO

--afisare date dupa crearea cererii pentru verificare
SELECT * FROM sal_per_biblioteci

--operatie LMD nepermisa
DELETE FROM sal_per_biblioteci
WHERE avgsal<=6000

--operatie LMD permisa
SELECT *FROM sal_per_biblioteci
WHERE  avgsal<=6000



--Exercitiul 15.

--neoptimizat
GO
SET STATISTICS TIME ON;

Select *
from Angajat
where nume = 'Popa' or prenume = 'Manuel'
 
SET STATISTICS TIME OFF; 
GO

--optimizat
CREATE INDEX ang_num_pren_index
ON Angajat (nume, prenume);

GO
SET STATISTICS TIME ON; 

Select *
from Angajat
where nume = 'Popa' or prenume = 'Manuel'
 
SET STATISTICS TIME OFF; 
GO

--stergere index
DROP INDEX ang_num_pren_index   
    ON Angajat; 


--Exercitiul 16.

--OUTER JOIN

--Afisati pentru fiecare elev cartea imprumutata , autorul si editura acesteia.

SELECT e.nume+' '+e.prenume Elev, c1.titlu Carte, ed.nume EDITURA,a.nume+' '+a.prenume Autor
FROM Elev e right outer join FisaDeLectura f on (f.id_elev = e.id_elev)
left outer join Carte c1 on (c1.id_carte = f.id_carte) full outer join Editura
ed on (ed.id_editura = c1.id_editura) full outer join Scrisa s on (s.id_carte = f.id_carte)
full outer join  Autor a  on (a.id_autor = s.id_autor)
WHERE e.nume IS NOT NULL and c1.titlu IS NOT NULL 
ORDER BY e.nume; 



--DIVISION

--Sa se afiseze id-ul, numele si prenumele elevilor,titlul si pretul cartiilor care au fost  imprumutate 
--și au pretul intre 20 si 50 de lei.

SELECT f.id_elev, nume, prenume,titlu,pret
FROM FisaDeLectura f join Elev e on (f.id_elev=e.id_elev) join Carte c on (f.id_carte = c.id_carte)
WHERE c.id_carte in (SELECT id_carte FROM Carte WHERE pret>=20 and pret <= 50)
GROUP BY f.id_elev,nume, prenume,titlu,pret
HAVING count(*) <= (SELECT count(id_carte) FROM Carte WHERE pret>=20 and pret <= 50)

except

SELECT f.id_elev, nume, prenume,titlu,pret
FROM FisaDeLectura f join Elev e on (f.id_elev=e.id_elev)join Carte c on (f.id_carte = c.id_carte)
WHERE c.id_carte not in (SELECT id_carte FROM Carte WHERE pret>=20 and pret <= 50)


--Sa se afiseze elevii care au imprumutat aceleasi carti ca elevul cu id-ul 15.

SELECT f.id_elev, nume, prenume
FROM FisaDeLectura f join Elev e on (e.id_elev = f.id_elev)
WHERE id_carte in (SELECT id_carte
                    FROM FisaDeLectura
                    WHERE id_elev=15)
and f.id_elev !=15

except

SELECT f.id_elev, nume, prenume
FROM FisaDeLectura f join Elev e on (e.id_elev = f.id_elev) 
WHERE f.id_carte not in (SELECT id_carte
                    FROM FisaDeLectura
                    WHERE id_elev=15)
and f.id_elev not in (SELECT i.id_elev
						FROM Imprumut i
						WHERE i.id_carte in (SELECT id_carte
											 FROM FisaDeLectura
											 WHERE id_elev=15)   
					 )


--Exercitiul 17.

SELECT c.titlu,c.seria,c.limba
FROM Carte c join Scrisa s on (c.id_carte = s.id_carte) join Autor a on (a.id_autor =  s.id_autor)
WHERE upper(a.nume)= 'ARMENTROUT' and c.id_editura = 2
