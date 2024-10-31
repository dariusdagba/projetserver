---Exercice1---
SET SERVEROUTPUT ON
DECLARE
nbre1 number(20):=&nbre;
nbre2 number(20):=&nbres;
choix VARCHAR(20):='&choix';
som number(20);sous number(20); mul number(20);div number(20);
BEGIN
if choix='addition' then
    som :=nbre1+nbre2;
    DBMS_OUTPUT.PUT_LINE('La somme est: '||som);
elsif choix='soustration' then
     sous :=nbre1-nbre2;
     DBMS_OUTPUT.PUT_LINE('La soustration est: '||sous);
elsif choix='multiplication' then
     mul :=nbre1*nbre2;
     DBMS_OUTPUT.PUT_LINE('La multiplication est: '||mul);
elsif choix='division' then
     div :=nbre1/nbre2;
     DBMS_OUTPUT.PUT_LINE('La division est: '||div);
else
     DBMS_OUTPUT.PUT_LINE('choix invalide');
end if;
END;

---exercice2----

SET SERVEROUTPUT ON
DECLARE
nbre1 number(20):=&nbre;
nbre2 number(20):=&nbres;
choix VARCHAR(20):='&choix';
som number(20);sous number(20); mul number(20);div number(20);
BEGIN
case choix
    when 'addition' then
    som :=nbre1+nbre2;
    DBMS_OUTPUT.PUT_LINE('La somme est: '||som);
    when 'soustration' then
    sous :=nbre1-nbre2;
    DBMS_OUTPUT.PUT_LINE('La soustration est: '||sous);
    when 'multiplication' then
    mul :=nbre1*nbre2;
    DBMS_OUTPUT.PUT_LINE('La multiplication est: '||mul);
    when 'division' then
    div :=nbre1/nbre2;
    DBMS_OUTPUT.PUT_LINE('La division est: '||div);
    else 
     DBMS_OUTPUT.PUT_LINE('choix invalide');
end case;
END;

---Exercice3----
CREATE TABLE VOITURE( immatriculation VARCHAR(20), marque VARCHAR(20), PRIMARY KEY(immatriculation));

----BOUCLE FOR---
DECLARE
marques VARCHAR(20):='&marques';
nbrevoiture number(20):=&nbrevoiture;
i number(20);
v_immatriculation voiture.immatriculation%type;
v_marque voiture.marque%type;
BEGIN
for i in 1..nbrevoiture loop
    v_immatriculation:=marques||i;
    v_marque:=marques;
    INSERT INTO VOITURE VALUES(v_immatriculation,v_marque);
end loop;
END;

SELECT immatriculation,marque FROM VOITURE;

DECLARE
marques VARCHAR(20):='&marques';
nbrevoiture number(20):=&nbrevoiture;
i number(20):=1;
v_immatriculation voiture.immatriculation%type;
v_marque voiture.marque%type;
BEGIN
 loop
    v_immatriculation:=marques||i;
    v_marque:=marques;
    INSERT INTO VOITURE VALUES(v_immatriculation,v_marque);
    i:=i+1;
 exit when(i>nbrevoiture);
 end loop;
END;

DECLARE 
marques VARCHAR(20):='&marques';
nbrevoiture number(20):=&nbrevoiture;
i number(20):=1;
v_immatriculation voiture.immatriculation%type;
v_marque voiture.marque%type;
BEGIN

WHILE i <=nbrevoiture LOOP
    v_immatriculation:=marques||i;
    v_marque:=marques;
    INSERT INTO VOITURE VALUES(v_immatriculation,v_marque);
    i:=i+1;
  END LOOP;
END;

DELETE FROM VOITURE;





