
/* Produits bientôt hors de stock (seuil) */

CREATE OR REPLACE PROCEDURE produitsBientotHorsDeStock (v_seuil IN number) 
  IS
 	 quantiteStock number(4,0);
  BEGIN
 
 	SELECT stock INTO quantiteStock
 	FROM produit;
 
 IF quantiteStock <= seuil THEN
 	  dbms_output.put('Ce produits est bientôt hors de stock');	 
 END IF;

END produitsBientotHorsDeStock; 


/*Changer le statut d'une commande (commande, statut)*/

CREATE PROCEDURE changerLeStatutDuneCommmande(v_commande commande%ROWTYPE, v_statut statut%ROWTYPE)
IS
	
	
BEGIN 
	
	
	
	
END changerLeStatutDuneCommmande;

