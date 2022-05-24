package org.sid.eboutique;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sid.eboutique.entities.Produit;
import org.sid.eboutique.metier.IAdminProduitsMetier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/jquery")
public class JQueryController {
	@Autowired
	private IAdminProduitsMetier metier;
	
	@RequestMapping(value="/index")
	public String index(Model model) {
		model.addAttribute("produit", new Produit());
		model.addAttribute("produits", metier.listproduits());
		model.addAttribute("categories" , metier.listCategories());
		return "produits";
	}
	@RequestMapping(value="/page" , method= RequestMethod.GET)
	public ModelAndView getPage() {
		ModelAndView view = new ModelAndView("jquery");
		return view;
	}
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public @ResponseBody Map<String,Object> getAll(Produit produit){
		Map<String,Object> map = new HashMap<String,Object>();
			List<Produit> produits = metier.listproduits2();
			if (produits != null){
				map.put("status","200");
				map.put("message","Data found");
				map.put("data", produits);
			}else{
				map.put("status", "404");
				map.put("message","Data not found");
			}
		return map;
	}
}
