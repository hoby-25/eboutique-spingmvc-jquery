package org.sid.eboutique;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.sid.eboutique.entities.Product;
import org.sid.eboutique.metier.IAdminProduitsMetier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Controller
@RequestMapping(value="/adminProduct")
public class AdminProduitController {
	@Autowired
	private IAdminProduitsMetier metier;
	@Autowired
	ServletContext context;
	
	//lancerRecherche(String article, String type, String taille, String marque, String couleur) 
	
	@RequestMapping(value="/lancerRecherche" , method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> lancerRecherche(Product product) {
		Map<String,Object> map = new HashMap<String,Object>();
		String article = product.getArticle();
		String type = product.getType();
		String taille = product.getTaille();
		String couleur = product.getCouleur();
		String marque = product.getMarque();
		
		List<Product> produits = metier.lancerRecherche(article, type, taille, marque, couleur);
		map.put("data" , produits);
		return map;
	}
	
	@RequestMapping(value="/listProduit" , method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> index(Product product) {
		Map<String,Object> map = new HashMap<String,Object>();
		List<Product> produits = metier.listproducts();
		map.put("data" , produits);
		return map;
	}
	
	@RequestMapping(value="/deleteProduct", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> deleteProduct(Long idProduit){
		Map<String,Object> map = new HashMap<String,Object>();
		if(metier.supprimerProduct(idProduit)){
			map.put("status","200");
			map.put("message","Product est éffacé");
		}
		return map;
	}	
	
	@RequestMapping(value="/updateProduit", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> updateProduit(Product product){
		Map<String,Object> map = new HashMap<String,Object>();
		if(metier.modifierProduct(product)){
			map.put("status","200");
			map.put("message","Product is successfully updated");
		}
		return map;
	}
	
	@RequestMapping(value="/productsParMotCle" , method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> productsParMotCle(String motCles) {
		Map<String,Object> map = new HashMap<String,Object>();
		List<Product> produits = metier.productsParMotCle(motCles);
		map.put("data" , produits);
		return map;
	}
	
	@RequestMapping(value="/fileUpload",method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> fileUpload(MultipartHttpServletRequest request ,HttpServletResponse response ){
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		Iterator<String> itr = request.getFileNames();
		MultipartFile mpf = null;
		while(itr.hasNext()) {
			mpf = request.getFile(itr.next());
			try {
				FileCopyUtils.copy(mpf.getBytes() , new FileOutputStream(context.getRealPath("/resources")+"/"+mpf.getOriginalFilename().replace(" ", "-")));
				list.add(mpf.getOriginalFilename().replace(" ", "-"));
			}catch(IOException ex) {
				ex.printStackTrace();
			}
		}
		map.put("Status", 200);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/ajouterStock", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> ajouterStock(Product product){
		Map<String,Object> map = new HashMap<String,Object>();
		if(metier.modifierProduct(product)){
			map.put("status","200");
			map.put("message","ajouterStock was successfull");
		}
		return map;
	}
	
	@RequestMapping(value="/ajouterProduit", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> ajouterProduit(Product product){
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println("Artcileroduit = " + product.getIdClient());
		if(metier.ajouterProduct(product)){
			System.out.println("Artcileroduit = " + product.getArticle());
			map.put("status","200");
			map.put("message","ajouterProduit was successfull");
		}
		return map;
	}
}
