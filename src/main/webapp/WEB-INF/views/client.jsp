<div>   
    <button type="button" class="hide" id="btn_erreur" class="btn btn-info" data-toggle="modal" data-target="#myModaltwo">Vos erreurs</button>
     <div class="modal fade" id="myModaltwo" role="dialog">
        <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <h2>Vos erreur à corrigé : </h2>
                        <p id="erreur">
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" id ='retour' data-dismiss="modal">Retour</button>                       
                    </div>
             </div>
         </div>                            
    </div>
    <div class="inbox-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <h1 class="text-center" >LISTE DES CLIENTS </h1>
                    <!-- DEBUT AJOUT DE CLIENT -->
                    <div class="inbox-btn-st-ls btn-toolbar" >
                        <button class="btn btn-lightblue lightblue-icon-notika" id='ajout_cli' data-toggle="modal" data-target="#myModalclient"><i class="fa fa-plus"></i><span style="padding-left: 5px;">Ajouter nouveau client</span></button>
                        <div class="modal fade" id="myModalclient" role="dialog">
                                    <div class="modal-dialog modal-large">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                        <form>
                                            <div class="modal-body">
                                                <h2 style="font-size: 2.0em" id="titreClient">Inscription du nouveau client </h2>
													<input type="hidden" id="client_id"/>
                                                <div style="height: 30px;font-size: 1.4em;padding-bottom: 5px;padding-left:5px;color: white;background-color: #03A9F4;"> Vos renseignements</div>
                                                <div class="row">
                                                    <label style="padding-left: 20px;margin-top: 10px;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Votre nom<i style="color: red;font-size: 1.3em;">* </i>:
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                        <span class="form-group ic-cmp-int" style="padding-left: 0px;">
                                                            <span class="form-ic-cmp" style="padding-left: 0px;">
                                                                <i class="notika-icon notika-support"></i>
                                                            </span>
                                                            <span class="nk-int-st" style="padding-left: 0px;">
                                                                <input type="text" id="nom" class="form-control" placeholder="Exemple:RAKOTO">
                                                            </span>
                                                            <span id="enom" style="color: red;"></span>
                                                        </span>
                                                    </div>
                                                    <label style="padding-left: 0px;margin-top: 10px;width: 140px;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Votre prénom(s) :
                                                    </label>
                                                    <div style="" style="padding-left: 0px;width: 500px;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <div class="form-group ic-cmp-int" style="padding-left: 0px;">
                                                            <div class="form-ic-cmp" style="padding-left: 0px;">
                                                                <i class="notika-icon notika-support"></i>
                                                            </div>
                                                            <div class="nk-int-st" style="padding-left: 0px;">
                                                                <input type="text" id="prenom" class="form-control" placeholder="Exemple: Solo Soa">
                                                            </div>
                                                            <span id="eprenom" style="color: red;"></span>                  
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label style="width: 145px;padding-top: 10px;" class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Votre adresse<i style="color: red;font-size: 1.2em;">*</i> : </label>
                                                    <div style="padding-left: 0px;" class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group ic-cmp-int" style="padding-left: 0px;">
                                                            <div class="form-ic-cmp" style="padding-left: 0px;">
                                                                <i class="notika-icon notika-map"></i>
                                                            </div>
                                                            <div class="nk-int-st"style="padding-left: 0px;">
                                                                <input type="text" id="ad" class="form-control" placeholder="ANJOMA">
                                                            </div>
                                                            <span id="ead" style="color: red;"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="height: 30px;font-size: 1.4em;padding-bottom: 5px;padding-left:5px;color: white;background-color: #03A9F4;"> Vos contacts</div>
                                                
                                                <div class="row" style="margin">
                                                    <label style="padding-left: 20px;margin-top: 10px;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Téléphone<i style="color: red;font-size: 1.3em;">*</i>:
                                                    </label>
                                                    <div style="padding-left: 0px;" class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                        <span class="form-group ic-cmp-int" style="padding-left: 0px;">
                                                            
                                                            <span class="form-ic-cmp" style="padding-left: 0px;">
                                                                <i class="notika-icon notika-phone"></i>
                                                            </span>
                                                            <span class="nk-int-st" style="padding-left: 0px;">
                                                                <input type="text" id="c1" class="form-control" placeholder="Exemple: 034 00 000 00 ...">
                                                                <span id="ec1" style="color: red"></span>
                                                            </span>
                                                        </span>

                                                    </div>
                                                    <label style="padding-left: 0px;margin-top: 10px;width: 140px;" class="col-lg-2 col-md-2 col-sm-2 col-xs-2">Téléphone 2 <i style="color: red;font-size: 1.3em;
                                                    ">* </i> : 
                                                    </label>
                                                    <div style="" style="padding-left: 0px;width: 500px;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                        <div class="form-group ic-cmp-int" style="padding-left: 0px;">
                                                            
                                                            <div class="form-ic-cmp" style="padding-left: 0px;">
                                                                <i class="notika-icon notika-phone"></i>
                                                            </div>
                                                            <div class="nk-int-st" style="padding-left: 0px;">
                                                                <input type="text" id="c2" class="form-control" placeholder="Ex: 034 00 000 00 ...">
                                                                <span id="ec2" style="color: red"></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <label style="width: 145px;padding-top: 10px;" class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Téléphone 3 :</label>
                                                    <div style="padding-left: 0px;" class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                                        <div class="form-group ic-cmp-int" style="padding-left: 0px;">
                                                            
                                                            <div class="form-ic-cmp" style="padding-left: 0px;">
                                                                <i class="notika-icon notika-phone"></i>
                                                            </div>
                                                            <div class="nk-int-st"style="padding-left: 0px;">
                                                                <input type="text" id="c3" class="form-control" placeholder="Exemple: 034 00 000 00 ...">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div>
                                                <p><span style="color: red;font-size: 1.6em;">*</span> : Vous devez impérativement remplir le champ correspondant.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" id="saveClient" class="btn btn-default">Enregistrer</button>
                                                <button type="button" id="editClient" onclick="updateClient()" class="btn btn-default">Actualiser</button>
                                                <button type="reset" id="annuler" class="btn btn-default">Annuler</button>
                                            </div>
                                        </form>
                                        </div>
                                    </div>
                        </div>
                    </div>
                    <!-- FIN AJOUT DE CLIENT -->

                    <div class="inbox-text-list sm-res-mg-t-30">        
                        <br>
                        <div class="table-responsive">
                            <table id="listeClient" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Nom</th>
                                        <th>Prénom(s)</th>
                                        <th>Adresse</th>
                                        <th>Contacts </th>
                                        <th>Opérations</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                                <tfoot>
                                    <tr>
                                         <th>Nom</th>
                                        <th>Prénom(s)</th>
                                        <th>Adresse</th>
                                        <th>Contacts </th>
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
</div> 