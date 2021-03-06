$(document).ready(function(){
	let data="";
	loadClients();

	$('#c1').focusout(function(){
		c1();		
	})
	$('#c2').focusout(function(){
		c2();		
	})
	$('#c3').focusout(function(){
		c3();		
	})
	$('#prenom').focusout(function(){
		prenom();
	})
	$('#ad').focusout(function(){
		ad();
	})
	$('#nom').focusout(function(){
		nom();
	})
	$('#ad').keyup(function(){
		var nom = $('#ad').val().toUpperCase();
		$('#ad').val(nom);
	})
	$('#c1').keyup(function(){
		var tel = $(this).val();
		espace('c1' , tel);
	})
	$('#c2').keyup(function(){
		var tel = $(this).val();
		espace('c2' , tel);
	})
	$('#c3').keyup(function(){
		var tel = $(this).val();
		espace('c3' , tel);
	})
	$('#nom').keyup(function(){
		var nom = $('#nom').val().toUpperCase();
		$('#nom ').val(nom);
	})

	$('#prenom').keyup(function(){
		var nom = $('#prenom').val().toUpperCase();
		$('#prenom').val(nom);
	})
	$('#retour').click(function(){
		$('#ajout_cli').trigger('click');
	})	
	$('#saveClient').click(function(){
		verifie();
		e_erreur();
	})
	$('#annuler').click(function(){
		fermerModalClient();
	});
	$('#ajout_cli').click(function(){
		$('#saveClient').show();
		$('#editClient').hide();
		$("#nom").val('');
		$('#prenom').val('');
		$('#ad').val('');
		$('#c1').val('');
		$('#c2').val('');
		$('#c3').val('');
		$('#client_id').val('');
		$('#titreClient').html('Nouveau client');
	})
})

function ajouterLesListesClients(){
	liste_des_clients = [];
	$.ajax({
        url : path+'/caissier/list' ,
        type : 'POST' ,
        success : function(response){
        	let data = response.data;
        	for(let i = 0 ; i < data.length ; i++){
        		let item_client = { idClient : data[i][6] ,  nomClient : data[i][0] ,  prenomClient : data[i][1] ,  adresse : data[i][2] ,  tel1 : data[i][3],  tel2 : data[i][4],  tel3 : data[i][5]};
        		liste_des_clients.push(item_client);
        	}
        	console.log(liste_des_clients);
        }
    })
}

function loadClients(){
		ajouterLesListesClients();
	    listeClient = $('#listeClient').DataTable({
			ajax :{
				url: path+'/caissier/list',
				method:'POST',
			},
			columns : [
				{ data : '0' },
				{ data : '1' },
				{ data : '2' },
				{ data : {A : '4' , B : '5'},
				  render : function(data){
				  	return data[3]+ '</br>' + data[4] + '</br>' + data[5] ;
				  }
				},
				{
					data : {A : '4' , B : '5'} ,
					render : function(data){
						return "<div class='inbox status' >" + 
							"<div class='inbox-st-nav inbox-nav-mg'>"+
                                    "<button class='btn btn-info info-icon-notika' onclick='getClient("+data[6]+")' info-icon-notika' data-toggle='modal' data-target='#myModalclient'><i class='notika-icon notika-draft'>"+
                                       "</i><span style='padding-left: 5px;'>Modifier</span>"+
                                    "</button> </a>"+
                                    "<button onclick=commandeClient('"+data[6]+"') class='btn btn-lightblue lightblue-icon-notika'><i class='notika-icon notika-draft'>"+
                                       "</i><span style='padding-left: 5px;'>Commander</span>"+
                                    "</button> </a>"+
                                    "<button onclick='deleteClient("+data[6]+")'class='btn btn-danger danger-icon-notika'><i class='notika-icon notika-trash'></i><span style='padding-left: 5px;'>Supprimer</span></button>"+
                            "</div> </div>";
					}
				}
			]
		});
}

