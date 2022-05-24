package org.sid.eboutique;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sid.eboutique.entities.Client;
import org.sid.eboutique.entities.Commande;
import org.sid.eboutique.entities.LigneCommande;
import org.sid.eboutique.entities.Product;
import org.sid.eboutique.metier.CaissierMetier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller 
@RequestMapping(value="/caissier")
public class CaissierController {
	@Autowired
	private CaissierMetier metier;
	
	@RequestMapping(value="/client" , method= RequestMethod.GET)
	public ModelAndView getPage() {
		ModelAndView view = new ModelAndView("client");
		return view;
	}
	
	@RequestMapping(value="/getChartChiffreAffaireEtStock" , method=RequestMethod.GET)
	public @ResponseBody Map<String,Object> getChartChiffreAffaireSac(){
		Map<String , Object> map = new HashMap<String,Object>();
		List<LigneCommande> ligne = metier.getChartChiffreAffaireBanane();
		
		map.put("banane", metier.getChartChiffreAffaireBanane());
		map.put("coffret", metier.getChartChiffreAffaireCoffret());
		map.put("cartable", metier.getChartChiffreAffaireCartable());
		map.put("pochette", metier.getChartChiffreAffairePochette());
		
		map.put("patalon", metier.getChartChiffreAffairePatalon());
		map.put("short", metier.getChartChiffreAffaireShort());
		map.put("tunnique", metier.getChartChiffreAffaireTunnique());
		map.put("robe", metier.getChartChiffreAffaireRobe());
		
		map.put("bananeStock", metier.getChartbananeStock());
		map.put("coffretStock", metier.getChartcoffretStock());
		map.put("cartableStock", metier.getChartcartableStock());
		map.put("pochetteStock", metier.getChartpochetteStock());
		
		map.put("patalonStock", metier.getChartpatalonStock());
		map.put("shortStock", metier.getChartshortStock());
		map.put("tunniqueStock", metier.getCharttunniqueStock());
		map.put("robeStock", metier.getChartrobeStock());

		return map;
	}
	
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getAll(Client client){
		Map<String,Object> map = new HashMap<String,Object>();
			List<Client> clients = metier.listClients();
			map.put("data" , clients);
		return map;
	}
	
	@RequestMapping(value="/ajouterCommande" , method= RequestMethod.POST)
	public @ResponseBody Map<String,Object>  ajouterCommande(Commande c) {
		Client client = metier.recupererClient(c.getIdCli());
		c.setClient(client);
		
		Long idCommande = metier.ajouterCommande(c);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("data" , idCommande);
		return map;
	}
	
	@RequestMapping(value="/ajouterLigneCommande" , method= RequestMethod.POST)
	public @ResponseBody Map<String,Object>  ajouterLigneCommande(LigneCommande ligneDeCommande) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		// GET product and commande
		Product product = metier.getProduct(ligneDeCommande.getIdProd());
		Commande commande = metier.getCommande(ligneDeCommande.getIdCom());
		
		// SET ligne de commande 
		ligneDeCommande.setCommande(commande);
		ligneDeCommande.setProduct(product);
		
		// POST ligne de commande
		Long idLigne = metier.addLigneCommande(ligneDeCommande);
		
		// UPDATE STOCK  
		//getProduit
		product.setQuantite(ligneDeCommande.getQuantiteProd());
		// Update 
		Boolean modification = metier.modifierProduct(product);
		
		
		map.put("data",modification);
		return map;
	}
	
	@RequestMapping(value="/enregistreClient", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> enregistreClient(Client client){
		Map<String,Object> map = new HashMap<String,Object>();
		if(metier.ajouterClient(client)) {
			map.put("status","200");
			map.put("message","Your record have been saved successfully");
		}
		return map;
	}
	
	@RequestMapping(value="/getClient", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getClient(Long idClient){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Client> clients = metier.getClient(idClient);
			map.put("status","200");
			map.put("message","get clients successfully");
			map.put("data", clients);
		return map;
	}
	
	@RequestMapping(value="/updateClient", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateClient(Client client){
		Map<String,Object> map = new HashMap<String,Object>();
		if(metier.modifierClient(client)) {
			map.put("status","200");
			map.put("message","Your record have been saved successfully");
		}
		return map;
	}
	
	@RequestMapping(value="/deleteClient", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> deleteClient(Long idClient){
		Map<String,Object> map = new HashMap<String,Object>();
		if(metier.supprimerClient(idClient)){
			map.put("status","200");
			map.put("message","Your record have been deleted successfully");
		}
		return map;
	}
}
