package org.sid.eboutique.entities;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.springframework.beans.factory.annotation.Autowired;

@Entity
public class Client implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idClient;
	private String nomClient;
	private String prenomClient;
	private String adresse;
	private String tel1;
	private String tel2;
	private String tel3;
	
	@OneToMany(mappedBy="client" , cascade= {CascadeType.PERSIST ,CascadeType.REMOVE})
	private Collection<Commande> commandes;
	
	public String getPrenomClient() {
		return prenomClient;
	}
	
	public void setPrenomClient(String prenomClient) {
		this.prenomClient = prenomClient;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	
	public Long getIdClient() {
		return idClient;
	}
	public void setIdClient(Long idClient) {
		this.idClient = idClient;
	}
	public String getNomClient() {
		return nomClient;
	}
	public void setNomClient(String nomClient) {
		this.nomClient = nomClient;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public Collection<Commande> getCommandes() {
		return commandes;
	}
	public void setCommandes(Collection<Commande> commandes) {
		this.commandes = commandes;
	}
	public Client() {
		super();
	}
	public Client( String nomClient, String prenomClient, String adresse, String tel1, String tel2,
			String tel3) {
		super();
		this.nomClient = nomClient;
		this.prenomClient = prenomClient;
		this.adresse = adresse;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
	}
	
}
