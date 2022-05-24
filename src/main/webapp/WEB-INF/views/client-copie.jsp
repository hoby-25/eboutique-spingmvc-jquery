<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Clients</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/main/img/favicon.ico">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/owl.theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/owl.transitions.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/meanmenu/meanmenu.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/normalize.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/notika-custom-icon.css">
    <!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/wave/waves.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/wave/button.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/main.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/responsive.css">
    <!-- modernizr JS
        ============================================ -->
    
    <script src="<%=request.getContextPath()%>/resources/main/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
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
                        <button class="btn btn-lightblue lightblue-icon-notika" id='ajout_cli'data-toggle="modal" data-target="#myModalclient"><i class="fa fa-plus"></i><span style="padding-left: 5px;">Ajouter nouveau client</span></button>
                        <div class="modal fade" id="myModalclient" role="dialog">
                                    <div class="modal-dialog modal-large">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            </div>
                                        <form>
                                            <div class="modal-body">
                                                <h2 style="font-size: 2.0em">Inscription du nouveau client </h2>

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
                                                                <input type="text" ng-model="nom" id="nom" class="form-control" placeholder="Exemple:RAKOTO">
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
                                                                <input type="text" ng-model="prenom" id="prenom" class="form-control" placeholder="Exemple: Solo Soa">
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
                                                                <input type="text" ng-model="adresse" id="ad" class="form-control" placeholder="ANJOMA">
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
                                                                <input type="text" ng-model="telephone1" id="c1" class="form-control" placeholder="Exemple: 034 00 000 00 ...">
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
                                                                <input type="text" ng-model="telephone2" id="c2" class="form-control" placeholder="Ex: 034 00 000 00 ...">
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
                                                                <input type="text" ng-model="telephone3"  id="c3" class="form-control" placeholder="Exemple: 034 00 000 00 ...">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                            <div>
                                                <p><span style="color: red;font-size: 1.6em;">*</span> : Vous devez impérativement remplir le champ correspondant.</p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" id="save" class="btn btn-default">Enregistrer</button>
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
    <!-- Inbox area End-->
    <!-- Start Footer area-->
    <div class="footer-copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright © 2021 . All rights reserved. </a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer area-->
    <!-- jquery
        ============================================ -->
</div> 
	<script src="<%=request.getContextPath()%>/resources/main/js/vendor/jquery-1.12.4.min.js"></script>
	
  
    <script src="<%=request.getContextPath()%>/resources/main/img/sweetalert.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/jquery-price-slider.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/owl.carousel.min.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/meanmenu/jquery.meanmenu.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
   
    <!-- plugins JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/plugins.js"></script>
    <!-- Data Table JS
        ============================================ -->
     
    <script src="<%=request.getContextPath()%>/resources/main/js/data-table/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/data-table/data-table-act.js"></script>
    
    <!-- main JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/main.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/img/clients.js"></script>

	<!-- tawk chat JS
		============================================ -->

	<!-- tawk chat JS
		============================================ -->
</body>
</html>