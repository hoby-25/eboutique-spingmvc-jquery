package org.sid.eboutique.dao;

import java.util.List;


import org.sid.eboutique.entities.*;

public interface IBoutiqueDao {
	// SOMME
	public Long sommeRobe();
	// SOMME
	
	// CHART STOCK PRODUCT
	public List<Product> getChartbananeStock();
	public List<Product> getChartcoffretStock();
	public List<Product> getChartcartableStock();
	public List<Product> getChartpochetteStock();
		
	public List<Product> getChartpatalonStock();
	public List<Product> getChartshortStock();
	public List<Product> getCharttunniqueStock();
	public List<Product> getChartrobeStock();
	// CHART STOCK PRODUCT
	
	// Chiffre d'affaire du sac
	public List<LigneCommande> getChartChiffreAffaireBanane();
	public List<LigneCommande> getChartChiffreAffairePochette();
	public List<LigneCommande> getChartChiffreAffaireCartable();
	public List<LigneCommande> getChartChiffreAffaireCoffret();
	// CHIFFRE D'AFFAIRE SAC
	
	// CHIFFRE D'AFFAIRE VETEMENTS
	public List<LigneCommande> getChartChiffreAffaireRobe();
	public List<LigneCommande> getChartChiffreAffaireTunnique();
	public List<LigneCommande> getChartChiffreAffaireShort();
	public List<LigneCommande> getChartChiffreAffairePatalon();
	// CHIFFRE D'AFFAIRE VETEMENTS
	
	// Product
	public boolean ajouterProduct(Product p);
	public List<Product> listproducts();
	public List<Product> productsParMotCle(String mc);
	public List<Product> productsParCategorie(Long idCat);
	public List<Product> productSelectionnes();
	public Product getProduct(Long idP);
	public boolean supprimerProduct(Long idP);
	public boolean modifierProduct(Product p);
	public List<Product> lancerRecherche(String article, String type, String taille, String marque, String couleur);
	// Product
	
	// Categories
	public Long ajouterCategorie(Categorie c);
	public List<Categorie> listCategories();
	public Categorie getCategorie(Long idCat);
	public void supprimerCategorie(Long idcat);
	public void modifierCategorie(Categorie c);
	// Categories

	//Clients
	public boolean ajouterClient(Client c);
	public List<Client> listClients();
	public List<Client> clientsParMotCle(String mc);
	public List<Client> getClient(Long idC);
	public boolean supprimerClient(Long idC);
	public boolean modifierClient(Client c);
	//Clients
	
	// Produits
	public Long ajouterProduit(Produit p);
	public List<Produit> listproduits();
	public List<Produit> produitsParMotCle(String mc);
	public List<Produit> produitsParCategorie(Long idCat);
	public List<Produit> produitSelectionnes();
	public Produit getProduit(Long idP);
	public void supprimerProduit(Long idP);
	public void modifierProduit(Produit p);
	public Client recupererClient(Long idC);
	// Produits
	
	// Ligne commande
	public Long addLigneCommande(LigneCommande ligne);
	// Ligne commande
	
	// Users + commandes
	public void ajouterUser(User u);
	public void attribuerRole(Role r, Long userID);
	public Commande enregistrerCommande(Panier p, Client c);
	public List<Produit> listproduits2();	
	public Long ajouterCommande(Commande commande);
	public Commande getCommande(Long idC);
	// Users + commandes
}
