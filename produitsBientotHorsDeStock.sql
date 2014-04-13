CREATE OR REPLACE PROCEDURE produitsBientotHorsDeStock (seuil IN number) 
IS
  quantiteStock number(4,0);
BEGIN

  SELECT quantite INTO quantiteStock
  FROM commandeproduit, produit 
  WHERE commandeproduit.refproduit = produit.id;
  
  IF quantiteStock <= seuil THEN
    dbms_output.put('Ce produits est bientôt hors de stock');
  END IF;

END produitsBientotHorsDeStock; 