CREATE OR REPLACE FUNCTION expediteurLePlusConvoite() RETURN VARCHAR2 
IS 

  TYPE TAB_REC_EXPEDITEUR IS RECORD(
    nomExpediteur VARCHAR2;
    nombreCommande NUMBER;
  );
	CURSOR c_lesExpediteurs IS SELECT id, libelle  
                              FROM fournisseur;
  
  t_expediteur TAB_REC_EXPEDITEUR;
  v_nomExperditeur VARCHAR2;
  i NUMBER := 1;
  j NUMBER;
  tmp TAB_REC_EXPEDITEUR;
										   
BEGIN
  FOR leExpediteur IN c_lesExpediteurs LOOP
    
    SELECT count(c.refExpediteur) INTO nombreCommande
    FROM commande c
    WHERE c.refExpediteur = leExpediteur.id;
    
    i := i + 1;
    
    t_expediteur(i).nomExpediteur := leExpediteur.libelle;
    t_expediteur(i).nombreCommande := nombreCommande; 
  END LOOP;
  FOR i IN 1 .. t_expediteur.LIMIT LOOP
    FOR j IN 1 .. t_expediteur.LIMIT LOOP
      IF t_expediteur(i).nombreCommande > t_expediteur(j).nombreCommande THEN
        tmp := t_expediteur(i);
        t_expediteur(i) := t_expediteur(j);
        t_expediteur(j) := tmp;
      END IF;
    END LOOP;
    v_nomExperditeur := t_expediteur(t_expediteur.LAST).nomExpediteur;
  RETURN v_nomExperditeur;
END expediteurLePlusConvoite;