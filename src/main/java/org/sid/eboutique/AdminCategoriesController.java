package org.sid.eboutique;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.sid.eboutique.entities.Categorie;
import org.sid.eboutique.metier.IAdminCategoriesMetier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/adminCat")
@SessionAttributes(value="editedCat")
public class AdminCategoriesController implements HandlerExceptionResolver {
	@Autowired
	private IAdminCategoriesMetier metier;
	
	@RequestMapping(value="/index")
	public String index(Model model) {
		model.addAttribute("categorie", new Categorie());
		model.addAttribute("categories", metier.listCategories());
		return "categories";
	}
	
	
	
	@RequestMapping(value="/saveCat")
	public String saveCat(@Valid Categorie c ,BindingResult bindingResult,Model model,
			MultipartFile file) throws IOException{
		if(bindingResult.hasErrors()) {
			model.addAttribute("categories",metier.listCategories());
			return("categories");
		}
		if(!file.isEmpty()) {
			//Verification si le fichier s'agit d'une photo
			BufferedImage bi = ImageIO.read(file.getInputStream());
			c.setPhoto(file.getBytes());
			c.setNomPhoto(file.getOriginalFilename());
		}
		if(c.getIdcategorie() != null) {
			if(model.asMap().get("editedCat") != null) 
			{
				if(file.isEmpty()) {
					Categorie cat = (Categorie) model.asMap().get("editedCat");
					c.setPhoto(cat.getPhoto());
				}
			}
			metier.modifierCategorie(c);
		}
		else {
			metier.ajouterCategorie(c);
		}
		model.addAttribute("categorie", new Categorie());
		model.addAttribute("categories", metier.listCategories());
		return "categories";
	}
	
	@RequestMapping(value="suppCat")
	public String supprimer(Long idCat,Model model) {
		metier.supprimerCategorie(idCat);
		model.addAttribute("categorie" , new Categorie());
		model.addAttribute("categories" , metier.listCategories());
		return "categories";
	}
	
	@RequestMapping(value="editCat")
	public String editCat(Long idCat, Model model) {
		Categorie c = metier.getCategorie(idCat);
		model.addAttribute("categorie",c);
		model.addAttribute("categories" , metier.listCategories());
		return "categories";
	}
	
	//Retourne une image JPEG
	@RequestMapping(value="photoCat",produces=MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] photCat(Long idCat) throws IOException {
		Categorie c = metier.getCategorie(idCat);
		//System.out.println(c.getPhoto()); 
		return IOUtils.toByteArray(new ByteArrayInputStream(c.getPhoto()));
	}
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, 
			Object arg2,Exception ex) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("exception", ex.getMessage());
		mv.setViewName("categories");
		return mv;
	}
}
