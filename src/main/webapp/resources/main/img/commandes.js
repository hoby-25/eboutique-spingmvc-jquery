$(document).ready(function(){
	$('#productsParMotCle').keyup(function(){
		productsParMotCle();
	})
})

function recupererDateActuelle(){
	let datenow = new Date(); 
	let mois = datenow.getMonth() + 1;
	let dat = datenow.getDate();

	let ladate;

	if(mois.toString().length == 1){
		mois = '0'+mois.toString();
    }
    if(dat.toString().length == 1){
		dat = '0'+dat.toString();
	}
    ladate = datenow.getFullYear()+'-'+mois+'-'+dat;

    return ladate;
}

function ajouterCommandeBDD(date , client){
		console.log('client.idClient');
		console.log(client);
		$.ajax({
				url:path+'/caissier/ajouterCommande',
				type:'POST',
				data:{ dateCommande : date , idCli : client.idClient},
				success: function(response){
					console.log(response.data);
					let listLigneCommande = [];
					for(var i = 0 ; i < lignes_de_commandes.length ; i++){
						let prix = parseInt(lignes_de_commandes[i].prix);
						let quantiteCommande = parseInt(lignes_de_commandes[i].quantiteCommande); 
						let prixCommande = prix * quantiteCommande ;
						
						let quantite = parseInt(lignes_de_commandes[i].quantite) ;
						console.log('quantite');
						console.log(quantite);
						
						console.log('quantiteCommande');
						console.log(quantiteCommande);
						
						let stock = quantite - quantiteCommande ;
						
						console.log('stock');
						console.log(stock);
						
						let item = {quantiteProd : stock , quantite : lignes_de_commandes[i].quantiteCommande  , prix : prixCommande ,  idProd : lignes_de_commandes[i].idProduit , idCom : response.data };
						$.ajax({
							url:path+'/caissier/ajouterLigneCommande',
							type:'POST',
							data: item ,
							success : function(response){
								console.log(response.data);
							}
						})
					}
					swal("Commande ajouté !", {
					      icon: "success",
					});	
					$('#tableau_bord').trigger('click');
					$('[href*="#tab4"]').trigger('click');
				}				
		})
}

function validerCommandes(){
	let date = recupererDateActuelle();
	let idClient = clients[0];
	
	let client = liste_des_clients.filter(function(client){
		return client.idClient == idClient;
	})

	console.log('filtre client ');
	//client[0].adresse = $.trim(client[0].adresse);
	//console.log('adresse'+ client[0].adresse);
	
	ajouterCommandeBDD(date , client[0]);
}

function calculTotalCommande(){
	let total = 0;
	for(let i = 0 ; i < lignes_de_commandes.length ; i++ ){
		let prix = parseInt(lignes_de_commandes[i].prix);
		let quantiteCommande = parseInt(lignes_de_commandes[i].quantiteCommande); 
		total += prix * quantiteCommande;
	}
	$('#totalCommande').html('TOTAL : ' + total + ' Ar');
}

function actualiserRecherche(){
	$('#articleCommande').val('');
	$('#typeCommande').val('');
	$('#tailleCommande').val('');
	$('#marqueCommande').val('');
	$('#couleurCommande').val('');
	lancerRecherche();
}

function ajouterAuCommande(id ,  prix , quantite , article , image , marque , qualite , taille , type , couleur ){
		products = new Array(id , prix , quantite , article , image , marque , qualite , taille , type , couleur);
		console.log("Products " + products);
}

function reinitialiserQteProduit(){
	for(var i = 0 ; i < liste_des_produits.length ; i++){
		liste_des_produits[i].quantiteCommande = 0;
		$('#nombre'+liste_des_produits[i].idProduit).html(liste_des_produits[i].quantite);
		$('#btnCommander'+ liste_des_produits[i].idProduit).show();
	}
}

function reinitialiserLigneCommandes(){
	lignes_de_commandes = [];
}
function annulerCommande(){
	swal({
		  title: "Etes vous sûr de d'annuler ce commande?",
		  icon: "error",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		  	lignes_de_commandes = [];
		  	calculTotalCommande();
		  	$('#lignesDesCommandes').html('');
		  	reinitialiserQteProduit();
		  	reinitialiserLigneCommandes();
		  	console.log('liste_des_produits');
		  	console.log(liste_des_produits);
		  } else {
		    swal("Votre commande n'a pas été annulé !");
		  }
		});
}

