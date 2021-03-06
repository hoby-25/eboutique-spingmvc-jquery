package org.sid.eboutique.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="produit")
public class Produit implements Serializable{
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idProduit;
		@NotEmpty
		@Size(min=4 , max=15)
	private String designation;
	private String description;
	private double prix;
	private boolean selected;
	@Lob
	private String photo;
	private int quantite;
	@ManyToOne
	@JoinColumn(name="idCategorie")
	private Categorie categorie;
	
	/*@OneToMany(mappedBy="produit" , cascade= {CascadeType.PERSIST ,CascadeType.REMOVE})
	private Collection<LigneCommande> lignes;*/
	
	public Categorie getCategorie() {
		return categorie;
	}

	public void setCategorie(Categorie categorie) {
		this.categorie = categorie;
	}

	public Long getIdProduit() {
		return idProduit;
	}
	
	public void setIdProduit(Long idProduit) {
		this.idProduit = idProduit;
	}
	
	public String getDesignation() {
		return designation;
	}
	
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public boolean isSelected() {
		return selected;
	}
	public void setSelected(boolean selected) {
		this.selected = selected;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	
	public Produit() {
		super();
	}
	public Produit(String designation, String description, double prix, boolean selected, String photo, int quantite) {
		super();
		this.designation = designation;
		this.description = description;
		this.prix = prix;
		this.selected = selected;
		this.photo = photo;
		this.quantite = quantite;
	}
}
