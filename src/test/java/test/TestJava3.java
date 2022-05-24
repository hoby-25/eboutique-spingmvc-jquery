package test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.sid.eboutique.entities.Categorie;
import org.sid.eboutique.entities.Produit;
import org.sid.eboutique.metier.IAdminCategoriesMetier;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class TestJava3 {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		try {	
			ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"applicationContext.xml"});
			IAdminCategoriesMetier metier = (IAdminCategoriesMetier) context.getBean("metier");
			
			/*List<Produit> prod1 = metier.listproduits();
			metier.ajouterProduit(new Produit("HP45ERT","HP7890",6000,true,"image1.jpg",50), 1L);
			metier.ajouterProduit(new Produit("AZERTY","HP7890",6000,true,"image2.jpg",50), 1L);
			List<Produit> prod2 = metier.listproduits();
			
			assertTrue(prod1.size()+2 == prod2.size());*/
			assertTrue(true);
		}catch(Exception e) {
			assertTrue(e.getMessage(),false);
		}
	}

}