function cacherBtnCommander(reste , i ){
	if(reste == 0) {
		$('#btnCommander'+ liste_des_produits[i].idProduit).hide();
	}
	else {
		$('#btnCommander'+ liste_des_produits[i].idProduit).show();
	}
}

function updateQuantiteCommandeListeProduits(idProduit , quantiteCommande){
	for(let i = 0 ;  i < liste_des_produits.length ; i++){
		if ( liste_des_produits[i].idProduit == idProduit ) {

			let qteCommande = liste_des_produits[i].quantiteCommande;
			liste_des_produits[i].quantiteCommande = parseInt(qteCommande) + parseInt(quantiteCommande);
			let reste = parseInt(liste_des_produits[i].quantite) - parseInt(liste_des_produits[i].quantiteCommande); 
			
			cacherBtnCommander(reste , i);
			$('#nombre'+ liste_des_produits[i].idProduit).html(reste);
			
			i = liste_des_produits.length;
		}
	}
}

function verifierExisteLigneDeCommandes(idProduit , quantiteCommande){
	for(let i = 0 ; i < lignes_de_commandes.length ; i++){
		if (lignes_de_commandes[i].idProduit.trim() == idProduit.trim() ) {
			let qteCommande = lignes_de_commandes[i].quantiteCommande;
			lignes_de_commandes[i].quantiteCommande = parseInt(qteCommande) + parseInt(quantiteCommande);
			return true;
		}
	}
	return false;
}

function ajouterLigneDeCommandes(){
	item_commandes.quantiteCommande = $('#qteCommande').val();
	let existe = verifierExisteLigneDeCommandes( item_commandes.idProduit , item_commandes.quantiteCommande );
	updateQuantiteCommandeListeProduits( item_commandes.idProduit , item_commandes.quantiteCommande );
	
	if( !existe ){
		lignes_de_commandes.push(item_commandes);
	}

	afficherLigneCommande();
	$('#qteCommande').val('');
	calculTotalCommande();
}

function effacerLigneDeCommande(idProduit){
	let lignes_de_commandes_tmp = lignes_de_commandes.filter(function(ligne){
		return ligne.idProduit.trim() != idProduit.trim();
	}) 
	lignes_de_commandes = lignes_de_commandes_tmp ;
}

function réinitialiserQteCommandeListProduit(idProduit){
	for( let i = 0 ; i < liste_des_produits.length ; i++ ){
		if( liste_des_produits[i].idProduit == idProduit ){
			liste_des_produits[i].quantiteCommande = 0 ;
			$('#nombre'+idProduit).html(liste_des_produits[i].quantite);
		}
	}
}

function annulerLigneDeCommande(idProduit){
	// Effacer la ligne de commande
	effacerLigneDeCommande(idProduit);
	afficherLigneCommande();
	$('#btnCommander'+idProduit).show();
	
	// Remettre à 0 quantiteCommande de la liste produit
	réinitialiserQteCommandeListProduit(idProduit);
	calculTotalCommande();
}

function afficherLigneCommande(){
	let html = '';
	for(let i = 0 ; i < lignes_de_commandes.length ; i++ ){
		html += '<div class="card" style="width:270px;height:165px;padding: 10px;">'+
                            '<div class="row">'+
                                '<p class="material-design-btn col-lg-4">'+
                                    '<img class="card-img-top " src="'+path+'/resources/main/images/'+lignes_de_commandes[i].image+'" style="width: 100px;height: 100px;" alt="Card image">'+
                                '</p>'+
                                '<div class="card-body col-lg-8">'+
                                    '<h4 class="card-title">'+lignes_de_commandes[i].type+' en '+lignes_de_commandes[i].qualite+'</h4>'+
                                    '<p class="card-text"> Nombre acheté : '+lignes_de_commandes[i].quantiteCommande+ '<br>'+
                                            'Prix unitaire :'+lignes_de_commandes[i].prix+' Ar <br>'+
                                            'Prix : '+ parseInt(lignes_de_commandes[i].prix) * parseInt(lignes_de_commandes[i].quantiteCommande)+'Ar'+
                                    '</p>'+
                                   '<p class="material-design-btn">'+
                                         '<button class="btn notika-btn-cyan" onclick=annulerLigneDeCommande("'+ lignes_de_commandes[i].idProduit + '")>Annuler</button>'+
                                    '</p>'+
                                '</div>'+
                            '</div>'+  
                        '</div>';
	}
	$('#lignesDesCommandes').html(html);
}

