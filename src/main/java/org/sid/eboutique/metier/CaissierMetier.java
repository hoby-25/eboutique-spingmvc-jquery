package org.sid.eboutique.metier;

import java.util.List;

import org.sid.eboutique.entities.*;

public interface CaissierMetier {
	
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
	
	// CHIFFRE D'AFFAIRE SAC
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
	
	public List<Categorie> listCategories();
	public Categorie getCategorie(Long idCat);
	public List<Produit> listproduits();
	public List<Produit> produitsParMotCle(String mc);
	public List<Produit> produitsParCategorie(Long idCat);
	public List<Produit> produitSelectionnes();
	public Produit getProduit(Long idP);
	public Commande enregistrerCommande(Panier p, Client c);	
	public Client recupererClient(Long idC);
	public Product getProduct(Long idP);
	public boolean modifierProduct(Product p);
	
	// Ligne de commande
	public Long addLigneCommande(LigneCommande ligne);
	// Ligne de commande
	
	// Commandes
	public Long ajouterCommande(Commande commande);
	public Commande getCommande(Long idC);
	// Commandes
	
	//Clients
		public boolean ajouterClient(Client c);
		public List<Client> listClients();
		public List<Client> clientsParMotCle(String mc);
		public List<Client> getClient(Long idC);
		public boolean supprimerClient(Long idC);
		public boolean modifierClient(Client c);
	//Clients
}