function commandeClient(id){
    clients = new Array(id);
    
    $('#commandesTab').trigger('click');
    
   	let clientFiltered = liste_des_clients.filter(function(client){
		return client.idClient == clients[0];
	}) 
   	
    $('#commandeNomClient').text(clientFiltered.nom);
    $('#commandePrenomClient').text(clientFiltered.prenom);
    
    $.ajax({
        url : path+'/adminProduct/listProduit' ,
        type : 'POST' ,
        success : function(response){
            console.log(response.data[0]);
            var data = response.data;
            var html = '';
            liste_des_produits = [];

            console.log('LISTE DES PRODUITS');
            
            for(var i = 0 ; i < data.length ; i++){
            	let productItem = {idProduit : data[i][0], prix : data[i][1],quantite : data[i][2] , article : data[i][3], image : data[i][4], marque : data[i][5] , qualite : data[i][6] , taille : data[i][7] , type : data[i][8] , couleur : data[i][9] , quantiteCommande : 0};
                liste_des_produits.push(productItem);
                html += '<div id="produitN'+liste_des_produits[i].idProduit+'" class="col-lg-4">'+
                                '<div class="card" style="width:400px;margin: 20px;">'+
                                  '<img class="card-img-top"  src="'+path+'/resources/main/images/'+data[i][4]+'"style="width:150px;height:150px;" alt="Card image">'+
                                  '<div class="card-body">'+
                                    '<h4 class="card-title">'+ data[i][8] +' en ' + data[i][6]  +'</h4>'+
                                    '<p class="card-text">Marque :'+ data[i][5] +' <br>'+
                                    'Taille : '+data[i][7] +'<br> Nombre :<bold id="nombre'+data[i][0]+'">' +data[i][2]+'</bold><br>'+
                                    'Prix : '+data[i][1] +'Ar </p>'+
                                    '<div class="material-design-btn" id="btnCommander'+liste_des_produits[i].idProduit+'">'+
                                        '<button onclick=commanderProduit("'+data[i][0] +'","'+ data[i][1] +'","'+ data[i][2] +'","'+ data[i][3] +'","'+data[i][4]+'","'+data[i][5]+'","'+data[i][6]+'","'+ data[i][7] +'","'+ data[i][8]+'","'+ data[i][9]+'") class="btn notika-btn-cyan" data-toggle="modal" data-target="#myModalquantite">Commander</button>'+
                                    '</div>' +
                                  '</div>' +
                                '</div>' + 
                        '</div>';
            }
            $('#listeProduitCommande').html(html);
            console.log(liste_des_produits[0]);
        }
    });
}

function updateClient(){
		$.ajax({
				url:path+'/caissier/updateClient',
				type:'POST',
				data:{ idClient : $("#client_id").val() , nomClient : $("#nom").val(), prenomClient : $('#prenom').val(), tel1 :$('#c1').val() , tel2 :$('#c2').val() ,tel3 :$('#c3').val(), adresse :$('#ad').val() },
				success: function(response){
						$('#listeClient').DataTable().ajax.reload();
						ajouterLesListesClients();
						swal("L'enregistrement a ??t?? mise ?? jour!", {
					      icon: "success",
					    });
					    fermerModalClient();
				}				
		});
}

function getClient(id){
		$.ajax({
				url:path+'/caissier/getClient',
				type:'POST',
				data:{idClient:id},
				success: function(response){
						console.log(response.data[0]);
						var client = response.data[0];
						$("#nom").val(client[0]);
						$('#prenom').val(client[1]);
						$('#ad').val(client[2]);
						$('#c1').val(client[3]);
						$('#c2').val(client[4]);
						$('#c3').val(client[5]);
						$('#client_id').val(client[6]);
						$('#saveClient').hide();
						$('#editClient').show();
						$('#titreClient').html('Modification du client');
				}				
		});
}

function loadClient(){
		listeClient = $('#listeClient').DataTable({
			ajax :{
				url:path+'/caissier/list',
				method:'POST',
			},
			columns : [
				{ data : '0' },
				{ data : '1' },
				{ data : '2' },
				{ data : {A : '4' , B : '5'},
				  render : function(data){
				  	return data[3]+ '</br>' + data[4] + '</br>' + data[5] ;
				  }
				},
				{
					data : '6' ,
					render : function(data){
						return "<div class='inbox status' >" + 
							"<div class='inbox-st-nav inbox-nav-mg'>"+
                                    "<button class='btn btn-info info-icon-notika' onclick='modifierClient("+data+")' data-toggle='modal' data-target='#myModalclient'><i class='notika-icon notika-draft'>"+
                                       "</i><span style='padding-left: 5px;'>Modifier</span>"+
                                    "</button> </a>"+
                                    "<button onclick='deleteClient("+ data+")'class='btn btn-danger danger-icon-notika'><i class='notika-icon notika-trash'></i><span style='padding-left: 5px;'>Supprimer</span></button>"+
                            "</div> </div>";
					}
				}
			]
	});
}
function deleteClient(id){
		swal({
		  title: "Etes vous s??r de supprimer ce client ?",
		  icon: "error",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		  	$.ajax({
				url:path+'/caissier/deleteClient',
				type:'POST',
				data:{idClient:id},
				success: function(response){
						$('#listeClient').DataTable().ajax.reload();
						ajouterLesListesClients();
						swal("L'enregistrement a ??t?? suppprim??!", {
					      icon: "success",
					    });
					    fermerModalClient();
				}				
			});
		    
		  } else {
		    swal("La suppression a ??t?? annul??!");
		  }
		});
}


