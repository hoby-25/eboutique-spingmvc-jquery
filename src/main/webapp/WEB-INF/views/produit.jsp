
    <button type="hidden" id="btn_erreurPro" class="btn btn-info" data-toggle="modal" data-target="#myModaltwo">Vos erreurs</button>

     <div class="modal fade" id="myModaltwo" role="dialog">
        <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <h2>Vos erreur à corrigé : </h2>
                        <p id="erreurPro">
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id ='retourPro' data-dismiss="modal">Retour</button>                       
                    </div>
             </div>
         </div>                            
    </div>
    <!-- DEBUT DE ARRIVAGE  -->
    <div class="modal fade" id="myModalthree" role="dialog">
          <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                         <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body" style="margin-bottom: 10px;">
                         <p style="font-size: 1.2em;font-weight: bold;">Veuillez inserer le nombre d'arrivage de ce produit :</p>
                         <div class="form-group">
                              <label for="stock">Nombre d'arrivage :</label>
                              <input type="text" class="form-control" id="stock">
                         </div>
                    </div>
                    <div class="modal-footer">
                         <button type="button" onclick="ajouterAuStock()" class="btn btn-default" data-dismiss="modal">Ajouter au stock</button>
                    </div>
                </div>
          </div>
    </div>
    <!-- DEBUT ARRIVAGE -->
    <!-- DEBUT DU MODIFIER -->
    <div class="modal fade" id="myModalproduit" role="dialog">
          <div class="modal-dialog modal-large" style="color: black !important;">
                                        <div class="modal-content">
                                        <form enctype="multipart/form-data">	
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <h2 style="font-size: 2.0em" id="titreProduit"></h2>
                                                <div style="height: 30px;font-size: 1.4em;padding-bottom: 5px;padding-left:5px;color: white;background-color: #03A9F4;"> Quelle produit s'agit-il ?</div> 
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">L'image du produit<i style="color: red;font-size: 1.3em;">* </i>:
                                                    </label>
                                                    <div style="margin-top: 10px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                        <div class="btn-group images-cropper-pro">
                                                         <label title="Upload image file" for="inputImage" class="btn btn-primary img-cropper-cp">
                                                       	  <input type="file" accept="image/*" name="file" id="inputImage" class="hide"> Choississez l'image du produit
                                                         </label>
                                                         </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-bottom: 10px;margin-top: 10px;">
													<label style="padding-left: 20px;margin-bottom: 10px;font-weight: normal;" class="col-lg-4 col-md-2 col-sm-2 col-xs-2">Quel article s'agit - il ? <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <select id="article" style="background-color:white;">
                                                            <option VALUE=""> -- Article -- </option>
                                                            <option VALUE="Vêtement">Vêtement</option>
                                                            <option VALUE="Sac">Sac</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div style="height: 30px;font-size: 1.4em;padding-bottom: 5px;padding-left:5px;color: white;background-color: #03A9F4;"> A propos du produit</div>
                                                <div style="margin-top: 10px;font-weight: bold;font-size: 1.2em;"> Quelle est le type et la taille du produit ? </div>
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-bottom: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Le type <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <select id="type" style="background-color:white;">
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
                                                   <label style="padding-left: 20px;margin-bottom: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">La taille <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <select id="taille" style="background-color:white;">
                                                            <option value=""> -- La taille -- </option>
                                                            <option value="S">S</option>
                                                            <option value="L">L</option>
                                                            <option value="XS">XS</option>
                                                            <option value="XL">XL</option>
                                                            <option value="XXL">XXL</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div style="margin-top: 10px;font-weight: bold;font-size: 1.2em;"> Quelle est la marque , la qualite et le couleur ? </div>
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-bottom: 10px;font-weight: normal;" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">La marque <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                       <select id="marque" style="background-color:white;">
                                                            <option value="" > -- La marque -- </option>
                                                            <option value="Cariska">Cariska</option>
                                                            <option value="Cher">Cher</option>
                                                            <option value="Jennifer">Jennifer</option>
                                                            <option value="Jina">Jina</option>
                                                        </select>
                                                    </div>
                                                   <label style="padding-left: 20px;margin-bottom: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">La qualité <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <select id="qualite" style="background-color:white;" >
                                                            <option value=""> -- La qualite -- </option>
                                                            <option value="Cuir">Cuir</option>
                                                            <option value="Jean">Jean</option>
                                                            <option value="Coton">Coton</option>
                                                            <option value="Croco">Croco</option>
                                                        </select>
                                                    </div>
                                                    <label style="padding-left: 20px;margin-bottom: 10px;font-weight: normal;" class="col-lg-6 col-md-6 col-sm-2 col-xs-2">Le couleur <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-6 col-md-6 col-sm-4 col-xs-4">
                                                       <select id="couleur" style="background-color:white;" >
                                                            <option value="" > -- Le couleur -- </option>
                                                            <option value="Noir">Noir</option>
                                                            <option value="Blanc">Blanc</option>
                                                            <option value="Maron">Maron</option>
                                                            <option value="Bleu">Bleu</option>
                                                        </select>
                                                    </div>

                                                </div>
                                                <div style="margin-top: 10px;font-weight: bold;font-size: 1.2em;"> Quelle est le prix et nombre du produit ? </div>
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Le prix <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <div class="nk-int-st">
                                                            <input style="width: 150px;float: left;" id="prix" type="text" class="form-control" placeholder="Exemple: 8.000  ">
                                                            <span style="position: relative;top: 10px;font-weight: bold;">Ariary</span>
                                                        </div>
                                                    </div>
                                                   <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Le nombre <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <div class="nk-int-st">
                                                            <input style="width: 150px;float: left;" id="nombre" type="text" class="form-control" placeholder="Exemple: 2 ou 20  ">
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div>
                                                <p><span style="color: red;font-size: 1.6em;">*</span> : Vous devez impérativement remplir le champ correspondant.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" id="btnEnregistrerProduit" onclick="enregistrerProduit()" >Enregistrer</button>
                                            	<button type="button" class="btn btn-default" id="btnUpdateProduit" onclick="updateProduit()" >Actualiser</button>
                                            </div>
                                        </form>
                                        </div>
                          				  </div>
                                                </div>
	<!-- DEBUT MODIFIER --->
    <div class="inbox-area">
        <div class="container-fluid" style="margin: 50px;">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h1 class="text-center">LISTE DES PRODUITS </h1>
					
                    <!-- DEBUT AJOUT DE PRODUIT -->
                    <div class="inbox-btn-st-ls btn-toolbar">
                        <button class="btn btn-lightblue lightblue-icon-notika" id="ajout_produit" data-toggle="modal" data-target="#myModalproduit"><i class="fa fa-plus"></i><span style="padding-left: 5px;">Ajouter nouveau produit</span></button>
                    <!--    
                        <div class="modal fade" id="myModalproduit5" role="dialog">
                            <div class="modal-dialog modal-large">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" id="close_pro" data-dismiss="modal">&times;</button>
                                            </div>
                                            <div class="modal-body">
                                                <h2 style="font-size: 2.0em">Ajout de nouveau produit </h2>
                                                <div style="height: 30px;font-size: 1.4em;padding-bottom: 5px;padding-left:5px;color: white;background-color: #03A9F4;"> Quelle produit s'agit-il ?</div> 
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">L'image du produit<i style="color: red;font-size: 1.3em;">* </i>:
                                                    </label>
                                                    <div style="margin-top: 10px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                        <div class="btn-group images-cropper-pro">
                                                         <label title="Upload image file" for="img" class="btn btn-info img-cropper-cp">
                                                        <input type="file" accept="image/*" name="file" id="img"> Choississez l'image du produit
                                                        </label>
                                                         </div>
                                                    </div>

                                                    <div style="margin-top: 5px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                        <img src="mode.jpg" width="100px" height="100px">
                                                    </div>
                                                </div>
                                                <div id="eimg" style="color: red;margin-right:10px;margin-left: 30%;"></div>
                                                <div class="row" style="margin-bottom: 10px;margin-top: 10px;width: 100%;">
                                                    <div style="margin-top: 12px;" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                         <label style="padding-left: 5px;margin-top: 10px;font-weight: normal;" >Quel article s'agit il ?<i style="color: red;font-size: 1.3em;">*</i>
                                                    </label>
                                                     </div>
                                                    <div style="padding-left: 0px;margin-top: 10px;margin-left: 0px;" class="col-lg-9 col-md-9 col-sm-9 col-xs-9">
                                                       <select id="article" class="selectpicker" data-live-search="true" >
                                                            <option value="" > ----  Cliquer pour choisir l'article    --- </option>
                                                            <option value="sac" selected="true">Sac</option>
                                                            <option value="vetement">Vêtement</option>
                                                        </select>
                                                        <div id="earticle" style="color: red;"></div>
                                                    </div>
                                                   
                                                </div>
                                                <div>
                                                <div style="height: 30px;font-size: 1.4em;padding-bottom: 5px;padding-left:5px;color: white;background-color: #03A9F4;"> 
                                                    A propos du produit
                                                </div>
                                                
                                                <div style="margin-top: 10px;font-weight: bold;font-size: 1.2em;">
                                                     Quelle est le type et la taille du produit ? 
                                                </div>
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Le type <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                        <select id="type" class="selectpicker" data-live-search="true" >
                                                        </select>
                                                        <div id="etype" style="color: red;"></div>
                                                    </div>
                                                   <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">La taille <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="pad1ding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <select id="taille" class="selectpicker" data-live-search="true" >
                                                           
                                                        </select>
                                                        <div id="etaille" style="color: red;"></div>
                                                    </div>
                                                </div>

                                                <div style="margin-top: 10px;font-weight: bold;font-size: 1.2em;">
                                                     Quelle est la marque et la qualite ?
                                                </div>
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                        La marque <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                                       <select id="marque" class="selectpicker" data-live-search="true" >
                                                            <option value=""> -- La marque -- </option>
                                                            <option value="Gianna">Gianna</option>
                                                            <option value="Fille">Fille</option>
                                                            <option value="Love">Love</option>
                                                        </select>
                                                         <div id="emarque" style="color: red;"></div>
                                                    </div>
                                                    <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">La qualité <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <select class="selectpicker" id="qualite" data-live-search="true" >
                                                            <option value=""> -- La qualite -- </option>
                                                            <option value="Cuir">Cuir</option>
                                                            <option value="Jean">Jean</option>
                                                            <option value="Vernis">Vernis</option>
                                                        </select>
                                                         <div id="equalite" style="color: red;"></div>
                                                    </div>

                                                </div>
                                                <div style="margin-top: 10px;font-weight: bold;font-size: 1.2em;">
                                                     Quelle est le prix et nombre du produit ?
                                                </div>
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Le prix <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <div class="nk-int-st">
                                                            <input id="prix" style="width: 150px;float: left;" type="text" class="form-control" placeholder="Exemple: 120.000 ">
                                                            <span style="position: relative;top: 10px;font-weight: bold;">Ariary</span>
                                                             <div id="eprix" style="color: red;"></div>
                                                        </div>
                                                    </div>
                                                   <label style="padding-left: 20px;margin-top: 10px;font-weight: normal;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Le nombre <i style="color: red;font-size: 1.3em;">*</i> :
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                       <div class="nk-int-st">
                                                            <input id="nb" style="width: 150px;float: left;" type="text" class="form-control" placeholder="Exemple: 2 ou 20  ">
                                                             <div id="enb" style="color: red;"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                            <div>
                                    
                                                <p><span style="color: red;font-size: 1.6em;">*</span> : Vous devez impérativement remplir le champ correspondant.</p>
                                            </div>
                                            <div class="modal-footer" style="position: relative;left:87%;">
                                                <button type="button" id="saveProduit" class="btn btn-default" >Enregistrer</button>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                    -->
                    </div>
                    <!-- FIN AJOUT DE PRODUIT-->
                    <div class="inbox-text-list sm-res-mg-t-30">        
                        <br>
                        <div class="table-responsive">
                            <table id="listeProduct" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Article</th>
                                        <th>Type</th>
                                        <th>Taille</th>
                                        <th>Marque</th>
                                        <th>Qualité</th>
                                        <th>Prix</th>
                                        <th>Stock</th>
                                        <th>Couleur</th>
                                        <th>Opérations</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Image</th>
                                        <th>Article</th>
                                        <th>Type</th>
                                        <th>Taille</th>
                                        <th>Marque</th>
                                        <th>Qualité</th>
                                        <th>Prix</th>
                                        <th>Stock</th>
                                        <th>Couleur</th>
                                        <th>Opérations</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Inbox area End-->
