<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Mode</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/bootstrap.min.css"> 
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/owl.theme.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/owl.transitions.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/meanmenu/meanmenu.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/summernote/summernote.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/themesaller-forms.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/color-picker/farbtastic.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/chosen/chosen.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/notification/notification.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/dropzone/dropzone.css">
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/animate.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/normalize.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/wave/waves.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/wave/button.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/notika-custom-icon.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/main.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/responsive.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/bootstrap-select/bootstrap-select.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/main/css/datapicker/datepicker3.css">

	<script src="<%=request.getContextPath()%>/resources/main/js/vendor/modernizr-2.8.3.min.js"></script>
	
	<!-- CHART RESSOURCES -->
    <script src="<%=request.getContextPath()%>/resources/main/chart/chart.js@2.8.0"></script>
    
</head>

<body>
    <div class="wizard-area">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="wizard-wrap-int">                        
                        <div id="rootwizard">
                            <div class="navbar">
                                <div class="navbar-inner">
                                    <div class="container-pro wizard-cts-st">
                                        <img src="<%=request.getContextPath()%>/resources/main/mode.PNG" style="border-radius: 50px;width: 70px;height: 70px;position:relative;bottom:10px;float: left;"> 
                                        <ul> 
                                            <li><a href="#tab1" data-toggle="tab">CLIENTS</a></li>
                                            <li><a href="#tab2" data-toggle="tab" onclick="cliquerProduit()">PRODUITS</a></li>
                                            <li id="tableau_bord"><a href="#tab4" data-toggle="tab">TABLEAU DE BORD</a></li>
                                            <li><a href="#tab5" id="commandesTab" data-toggle="tab"></a></li>
                                        </ul>
                                        <div style="width: 100px;height: 100px;position:absolute;bottom:10px;right:10px;float: left;">
                                            <a href="<c:url value="/j_spring_security_logout" />" type="button" class="btn btn-info" style="margin-top:40px;color: white;">Déconnecter</a>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane wizard-ctn" id="tab1">
                                	<%@ include file="client.jsp" %> 
                                </div>
                                <div class="tab-pane wizard-ctn" id="tab2">
                                    <%@ include file="produit.jsp" %>                         
                                </div>
                               <div class="tab-pane wizard-ctn" id="tab4">
                                	<%@ include file="tableau_de_bord.jsp" %>
                                </div>
                                <div class="tab-pane wizard-ctn" id="tab5">
                                	<%@ include file="commandes.jsp" %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
    <!-- Wizard area End-->
    <!-- Start Footer area-->
    <div class="footer-copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright © 2021.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/resources/main/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/bootstrap-select/bootstrap-select.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/color-picker/color-picker.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/datapicker/bootstrap-datepicker.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/datapicker/datepicker-active.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/chosen/chosen.jquery.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/img/sweetalert.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/wow.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/jquery-price-slider.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/jquery.scrollUp.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/meanmenu/jquery.meanmenu.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/counterup/jquery.counterup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/counterup/waypoints.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/counterup/counterup-active.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/sparkline/jquery.sparkline.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/sparkline/sparkline-active.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/flot/jquery.flot.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/flot/jquery.flot.resize.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/flot/flot-active.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/knob/jquery.knob.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/knob/jquery.appear.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/knob/knob-active.js"></script>
    <!--  Chat JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/chat/jquery.chat.js"></script>
    <!--  wizard JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/wizard/jquery.bootstrap.wizard.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/wizard/wizard-active.js"></script>
    <!--  todo JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/todo/jquery.todo.js"></script>
	<!--  wave JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/wave/waves.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/wave/wave-active.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/icheck/icheck.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/icheck/icheck-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/main.js"></script>
	<!-- tawk chat JS
		============================================ -->
    <script src="<%=request.getContextPath()%>/resources/main/js/tawk-chat.js"></script>
    
    <script src="<%=request.getContextPath()%>/resources/main/js/data-table/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/data-table/data-table-act.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/rangle-slider/jquery-ui-1.10.4.custom.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/rangle-slider/jquery-ui-touch-punch.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/js/rangle-slider/rangle-active.js"></script>
    <script>
    var listeClient;
    var listeProduct;
    var cliqueProduit = false;
    var products;
    var clients;
    let liste_des_clients;
    let lignes_de_commandes =[];
    let liste_des_produits ;
    let item_commandes;
    var path = '<%=request.getContextPath()%>';
    let chart1;
    let chart2;
    let chart3;
    let chart4;
    </script>
    <script src="<%=request.getContextPath()%>/resources/main/chart/script.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/img/clients.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/img/produit.js"></script>
    <script src="<%=request.getContextPath()%>/resources/main/img/commandes.js"></script>
     

</body>

</html>