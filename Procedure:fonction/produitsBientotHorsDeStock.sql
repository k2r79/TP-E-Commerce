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