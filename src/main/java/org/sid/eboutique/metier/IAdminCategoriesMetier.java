package org.sid.eboutique.metier;

import java.util.List;

import org.sid.eboutique.entities.Categorie;
import org.sid.eboutique.entities.Client;
import org.sid.eboutique.entities.Produit;
import org.sid.eboutique.entities.Role;
import org.sid.eboutique.entities.User;

public interface IAdminCategoriesMetier extends IAdminProduitsMetier {
	public Long ajouterCategorie(Categorie c);
	public void supprimerCategorie(Long idcat);
	public void modifierCategorie(Categorie c);
	public void ajouterUser(User u);
	public void attribuerRole(Role r, Long userID);
	List<Produit> listproduits2();
	
}
