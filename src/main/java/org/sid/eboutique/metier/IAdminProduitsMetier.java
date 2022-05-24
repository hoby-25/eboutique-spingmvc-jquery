package org.sid.eboutique.metier;

import java.util.List;

import org.sid.eboutique.entities.Product;
import org.sid.eboutique.entities.Produit;

public interface IAdminProduitsMetier extends CaissierMetier {
	public Long ajouterProduit(Produit p);
	public void supprimerProduit(Long idP);
	public void modifierProduit(Produit p);
	public List<Produit> listproduits2();
	
	// Product
	public boolean ajouterProduct(Product p);
	public List<Product> listproducts();
	public List<Product> lancerRecherche(String article , String type , String taille , String marque , String couleur);
	public List<Product> productsParMotCle(String mc);
	public List<Product> productsParCategorie(Long idCat);
	public List<Product> productSelectionnes();

	public boolean supprimerProduct(Long idP);
	
	// Product
}