function commanderProduit(id ,  prix , quantite , article , image , marque , qualite , taille , type , couleur ){
	item_commandes = {idProduit : id, prix : prix ,quantite : quantite , article : article , image :image, marque : marque, qualite : qualite , taille : taille , type : type , couleur : couleur , quantiteCommande : 0}; 
	$('#produitCommande').html('');
	$("#produitCommande").html("Article : "+ type +"<br>Marque : " + marque +" <br> Taille : " + taille + "<br> Stock : " + quantite + "<br> Prix : " + prix + " Ariary <br> Couleur : " + couleur );
}

function productsParMotCle(){
	/*$.ajax({
			url : path+'/adminProduct/productsParMotCle',
			type : 'POST' ,
			data : {motCles: $('#productsParMotCle').val()  },
			success : function(response){
				var data = response.data;
				var html = ' ';
				for(var i = 0 ; i < data.length ; i++){
					html += '<div class="col-lg-4">'+
	                                '<div class="card" style="width:400px;margin: 20px;">'+
	                                  '<img class="card-img-top"  src="'+path+'/resources/main/images/'+data[i][4]+'"style="width:150px;height:150px;" alt="Card image">'+
	                                  '<div class="card-body">'+
	                                    '<h4 class="card-title">'+ data[i][8] +' en ' + data[i][6]  +'</h4>'+
	                                    '<p class="card-text">Marque :'+ data[i][5] +' <br>'+
	                                    'Taille : '+data[i][7] +'<br> Nombre :' +data[i][2]+' <br>'+
	                                    'Prix : '+data[i][1] +'Ar </p>'+
	                                    '<div class="material-design-btn">'+
	                                        '<button class="btn notika-btn-cyan" data-toggle="modal" data-target="#myModalquantite" >Commander</button>'+
	                                    '</div>'+
	                                  '</div>'+
	                                '</div>'+ 
	                        '</div>' ;
				}
				console.log(html);
	            $('#listeProduitCommande').html(html);
			}
	})*/
	let motCles = $('#productsParMotCle').val();
	for(var i = 0 ; i < liste_des_produits.length ; i++){
			let conditionArticle = rechercherArticle(motCles , i);
			let conditionType = rechercherType(motCles , i);
			let conditionTaille = rechercherTaille(motCles , i);
			let conditionMarque = rechercherMarque(motCles , i);
			let conditionCouleur = rechercherCouleur(motCles , i);
			let conditionQualite = rechercherQualite(motCles , i);

			if(conditionQualite || conditionArticle || conditionType || conditionTaille || conditionMarque || conditionCouleur){
				$('#produitN'+liste_des_produits[i].idProduit).show();
			}
			else{
				$('#produitN'+liste_des_produits[i].idProduit).hide();
			}
	}
}

function rechercherArticle(article , i){
	if (article.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].article.trim().toUpperCase().indexOf( article.trim().toUpperCase() ) != -1 ) ? true : false ;
	}
}

function rechercherType(type , i){
	if (type.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].type.trim().toUpperCase().indexOf( type.trim().toUpperCase() ) != -1 ) ? true : false ;
	}
}

function rechercherTaille(taille , i){
	if (taille.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].taille.trim().toUpperCase().indexOf(taille.trim().toUpperCase()) != -1 ) ? true : false ;
	}
}

function rechercherMarque(marque , i){
	if (marque.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].marque.trim().toUpperCase().indexOf( marque.trim().toUpperCase() ) != -1 ) ? true : false ;
	}
}

function rechercherQualite(qualite , i){
	if (qualite.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].qualite.trim().toUpperCase().indexOf(qualite.trim().toUpperCase()) != -1 ) ? true : false ;
	}
}

function rechercherCouleur(couleur , i){
	if (couleur.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].couleur.trim().toUpperCase().indexOf(couleur.trim().toUpperCase()) != -1 ) ? true : false ;
	}
}

