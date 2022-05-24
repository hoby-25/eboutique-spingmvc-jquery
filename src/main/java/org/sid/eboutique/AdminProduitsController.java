package org.sid.eboutique;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.sid.eboutique.entities.Categorie;
import org.sid.eboutique.entities.Client;
import org.sid.eboutique.entities.Produit;
import org.sid.eboutique.metier.IAdminProduitsMetier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value="/adminProd")
public class AdminProduitsController {
	@Autowired
	private IAdminProduitsMetier metier;
	
	@RequestMapping(value="/index")
	public String index(Model model) {
		model.addAttribute("produit" , new Produit());
		model.addAttribute("produit" , metier.listproduits());
		return "produits";
	}
	
	@RequestMapping(value="/saveProd")
	public String saveProd(@Valid Produit p ,BindingResult bindingResult,Model model,
			MultipartFile file) throws IOException{
		//S'il y a erreur au niveau de la formulaire
		if(bindingResult.hasErrors()) {
			model.addAttribute("categories",metier.listCategories());
			model.addAttribute("produits",metier.listproduits());
			return("produits");
		}
		if(!file.isEmpty()) {
			String path = System.getProperty("java.io.tmpdir");
			p.setPhoto(file.getOriginalFilename());
			Long idP = null;
			if(p.getIdProduit() == null) {
				idP = metier.ajouterProduit(p);	
			}
			else {
				metier.modifierProduit(p);
				idP = p.getIdProduit();
			}
			//	On prend le nom du fichier
			file.transferTo(new File(path+"/" + "PROD_" + idP + "_" + file.getOriginalFilename()));
			//p.setPhoto(path);
		}
		else {
			if(p.getIdProduit() == null)
				metier.ajouterProduit(p);
			else 
				metier.modifierProduit(p);
		}
		model.addAttribute("produit", new Produit());
		model.addAttribute("produits", metier.listproduits());
		model.addAttribute("categories", metier.listCategories());
		return "produits";
	}
	
	@RequestMapping(value="/suppProd")
	public String suppProd(Long idProd,Model model) {
		metier.supprimerProduit(idProd);
		model.addAttribute("produit", new Produit());
		model.addAttribute("produits", metier.listproduits());
		model.addAttribute("categories" , metier.listCategories());
		return "produits";
	} 
	
	@RequestMapping(value="/editProd")
	public String editCat(Long idProd, Model model) {
		Produit p = metier.getProduit(idProd);
		model.addAttribute("produit", p );
		model.addAttribute("produits", metier.listproduits());
		model.addAttribute("categories" , metier.listCategories());
		return "produits";
	}
	
	@RequestMapping(value="photoProd",produces=MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] photProd(Long idProd) throws IOException {
		Produit p = metier.getProduit(idProd);
		File f = new File(System.getProperty("java.io.tmpdir") + "/PROD_" +idProd + "_" + p.getPhoto());
		//System.out.println(c.getPhoto()); 
		return IOUtils.toByteArray(new FileInputStream(f));
	}
}