function e_erreur(){
	var erreur ='';
	if (  ($('#enom').text().length) > 0 || ($('#eprenom').text().length) > 0 || ($('#ec1').text().length) > 0 || ($('#ec2').text().length) > 0 || ($('#ead').text().length) > 0 || ($('#ec3').text().length) > 0  )  {
		if(($('#enom').text().length) > 0){
			erreur += ' - '+$('#enom').text()+'<br>';
		}
		if(($('#eprenom').text().length) > 0){
			erreur += ' - '+$('#eprenom').text()+'<br>';
		}
		if(($('#ead').text().length) > 0){
			erreur += ' - '+$('#ead').text()+'<br>';
		}
		if(($('#ec1').text().length) > 0){
			erreur += ' - '+ $('#ec1').text()+'<br>';
		}
		if(($('#ec2').text().length) > 0){
			erreur += ' - '+ $('#ec2').text()+'<br>';
		}
		if(($('#ec3').text().length) > 0){
			erreur += ' - '+ $('#ec3').text()+'<br>';
		}
			var p = document.getElementById('erreur');
			p.innerHTML = erreur;
			$('#close_cli').trigger('click');
			$('#btn_erreur').trigger('click');
		return true;
	}else{
		$('#close_cli').trigger('click');
		enregistrerClient();
	}
}

function enregistrerClient(){
		$.ajax({
				url: path+'/caissier/enregistreClient',
				type:'POST',
				data:{nomClient : $("#nom").val(), prenomClient : $('#prenom').val(), tel1 :$('#c1').val() , tel2 :$('#c2').val() ,tel3 :$('#c3').val(), adresse :$('#ad').val() },
				success: function(response){
						$('#listeClient').DataTable().ajax.reload();
						swal({
							  title: "Vous ??tes enregistr?? !",
							  text: "Vous ??tes bien enregistr?? parmis les clients !",
							  icon: "success",
							  button: "OK",
						})
						ajouterLesListesClients();
						fermerModalClient();
						$('#annuler').trigger('click');		
				}				
		});	
}

function fermerModalClient(){
	$('.modal-backdrop').remove();
    $('body').removeClass('modal-open');
	$('#myModalclient').css('display', 'none');
}

function verifie(){
	nom();
	prenom();
	ad();
	c1();
	c2();
	c3();
}

function nom(){
	var nom = $('#nom').val();
		var vide = nom_vide(nom);
		if(vide == false){
			nom_chiffre(nom);
		}
}

function prenom(){
	var nom = $('#prenom').val();
	prenom_chiffre(nom);
}

function ad(){
	var nom = $('#ad').val();
	ad_vide(nom);
}

function c1(){
	var tel = $('#c1').val();
		var c1 = c1_vide('c1' ,tel);
		if (c1 == false) {
			chiffre_phone('c1', tel);
			if(chiffre_phone('c1',tel)){
				phone('c1' ,tel);
				if(phone('c1',tel)){
					long('c1',tel);
				}
			}
		}
}

function c2(){
	var tel = $('#c2').val();
		var c2 = c1_vide('c2' ,tel);
		if (c2 == false) {
			chiffre_phone('c2', tel);
			if(chiffre_phone('c2',tel)){
				phone('c2' ,tel);
				if(phone('c2',tel)){
					long('c2',tel);
				}
			}
		}
}

function c3(){
	var tel = $('#c3').val();
			chiffre_phone('c3', tel);
			if(chiffre_phone('c3',tel)){
				phone('c3' ,tel);
				if(phone('c3',tel)){
					long('c3',tel);
				}
			}
}

function nom_vide(nom){
 		if (nom.length == 0) {
 			$('#enom').text('Vous devez saisir votre nom.');
 		
 			return true;
	 	}else{
	 		$('#enom').empty();
	 		return false;
	 	}
}
function ad_vide(nom){
	if (nom.length == 0) {
 			$('#ead').text('Vous devez saisir votre adresse.');
 		
 			return true;
	}
	else{
	 		$('#ead').empty();
	 		return false;
	}
}
function c1_vide(champ , nom){
	if (champ == 'c1') {
		if (nom.length == 0) {
 			$('#ec1').text('Veuillez saisir votre contact n??1.');
 		
 			return true;
	 	}else{
	 		$('#ec1').empty();
	 		return false;
	 	}
	}
	else{
		if (nom.length == 0) {
 			$('#ec2').text('Veuillez saisir votre contact n??2.');
 		
 			return true;
	 	}else{
	 		$('#ec2').empty();
	 		return false;
	 	}
	}	
			
}
function nom_chiffre(nom){
 	var chiffre =/^[A-Z??????a-b]/;
 	var trouve = 'yes';
 	for(var i = 0 ; i < nom.length ; i++){
 		var name = nom.charAt(i);
 		if(chiffre.test(name) == true){
 			i++;

 		}else if(chiffre.test(name) == false){
 			$('#enom').text('Votre nom ne devrais pas contenir de chiffre ou caract??re sp??ciaux.');
 		
 			trouve = 'no';
 			i = nom.length;

 		}
 	}

 	if (trouve == 'yes') {
 		$('#enom').empty();
 		return false;
 	}else{return true}
}

