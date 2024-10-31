CREATE TABLE inscription( code VARCHAR2(20), nom VARCHAR2(20), primary key(code));
INSERT INTO inscription values('A1','ERIC');
INSERT INTO inscription values('B1','NARITA');
INSERT INTO inscription values('C1','ANAS');

SET SERVEROUTPUT ON
DECLARE
--declaration du curseur-----
CURSOR Cur_inscription IS
SELECT code, nom FROM inscription;
Le_curseur_inscription Cur_inscription%ROWTYPE;
BEGIN
--ouverture du curseur---
OPEN Cur_inscription;
---récupération de la ligne affiché---
FETCH Cur_inscription INTO Le_curseur_inscription;
---affichage des  informations contenu dans le curseur----
DBMS_OUTPUT.PUT_LINE(Le_curseur_inscription.CODE||Le_curseur_inscription.NOM);
--fermeture du curseur---
CLOSE Cur_inscription;
END;

-----la boucle while------
SET SERVEROUTPUT ON
DECLARE
CURSOR Cur_inscription IS
SELECT code, nom FROM inscription;
Le_curseur_inscription Cur_inscription%ROWTYPE;
BEGIN
OPEN Cur_inscription;
FETCH Cur_inscription INTO Le_curseur_inscription;
while Cur_inscription%found loop
DBMS_OUTPUT.PUT_LINE(Le_curseur_inscription.CODE||' '||Le_curseur_inscription.NOM);
FETCH Cur_inscription INTO Le_curseur_inscription;
end loop;
CLOSE Cur_inscription;
END;

---la boucle loop exit when----
SET SERVEROUTPUT ON
DECLARE
CURSOR Cur_inscription IS
SELECT code, nom FROM inscription;
Le_curseur_inscription Cur_inscription%ROWTYPE;
BEGIN
OPEN Cur_inscription;
loop 
FETCH Cur_inscription INTO Le_curseur_inscription;
exit when Cur_inscription%notfound;
DBMS_OUTPUT.PUT_LINE(Le_curseur_inscription.CODE||' '||Le_curseur_inscription.NOM);
end loop;
CLOSE Cur_inscription;
END;

---la boucle for-----
SET SERVEROUTPUT ON
DECLARE
CURSOR Cur_inscription IS
SELECT code, nom FROM inscription;
Le_curseur_inscription Cur_inscription%ROWTYPE;
BEGIN
for Le_curseur_inscription in Cur_inscription  loop
DBMS_OUTPUT.PUT_LINE(Le_curseur_inscription.CODE||' '||Le_curseur_inscription.NOM);
end loop;
END;

        ---------------------------------------------Exercice 2----------------------------------------
CREATE TABLE employes(identifiant VARCHAR2(20),nom VARCHAR2(20),salaire decimal(10,2));
INSERT INTO employes values('EMP001','CEDRIC',60000.00);
INSERT INTO employes values('EMP002','ALYSSIA',65000.00);
INSERT INTO employes values('EMP003','JOE',49900.00);
INSERT INTO employes values('EMP004','SARA',59000.00);
INSERT INTO employes values('EMP005','AHMED',80000.00);
INSERT INTO employes values('EMP006','SEBASTIEN',30000.00);
INSERT INTO employes values('EMP007','JUGURTHA',55000.00);

SET SERVEROUTPUT ON
DECLARE
CURSOR c_empt IS
SELECT nom,salaire FROM employes WHERE salaire >45000.00;
v_empt c_empt%ROWTYPE;
BEGIN
for v_empt in c_empt  loop
DBMS_OUTPUT.PUT_LINE(v_empt.nom||' '||v_empt.salaire);
end loop;
END;

