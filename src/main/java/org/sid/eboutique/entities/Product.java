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
@Table(name="products")
public class Product implements Serializable{
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idProduit;
		@NotEmpty
	private String article;
	private String type;
	private String taille;
	private String qualite;
	private String marque;
	private double prix;
	private String couleur;
	@Lob
	private String image;
	private int quantite;
	private int quantiteCommande;
	
	@OneToMany(mappedBy="product" , cascade= {CascadeType.PERSIST ,CascadeType.REMOVE})
	private Collection<LigneCommande> lignes;
	
	private Long idClient;
	
	public Long getIdClient() {
		return idClient;
	}
	
	public void setIdClient(Long idClient) {
		this.idClient = idClient;
	}
	
	public String getCouleur() {
		return couleur;
	}

	public void setCouleur(String couleur) {
		this.couleur = couleur;
	}

	public Collection<LigneCommande> getLignes() {
		return lignes;
	}

	public void setLignes(Collection<LigneCommande> lignes) {
		this.lignes = lignes;
	}

	public Long getIdProduit() {
		return idProduit;
	}
	
	public void setIdProduit(Long idProduit) {
		this.idProduit = idProduit;
	}
	
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	
	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTaille() {
		return taille;
	}

	public void setTaille(String taille) {
		this.taille = taille;
	}

	public String getQualite() {
		return qualite;
	}

	public void setQualite(String qualite) {
		this.qualite = qualite;
	}

	public String getMarque() {
		return marque;
	}

	public void setMarque(String marque) {
		this.marque = marque;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Product() {
		super();
	}
	
	public Product(Long idProduit , int quantite) {
		this.idProduit = idProduit;
		this.quantite = quantite;
	}
	
}