function prenom_chiffre(nom){
	var chiffre =/^[A-Z??????a-b]/;
 	var trouve = 'yes';
 	for(var i = 0 ; i < nom.length ; i++){
 		var name = nom.charAt(i);
 		if(chiffre.test(name) == true){
 			i++;

 		}else if(chiffre.test(name) == false){
 				$('#eprenom').text('Votre pr??nom ne devrais pas contenir de chiffre ou caract??re sp??ciaux.');
 			
 				trouve = 'no';
 				i = nom.length;

 		}
 	}

 	if (trouve == 'yes') 
 		$('#eprenom').empty(); 
}

function ad_chiffre(champ , nom){
 	var chiffre =/^[A-Z1-9]/;
 	var trouve = 'yes';
 	for(var i = 0 ; i < nom.length ; i++){
 		var name = nom.charAt(i);
 		if(chiffre.test(name) == true){
 			i++;

 		}else if(chiffre.test(name) == false){
 			if (champ =='ad') {
 				$('#ead').text('Votre adresse ne devrais pas contenir de caract??re sp??ciaux.');
 			
 			}
 			trouve = 'no';
 			i = nom.length;

 		}
 	}

 	if (trouve == 'yes') {
 		if (champ == 'ad') {
 			$('#ead').empty();
 		}
 		
 	}
}

function chiffre_phone(champ , tel){
	var chiffre =/^[0-9\s]/;
 	var trouve = 'yes';
 	for(var i = 0 ; i < tel.length ; i++){
 		var name = tel.charAt(i);
 		if(chiffre.test(name) == true){
 			i++;

 		}else if(chiffre.test(name) == false){
 			if (champ == 'c1' ) {
 				$('#ec1').text('Votre contact ne devrais contenir que des chiffres');
 			
 			}
 			else if (champ == 'c2') {
 				$('#ec2').text('Votre contact ne devrais contenir que des chiffres');
 			
 			}
 			else if (champ == 'c3') {
 				$('#ec3').text('Votre contact ne devrais contenir que des chiffres');
 			
 			}
 			
 			trouve = 'no';
 			i = nom.length;
 		}
 	}

 	if (trouve == 'yes') {
 			return true;
 	}else{
 		return false;
 	}
}
function phone(champ , tel){
	var op = tel.slice(0,3);
	var l = tel.length ;
	if (op != '033' && op != '032' &&  op != '034' ) {
		if (champ == 'c1') {
			$('#ec1').text('Votre contact devra commencer par 033 ou 032 ou 034 ');
		
		}
		else if (champ == 'c2') {
			$('#ec2').text('Votre contact devra commencer par 033 ou 032 ou 034 ');
		
		}
		else if (champ == 'c3') {
			$('#ec3').text('Votre contact devra commencer par 033 ou 032 ou 034 ');
		
		}
		
		return false;
	}
	if (op == '033' || op == '032'||  op == '034' ) {
		if (champ == 'c1') {
			$('#ec1').empty();
		}
		else if (champ == 'c2') {
			$('#ec2').empty();
		}
		else if (champ == 'c3') {
			$('#ec3').empty();
		}
		
		return true;
	}	
}
function long(champ , tel){
	var l = tel.length ;
	if (l < 13 ||  l > 13 ) {
		if (champ == 'c1') {
			$('#ec1').text('Votre contact devra contenir que 10 chiffres');
		
		}else if (champ =='c2') {
			$('#ec2').text('Votre contact devra contenir que 10 chiffres');
		
		}else if (champ =='c3') {
			$('#ec3').text('Votre contact devra contenir que 10 chiffres');
		
		}
	}
}

function espace(champ , tel){
	if (tel.length == 4 ) {
		var tel1 = tel.slice(0,3);
		var c=tel1+' '+tel.charAt(3);
		$('#'+champ).val(c);
	}
	else if ( tel.length == 7) {
		var tel1 = tel.slice(0,6);
		var c=tel1+' '+tel.charAt(6);
		$('#'+champ).val(c);         
	}
	else if (tel.length == 11) {
		var tel1 = tel.slice(0,10);
		var c=tel1+' '+tel.charAt(10);
		$('#'+champ).val(c);
	}
}