function verifierconditionArticle(article , i){
	if (article.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].article.trim() == article.trim() ) ? true : false ;
	}
}

function verifierconditionType(type , i){
	if (type.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].type.trim() == type.trim() ) ? true : false ;
	}
}

function verifierconditionTaille(taille , i){
	if (taille.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].taille.trim() == taille.trim() ) ? true : false ;
	}
}

function verifierconditionMarque(marque , i){
	if (marque.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].marque.trim() == marque.trim() ) ? true : false ;
	}
}

function verifierconditionCouleur(couleur , i){
	if (couleur.trim().length == 0 ){
		return true;
	}
	else{
		return ( liste_des_produits[i].couleur.trim() == couleur.trim() ) ? true : false ;
	}
}

function lancerRecherche(){
	//liste_des_produits;
	let article = $('#articleCommande').val() ;
	let type =  $('#typeCommande').val() ;
	let taille = $('#tailleCommande').val();
	let marque = $('#marqueCommande').val();
	let couleur = $('#couleurCommande').val();
    
    //Recherche rapide
    let chiffre = ' ';
    console.log('Condition = ' + article.trim().length);
    
    //Recherche rapide
	for(var i = 0 ; i < liste_des_produits.length ; i++){
			let conditionArticle = verifierconditionArticle(article , i);
			let conditionType = verifierconditionType(type , i);
			let conditionTaille = verifierconditionTaille(taille , i);
			let conditionMarque = verifierconditionMarque(marque , i);
			let conditionCouleur = verifierconditionCouleur(couleur , i);
			
			if(conditionArticle && conditionType && conditionTaille && conditionMarque && conditionCouleur){
				$('#produitN'+liste_des_produits[i].idProduit).show();
			}
			else{
				$('#produitN'+liste_des_produits[i].idProduit).hide();
			}
	}
	/*html += '<div class="col-lg-4">'+
                                '<div class="card" style="width:400px;margin: 20px;">'+
                                  '<img class="card-img-top"  src="'+path+'/resources/main/images/'+data[i][4]+'"style="width:150px;height:150px;" alt="Card image">'+
                                  '<div class="card-body">'+
                                    '<h4 class="card-title">'+ data[i][8] +' en ' + data[i][6]  +'</h4>'+
                                    '<p class="card-text">Marque :'+ data[i][5] +' <br>'+
                                    'Taille : '+data[i][7] +'<br> Nombre :' +data[i][2]+' <br>'+
                                    'Prix : '+data[i][1] +'Ar </p>'+
                                    '<div class="material-design-btn">'+
                                        '<button class="btn notika-btn-cyan" data-toggle="modal" data-target="#myModalquantite" >Commander</button>'+
                                    '</div>'+
                                  '</div>'+
                                '</div>'+ 
    '</div>' ;
	}*/
	/*$.ajax({
		url : path+'/adminProduct/lancerRecherche' ,
		type : 'POST' ,
		data : {article: $('#articleCommande').val() , type: $('#typeCommande').val() , taille:$('#tailleCommande').val(), marque:$('#marqueCommande').val(), couleur:$('#couleurCommande').val() },
		success : function(response){
			var data = response.data;
			var html = ' ';
			for(var i = 0 ; i < data.length ; i++){
				html += '<div class="col-lg-4">'+
                                '<div class="card" style="width:400px;margin: 20px;">'+
                                  '<img class="card-img-top"  src="'+path+'/resources/main/images/'+data[i][4]+'"style="width:150px;height:150px;" alt="Card image">'+
                                  '<div class="card-body">'+
                                    '<h4 class="card-title">'+ data[i][8] +' en ' + data[i][6]  +'</h4>'+
                                    '<p class="card-text">Marque :'+ data[i][5] +' <br>'+
                                    'Taille : '+data[i][7] +'<br> Nombre :' +data[i][2]+' <br>'+
                                    'Prix : '+data[i][1] +'Ar </p>'+
                                    '<div class="material-design-btn">'+
                                        '<button class="btn notika-btn-cyan" data-toggle="modal" data-target="#myModalquantite">Commander</button>'+
                                    '</div>'+
                                  '</div>'+
                                '</div>'+ 
                        '</div>' ;
			}
			console.log(html);
            $('#listeProduitCommande').html(html);
		}
	})*/	
}

