package org.sid.eboutique.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.sid.eboutique.entities.*;

public class BoutiqueDaoImpl implements IBoutiqueDao {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Long ajouterCategorie(Categorie c) {
		em.persist(c);
		return c.getIdcategorie();
	}

	@Override
	public List<Categorie> listCategories() {
		Query req = em.createQuery("select c from Categorie c");
		return req.getResultList();
	}

	@Override
	public Categorie getCategorie(Long idCat) {
		return em.find(Categorie.class , idCat);
	}

	@Override
	public void supprimerCategorie(Long idcat) {
		Categorie c = em.find(Categorie.class, idcat);
		em.remove(c);
	}

	@Override
	public void modifierCategorie(Categorie c) {
		em.merge(c);
	}

	@Override
	public Long ajouterProduit(Produit p) {
		em.persist(p);
		return p.getIdProduit();
	}

	@Override
	public List<Produit> listproduits() {
		Query req = em.createQuery("select p from Produit p");
		return req.getResultList();
	}
	@Override
	public List<Produit> listproduits2() {
		Query req = em.createQuery("select p.idProduit , p.description , p.designation , p.prix , p.quantite ,p.selected from Produit p");
		return req.getResultList();
	}

	@Override
	public List<Produit> produitsParMotCle(String mc) {
		Query req = em.createQuery("select p from Produit p"
				+ "where p.designation like :x or p.description like :y");
		req.setParameter("x" , "%"+mc+"%");
		req.setParameter("y" , "%"+mc+"%");
		return req.getResultList();
	}

	@Override
	public List<Produit> produitsParCategorie(Long idCat) {
		Query req = em.createQuery("select p from Produit p"
				+ "where p.categorie.idcategorie=:x");
		req.setParameter("x" , idCat);
		return req.getResultList();
	}

	@Override
	public List<Produit> produitSelectionnes() {
		Query req = em.createQuery("select p from Produit p"
				+ "where p.selected=true");
		return req.getResultList();
	}

	@Override
	public Produit getProduit(Long idP) {
		return em.find(Produit.class, idP);
	}

	@Override
	public void supprimerProduit(Long idP) {
		Produit p = getProduit(idP);
		em.remove(p);
	}

	@Override
	public void modifierProduit(Produit p) {
		em.merge(p);
	}

	@Override
	public void ajouterUser(User u) {
		em.persist(u);
	}

	@Override
	public void attribuerRole(Role r, Long userID) {
		User u = em.find(User.class, userID);
		u.getRoles().add(r);
		em.persist(r);
	}

	@Override
	public Commande enregistrerCommande(Panier p, Client c) {
		/*em.persist(c);
		Commande cmd = new Commande();
		cmd.setDateCommande(new Date());
		cmd.setItems(p.getItems());
		for(LigneCommande lc : p.getItems()) {
			em.persist(lc);
		}
		em.persist(cmd);*/
		return null;
	}

	@Override
	public boolean ajouterClient(Client c) {
		em.persist(c);
		return true;
	}

	@Override
	public List<Client> listClients() {
		Query req = em.createQuery("select c.nomClient, c.prenomClient , c.adresse , c.tel1, c.tel2, c.tel3 , c.idClient from Client c"); 
		return req.getResultList();
	}

	@Override
	public List<Client> clientsParMotCle(String mc) {
		Query req = em.createQuery("select c from Client c"
				+ "where c.nomClient like :x or c.prenomClient like :y");
		req.setParameter("x" , "%"+mc+"%");
		req.setParameter("y" , "%"+mc+"%");
		return req.getResultList();
	}

	@Override
	public List<Client> getClient(Long idC) {
		Query req = em.createQuery("select c.nomClient, c.prenomClient , c.adresse , c.tel1, c.tel2, c.tel3 , c.idClient from Client c where c.idClient = :x"); 
		req.setParameter("x", idC);
		return req.getResultList();
	}

	@Override
	public boolean supprimerClient(Long idC) {
		Client c = em.find(Client.class, idC);
		em.remove(c);
		return true;
	}
	
	@Override
	public boolean modifierClient(Client c) {
		em.merge(c);
		return true;
	}

	@Override
	public boolean ajouterProduct(Product p) {
		em.persist(p);
		return true;
	}

	@Override
	public List<Product> listproducts() {
		Query req = em.createQuery("select p.idProduit, p.prix , p.quantite , p.article, p.image, p.marque , p.qualite , p.taille , p.type , p.couleur , p.quantiteCommande  from Product p where p.quantite != 0 "); 
		return req.getResultList();
	}

	@Override
	public List<Product> productsParMotCle(String mc) {
		Query req = em.createQuery("select p.idProduit, p.prix , p.quantite , p.article, p.image, p.marque , p.qualite , p.taille , p.type , p.couleur from Product p where p.article like :mc or p.type like :mc or p.taille like :mc or p.marque like :mc or p.couleur like :mc");
		req.setParameter("mc" , "%"+mc+"%");
		return req.getResultList();
	}

	@Override
	public List<Product> productsParCategorie(Long idCat) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> productSelectionnes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product getProduct(Long idP) {
		return em.find(Product.class, idP);
	}

