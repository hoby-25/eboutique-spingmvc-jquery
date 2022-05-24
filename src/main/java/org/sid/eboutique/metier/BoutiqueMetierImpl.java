package org.sid.eboutique.metier;

import java.util.List;

import org.sid.eboutique.dao.IBoutiqueDao;
import org.sid.eboutique.entities.Categorie;
import org.sid.eboutique.entities.Client;
import org.sid.eboutique.entities.Commande;
import org.sid.eboutique.entities.LigneCommande;
import org.sid.eboutique.entities.Panier;
import org.sid.eboutique.entities.Product;
import org.sid.eboutique.entities.Produit;
import org.sid.eboutique.entities.Role;
import org.sid.eboutique.entities.User;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class BoutiqueMetierImpl implements IAdminCategoriesMetier {
	private IBoutiqueDao dao;
	
	public void setDao(IBoutiqueDao dao) {
		this.dao = dao;
	}
	
	@Override
	public Long ajouterProduit(Produit p) {
		return dao.ajouterProduit(p);
	}

	@Override
	public void supprimerProduit(Long idP) {
		dao.supprimerProduit(idP);
	}

	@Override
	public void modifierProduit(Produit p) {
		dao.modifierProduit(p);
	}

	@Override
	public List<Categorie> listCategories() {
		return dao.listCategories();
	}

	@Override
	public Categorie getCategorie(Long idCat) {
		return dao.getCategorie(idCat);
	}

	@Override
	public List<Produit> listproduits() {
		// TODO Auto-generated method stub
		return dao.listproduits();
	}

	@Override
	public List<Produit> produitsParMotCle(String mc) {
		return dao.produitsParMotCle(mc);
	}

	@Override
	public List<Produit> produitsParCategorie(Long idCat) {
		return dao.produitsParCategorie(idCat);
	}

	@Override
	public List<Produit> produitSelectionnes() {
		return dao.produitSelectionnes();
	}

	@Override
	public Produit getProduit(Long idP) {
		return dao.getProduit(idP);
	}

	@Override
	public Commande enregistrerCommande(Panier p, Client c) {
		return dao.enregistrerCommande(p, c);
	}

	@Override
	public Long ajouterCategorie(Categorie c) {
		return dao.ajouterCategorie(c);
	}

	@Override
	public void supprimerCategorie(Long idcat) {
		dao.supprimerCategorie(idcat);
	}

	@Override
	public void modifierCategorie(Categorie c) {
		dao.modifierCategorie(c);
	}

	@Override
	public void ajouterUser(User u) {
		dao.ajouterUser(u);
	}

	@Override
	public void attribuerRole(Role r, Long userID) {
		dao.attribuerRole(r, userID);
	}

	@Override
	public List<Produit> listproduits2() {
		return dao.listproduits2();
	}

	@Override
	public boolean ajouterClient(Client c) {
		dao.ajouterClient(c);
		return true;
	}

	@Override
	public List<Client> listClients() {
		return dao.listClients();
	}

	@Override
	public List<Client> clientsParMotCle(String mc) {
		return dao.clientsParMotCle(mc);
	}

	@Override
	public List<Client> getClient(Long idC) {
		return dao.getClient(idC);
	}

	@Override
	public boolean supprimerClient(Long idC) {
		return dao.supprimerClient(idC);
	}

	@Override
	public boolean modifierClient(Client c) {
		return dao.modifierClient(c);
	}

	@Override
	public boolean ajouterProduct(Product p) {
		return dao.ajouterProduct(p);
	}

	@Override
	public List<Product> listproducts() {
		return dao.listproducts();
	}

	@Override
	public List<Product> productsParMotCle(String mc) {
		return dao.productsParMotCle(mc);
	}

	@Override
	public List<Product> productsParCategorie(Long idCat) {
		return dao.productsParCategorie(idCat);
	}

	@Override
	public List<Product> productSelectionnes() {
		return dao.productSelectionnes();
	}

	@Override
	public Product getProduct(Long idP) {
		return dao.getProduct(idP);
	}

	@Override
	public boolean supprimerProduct(Long idP) {
		return dao.supprimerProduct(idP);
	}
	
	@Override
	public boolean modifierProduct(Product p) {
		return dao.modifierProduct(p);
	}

	@Override
	public List<Product> lancerRecherche(String article, String type, String taille, String marque, String couleur) {
		return dao.lancerRecherche(article, type, taille, marque, couleur);
	}

	@Override
	public Long ajouterCommande(Commande commande) {
		return dao.ajouterCommande(commande);
	}

	@Override
	public Client recupererClient(Long idC) {
		return dao.recupererClient(idC);
	}

	@Override
	public Commande getCommande(Long idC) {
		return dao.getCommande(idC);
	}

	@Override
	public Long addLigneCommande(LigneCommande ligne) {
		return dao.addLigneCommande(ligne);
	}

	@Override
	public Long sommeRobe() {
		return dao.sommeRobe();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireBanane() {
		return dao.getChartChiffreAffaireBanane();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffairePochette() {
		return dao.getChartChiffreAffairePochette();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireCartable() {
		return dao.getChartChiffreAffaireCartable();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireCoffret() {
		return dao.getChartChiffreAffaireCoffret();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireRobe() {
		return dao.getChartChiffreAffaireRobe();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireTunnique() {
		return dao.getChartChiffreAffaireTunnique();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireShort() {
		return dao.getChartChiffreAffaireShort();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffairePatalon() {
		return dao.getChartChiffreAffairePatalon();
	}

	@Override
	public List<Product> getChartbananeStock() {
		// TODO Auto-generated method stub
		return dao.getChartbananeStock();
	}

	@Override
	public List<Product> getChartcoffretStock() {
		// TODO Auto-generated method stub
		return dao.getChartcoffretStock();
	}

	@Override
	public List<Product> getChartcartableStock() {
		return dao.getChartcartableStock();
	}

	@Override
	public List<Product> getChartpochetteStock() {
		// TODO Auto-generated method stub
		return dao.getChartpochetteStock();
	}

	@Override
	public List<Product> getChartpatalonStock() {
		// TODO Auto-generated method stub
		return dao.getChartpatalonStock();
	}

	@Override
	public List<Product> getChartshortStock() {
		// TODO Auto-generated method stub
		return dao.getChartshortStock();
	}

	@Override
	public List<Product> getCharttunniqueStock() {
		// TODO Auto-generated method stub
		return dao.getCharttunniqueStock();
	}

	@Override
	public List<Product> getChartrobeStock() {
		// TODO Auto-generated method stub
		return dao.getChartrobeStock();
	}
}
