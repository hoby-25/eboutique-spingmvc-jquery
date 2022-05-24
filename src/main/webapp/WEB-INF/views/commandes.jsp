<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <div class="inbox-area">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="inbox-left-sd">

                        <div class="material-design-btn">
                            <a class="btn notika-btn-cyan" href="#" style="font-size: 1.3em;">RECHERCHE RAPIDE </a>
                        </div>
                        <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10 " style="margin-bottom: 5px;">
                             <span style="font-size: 1.0em;margin-left: 0%;" id="commandeNomClient" ></span>
                              <span style="font-size: 1.0em;margin-left: 0%;" id="commandePrenomClient"></span>
                        </div>
                        <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10 ">
                             <span style="font-weight: bold;font-size: 1.2em;margin-left: 0%;">Article : </span>
                        </div>
                        <div style="margin-left:10%;margin-bottom:20px;">
                            <select id="articleCommande" style="background-color:white;width:200px;">
                                <option VALUE=""> -- Tout -- </option>
                                <option VALUE="Vêtement">Vêtement</option>
                                <option VALUE="Sac">Sac</option>    
                            </select>
                        </div>
                        <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10 ">
                             <span style="font-weight: bold;font-size: 1.2em;margin-left: 0%;">Type du produit : </span>
                        </div>
                        <div style="width:80%;margin-left:10%;margin-bottom:20px;">
                            <select id="typeCommande" style="background-color:white;width:200px;">
                                <option value=""> -- Le type du produit -- </option>
                                <option class="Vêtement" value="Robe">Robe</option>
                                <option class="Vêtement" value="Tunnique">Tunnique</option>
                                <option class="Vêtement" value="Short">Short</option>
                                <option class="Vêtement" value="Patalon">Patalon</option>
                                               
                                <option class="Sac" value="Banane">Banane</option>
                                <option class="Sac" value="Cartable">Cartable</option>
                                <option class="Sac" value="Pochette">Pochette</option>
                                <option class="Sac" value="Coffret">Coffret</option>
                            </select>
                        </div>
                        <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10 ">
                             <span style="font-weight: bold;font-size: 1.2em;margin-left: 0%;">Taille : </span>
                        </div>
                        <div style="width:80%;margin-left:10%;margin-bottom:20px;">
                            <select id="tailleCommande" style="background-color:white;width:200px;">
                                <option value=""> -- La taille -- </option>
                                <option value="S">S</option>
                                <option value="L">L</option>
                                <option value="XS">XS</option>
                                <option value="XL">XL</option>
                                <option value="XXL">XXL</option>
                            </select>
                        </div>
                        <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10 ">
                             <span style="font-weight: bold;font-size: 1.2em;margin-left: 0%;">La marque : </span>
                        </div>
                        <div style="width:80%;margin-left:10%;margin-bottom:20px;">
                            <select id="marqueCommande" style="background-color:white;width:200px;">
                                <option value="" > -- La marque -- </option>
                                <option value="Cariska">Cariska</option>
                                <option value="Cher">Cher</option>
                                <option value="Jennifer">Jennifer</option>
                                <option value="Jina">Jina</option>
                             </select>
                        </div>
                        <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10 ">
                             <span style="font-weight: bold;font-size: 1.2em;margin-left: 0%;">Le couleur : </span>
                        </div>
                        <div style="width:80%;margin-left:10%;margin-bottom:20px;">
                            <select id="couleurCommande" style="background-color:white;width:200px;" >
                                <option value="" > -- Le couleur -- </option>
                                <option value="Noir">Noir</option>
                                <option value="Blanc">Blanc</option>
                                <option value="Maron">Maron</option>
                                <option value="Bleu">Bleu</option>
                            </select>
                        </div>

                        <div class="material-design-btn">
                            <a class="btn notika-btn-cyan" onclick="lancerRecherche()"  style="width:100%;font-size: 1.0em;font-weight: bold;"><i>Lancer la recherche<i> </a>
                    	</div>
                    	<div class="material-design-btn">
                            <a class="btn notika-btn-cyan"  onclick="actualiserRecherche()"  style="width:100%;font-size: 1.0em;font-weight: bold;">Annuler la recherche</a>
                    	</div>
             			<div class="material-design-btn">
                            <a class="btn notika-btn-cyan" onclick="validerCommandes()" style="font-size: 1.0em;font-weight: bold;">Valider les commandes </a>
                    	</div>
                    	<div class="compose-ml">
                            <a class="btn notika-btn-cyan" onclick="annulerCommande()"  style="font-size: 1.0em;font-weight: bold;">Annuler les commandes</a>
                        </div>

                    </div>       
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" >
                    <div class="inbox-text-list sm-res-mg-t-30">
                        <div class="form-group">
                            <div class="nk-int-st search-input search-overt">
                                <input type="text" id="productsParMotCle" class="form-control" placeholder="Rechercher produit ..." />
                                <button class="btn search-ib">Rechercher</button>
                            </div>
                        </div>
                        <div class="inbox-btn-st-ls btn-toolbar">
                            <div class="btn-group ib-btn-gp active-hook nk-email-inbox" style="font-size:1.8em;">
                                PRODUITS DISPONIBLES
                            </div>
                            <div class="btn-group ib-btn-gp active-hook nk-act nk-email-inbox">
                                <button class="btn btn-default btn-sm"><i class="notika-icon notika-left-arrow"></i></button>
                                <button class="btn btn-default btn-sm"><i class="notika-icon notika-right-arrow"></i></button>
                            </div>
                        </div>
                        <div class="row" id="listeProduitCommande">
                            
                        </div>
                        <!-- DEBUT DE ARRIVAGE  -->
					    <div class="modal fade" id="myModalquantite" role="dialog">
					          <div class="modal-dialog modal-sm">
					                <div class="modal-content">
					                    <div class="modal-header">
					                         <button type="button" class="close" data-dismiss="modal">&times;</button>
					                    </div>
					                    <div class="modal-body" style="margin-bottom: 10px;">
					                         <p style="font-size: 1.2em;">Veuillsez inserer la quantité commandé du produit :  <h5 id="produitCommande"></h5></p>
					                         <div class="form-group">
					                              <label for="qteCommande">Nombre de commande :</label>
					                              <input type="text" class="form-control" id="qteCommande">
					                         </div>
					                    </div>
					                    <div class="modal-footer">
					                         <button type="button" onclick="ajouterLigneDeCommandes()" class="btn btn-default" data-dismiss="modal">Ajouter au commande</button>
					                    </div>
					                </div>
					          </div>
					    </div>
					    <!-- DEBUT ARRIVAGE -->
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="inbox-left-sd">
                        <div class="material-design-btn" style="margin-bottom: 0px;">
                            <button class="btn notika-btn-cyan" style="font-size: 1.3em;">VOS  COMMANDES</button>
                        </div>
                        <div class="row" style="margin-left: 30px;">
                         	 <div class="card" style="width:280px;height:60px;padding: 10px;">
                                        <div class="row" >
                                            <span  id="totalCommande" class="col-lg-8" style="margin-top: 5px;font-size: 1.1em;font-weight: bold;">
                                            TOTAL: 0 Ar</span>
                                        </div>
                             </div> 

                             <div id="lignesDesCommandes">
                             </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</body>
</html>