package org.sid.eboutique.entities;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class LigneCommande implements Serializable {
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
		@ManyToOne
		@JoinColumn(name="idProduit")
	private Product product;
		
	private int quantite;
	private double prix;
	
	private Long idProd;
	private Long idCom;
	
	private int quantiteProd;
	
		@ManyToOne
		@JoinColumn(name="idCommande")
	private Commande commande;
	
	public int getQuantiteProd() {
		return quantiteProd;
	}
	
	public void setQuantiteProd(int quantiteProd) {
		this.quantiteProd = quantiteProd;
	}
	
	public Long getIdProd() {
		return idProd;
    }
	public void setIdProd(Long idProd) {
		this.idProd = idProd;
	}
	public Long getIdCom() {
		return idCom;
	}
	public void setIdCom(Long idCom) {
		this.idCom = idCom;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantite() {
		return quantite;
	}
	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public Commande getCommande() {
		return commande;
	}
	public void setCommande(Commande commande) {
		this.commande = commande;
	}
	public LigneCommande() {
		super();
	}
	public LigneCommande(int quantite, double prix) {
		super();
		this.quantite = quantite;
		this.prix = prix;
	}
	
}