	@Override
	public boolean supprimerProduct(Long idP) {
		Product p = em.find(Product.class, idP);
		em.remove(p);
		return true;
	}

	@Override
	public boolean modifierProduct(Product p) {
		em.merge(p);
		return true;
	}

	@Override
	public List<Product> lancerRecherche(String article, String type, String taille, String marque, String couleur) {
		Query req = em.createQuery("select p.idProduit, p.prix , p.quantite , p.article, p.image, p.marque , p.qualite , p.taille , p.type , p.couleur from Product p where p.article like :article and p.type like :type and p.taille like :taille and p.marque like :marque and p.couleur like :couleur");
		req.setParameter("article" , "%"+article+"%");
		req.setParameter("type" , "%"+type+"%");
		req.setParameter("taille" , "%"+taille+"%");
		req.setParameter("marque" , "%"+marque+"%");
		req.setParameter("couleur" , "%"+couleur+"%");
		return req.getResultList();
	}

	@Override
	public Long ajouterCommande(Commande commande) {
		em.persist(commande);
		return commande.getIdCommande();
	}

	@Override
	public Client recupererClient(Long idC) {
		return em.find(Client.class, idC);
	}

	@Override
	public Commande getCommande(Long idC) {
		return em.find(Commande.class, idC);
	}

	@Override
	public Long addLigneCommande(LigneCommande ligne) {
		em.persist(ligne);
		return ligne.getId();
	}

	@Override
	public Long sommeRobe() {
		return null;
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireBanane() {
		Query req = em.createQuery("select sum(l.prix) as prix from LigneCommande l, Product p where l.idProd = p.idProduit and p.type = :type ");
		req.setParameter("type" , "Banane");
		return req.getResultList();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffairePochette() {
		Query req = em.createQuery("select sum(l.prix) as prix from LigneCommande l, Product p where l.idProd = p.idProduit and p.type = :type ");
		req.setParameter("type" , "Pochette");
		return req.getResultList();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireCartable() {
		Query req = em.createQuery("select sum(l.prix) as prix from LigneCommande l, Product p where l.idProd = p.idProduit and p.type = :type ");
		req.setParameter("type" , "Cartable");
		return req.getResultList();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireCoffret() {
		Query req = em.createQuery("select sum(l.prix) as prix from LigneCommande l, Product p where l.idProd = p.idProduit and p.type = :type ");
		req.setParameter("type" , "Coffret");
		return req.getResultList();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireRobe() {
		Query req = em.createQuery("select sum(l.prix) as prix from LigneCommande l, Product p where l.idProd = p.idProduit and p.type = :type ");
		req.setParameter("type" , "Robe");
		return req.getResultList();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireTunnique() {
		Query req = em.createQuery("select sum(l.prix) as prix from LigneCommande l, Product p where l.idProd = p.idProduit and p.type = :type ");
		req.setParameter("type" , "Tunnique");
		return req.getResultList();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffaireShort() {
		Query req = em.createQuery("select sum(l.prix) as prix from LigneCommande l, Product p where l.idProd = p.idProduit and p.type = :type ");
		req.setParameter("type" , "Short");
		return req.getResultList();
	}

	@Override
	public List<LigneCommande> getChartChiffreAffairePatalon() {
		Query req = em.createQuery("select sum(l.prix) as prix from LigneCommande l, Product p where l.idProd = p.idProduit and p.type = :type ");
		req.setParameter("type" , "Patalon");
		return req.getResultList();
	}

	@Override
	public List<Product> getChartbananeStock() {
		Query req = em.createQuery("select sum(p.quantite) from Product p where p.type = :type");
		req.setParameter("type" , "Banane");
		return req.getResultList();
	}

	@Override
	public List<Product> getChartcoffretStock() {
		Query req = em.createQuery("select sum(p.quantite) from Product p where p.type = :type");
		req.setParameter("type" , "Coffret");
		return req.getResultList();
	}

	@Override
	public List<Product> getChartcartableStock() {
		Query req = em.createQuery("select sum(p.quantite) from Product p where p.type = :type");
		req.setParameter("type" , "Cartable");
		return req.getResultList();
	}

	@Override
	public List<Product> getChartpochetteStock() {
		Query req = em.createQuery("select sum(p.quantite) from Product p where p.type = :type");
		req.setParameter("type" , "Pochette");
		return req.getResultList();
	}

	@Override
	public List<Product> getChartpatalonStock() {
		Query req = em.createQuery("select sum(p.quantite) from Product p where p.type = :type");
		req.setParameter("type" , "Patalon");
		return req.getResultList();
	}

	@Override
	public List<Product> getChartshortStock() {
		Query req = em.createQuery("select sum(p.quantite) from Product p where p.type = :type");
		req.setParameter("type" , "Short");
		return req.getResultList();
	}

	@Override
	public List<Product> getCharttunniqueStock() {
		Query req = em.createQuery("select sum(p.quantite) from Product p where p.type = :type");
		req.setParameter("type" , "Tunnique");
		return req.getResultList();
	}

	@Override
	public List<Product> getChartrobeStock() {
		Query req = em.createQuery("select sum(p.quantite) from Product p where p.type = :type");
		req.setParameter("type" , "Robe");
		return req.getResultList();
	}
}
