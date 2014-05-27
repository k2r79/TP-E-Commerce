CREATE OR REPLACE FUNCTION fournisseurAvecLePlusDeCommandes() RETURN VARCHAR2 
IS 

  TYPE TAB_REC_FOURNISSEUR IS RECORD(
    nomFournisseur VARCHAR2;
    nombreCommande NUMBER;
  );
	CURSOR c_lesFournisseurs IS SELECT id, nom  
                              FROM fournisseur;
  
  t_Fournisseur TAB_REC_FOURNISSEUR;
  v_nomFournisseur VARCHAR2;
  i NUMBER := 1;
  j NUMBER;
  tmp TAB_REC_FOURNISSEUR;
										   
BEGIN
  FOR leFournisseur IN c_lesFournisseurs LOOP
    
    SELECT count(cf.reffournisseur) INTO nombreCommande
    FROM commandefournisseur cf
    WHERE cf.refFournisseur = leFournisseur.id;
    
    i := i + 1;
    
    t_Fournisseur(i).nomFournisseur := lefournisseur.nom;
    t_Fournisseur(i).nombreCommande := nombreCommande; 
  END LOOP;
  FOR i IN 1 .. t_Fournisseur.LIMIT LOOP
    FOR j IN 1 .. t_Fournisseur.LIMIT LOOP
      IF t_Fournisseur(i).nombreCommande > t_Fournisseur(j).nombreCommande THEN
        tmp := t_Fournisseur(i);
        t_Fournisseur(i) := t_Fournisseur(j);
        t_Fournisseur(j) := tmp;
      END IF;
    END LOOP;
    v_nomFournisseur := t_Fournisseur(t_Fournisseur.LAST).nomFournisseur;
  RETURN v_nomFournisseur;
END fournisseurAvecLePlusDeCommandes;