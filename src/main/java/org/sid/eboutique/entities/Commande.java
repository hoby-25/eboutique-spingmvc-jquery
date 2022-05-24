package org.sid.eboutique.entities;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
@Entity
public class Commande implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idCommande;
	private String dateCommande;
	private Long idCli;
	
	@OneToMany(mappedBy="commande" , cascade= {CascadeType.PERSIST ,CascadeType.REMOVE})
	private Collection<LigneCommande> items;
	
	@ManyToOne
	@JoinColumn(name="idClient")
	private Client client;
	
	public Long getIdCli() {
		return idCli;
	}
	public void setIdCli(Long idCli) {
		this.idCli = idCli;
	}
	
	public Long getIdCommande() {
		return idCommande;
	}
	public void setIdCommande(Long idCommande) {
		this.idCommande = idCommande;
	}
	public String getDateCommande() {
		return dateCommande;
	}
	public void setDateCommande(String dateCommande) {
		this.dateCommande = dateCommande;
	}
	public Collection<LigneCommande> getItems() {
		return items;
	}
	public void setItems(Collection<LigneCommande> items) {
		this.items = items;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Commande() {
		super();
	}
}
