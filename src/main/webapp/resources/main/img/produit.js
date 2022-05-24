	$(document).ready(function(){
		$('#btn_erreurPro').hide();
		$('#propos').hide();
		
		$('#article').change(function(){
			if($('#article').val() == 'Sac'){
				$('.Vêtement').hide();
				$('.Sac').show();
			}
			else if($('#article').val() == 'Vêtement'){
				$('.Vêtement').show();
				$('.Sac').hide();
			}
		})
		$('#articleCommande').change(function(){
			if($('#articleCommande').val() == 'Sac'){
				$('.Vêtement').hide();
				$('.Sac').show();
			}
			else if($('#articleCommande').val() == 'Vêtement'){
				$('.Vêtement').show();
				$('.Sac').hide();
			}
		})
		
		$('#retourPro').click(function(){
			$('#ajout_produit').trigger('click');
		})

		$('#save').click(function(){
			verifiePro();
			e_erreurPro();
		})
		$('#ajout_produit').click(function(){
			$('#btnUpdateProduit').hide();
			$('#btnEnregistrerProduit').show();
		})
	})

	function updateProduit(){
		$.ajax({
			url : path+'/adminProduct/updateProduit',
			type : 'POST' ,
			data:{ idProduit : products[0] , quantite : $('#nombre').val() , article : $('#article').val() , type : $('#type').val(), image : products[4] , taille : $('#taille').val() , qualite : $('#qualite').val() , marque : $('#marque').val(), prix : $('#prix').val(), couleur : $('#couleur').val()},
			success : function(){
					swal({
					  title: "Produit modifié avec succès ss!",
					  icon: "success",
					  button: "OK",
					});
					fermerModalProduct();
					$('#listeProduct').DataTable().ajax.reload();
			}
		})
	}

	function enregistrerProduit(){
		//console.log('Article du produit ' + $('#article').val());
		// Condition de l'UPLOAD
		let image;

		if($('#type').val().trim() == 'Banane'){
			image = 'banane_noir.jpg';
		}
		else if($('#type').val().trim() == 'Cartable'){
			image = 'cartable_noir.jpg';
		}
		else if($('#type').val().trim() == 'Pochette'){
			image = 'pochette_noir.jpg';
		}
		else if($('#type').val().trim() == 'Coffret'){
			image = 'coffret_noir.jpg';
		}

		else if($('#type').val().trim() == 'Patalon'){
			image = 'patalon_blanc.jpg';
		}
		else if($('#type').val().trim() == 'Robe'){
			image = 'robe_noir_cuir.jpg';
		}
		else if($('#type').val().trim() == 'Short'){
			image = 'shortMaron.jpg';
		}
		else if($('#type').val().trim() == 'Tunnique'){
			image = 'tunnique_bleu.jpg';
		}
		// Condition de l'UPLOAD
		$.ajax({
				url:path+'/adminProduct/ajouterProduit',
				type:'POST',
				data:{ quantite : $('#nombre').val() , article : $('#article').val() , type : $('#type').val(), taille : $('#taille').val() , qualite : $('#qualite').val() , marque : $('#marque').val(), prix : $('#prix').val(), image : image , couleur : $('#couleur').val()},
				success: function(response){
					$('#listeProduct').DataTable().ajax.reload();
					$('#nombre').val('');
					$('#article').val('');
					$('#type').val('');
					$('#taille').val('');
					$('#qualite').val('');
					$('#marque').val('');
					$('#prix').val('');
					$('#couleur').val('');
					swal({
					  title: "Produits enregistré !",
					  icon: "success",
					  button: "OK",
					});
					fermerModalProduct();
				}				
		})
	}
	
	function fermerModalProduct(){
		$('.modal-backdrop').remove();
	    $('body').removeClass('modal-open');
		$('#myModalproduit').css('display', 'none');
	}

	function cliquerProduit(){
	    	if(!cliqueProduit){
	    		listeProduct = $('#listeProduct').DataTable({
	        		ajax :{
	        			url: path+'/adminProduct/listProduit',
	        			method:'POST',
	        		},
	        		columns : [
	        			{ 
	        				data : '4',
	        				render : function(data){
	        					return "<img src='"+path+"/resources/main/images/"+data+"' width='100px' height='100px'/>";
	        				}
	        			},
	        			{ data : '3' },
	        			{ data : '8' },
	        			{ data : '7' },
	        			{ data : '5' },
	        			{ data : '6' },
	        			{ 	
	        				data : '1' ,
	        				render : function(data){
	        					return data + " Ariary";
	        				}
	        			},
	        			{ data : '2' },
	        			{ data : '9' },
	        			{
	        				data : {A : '4' , B : '5'} ,
	        				render : function(data){
	        					return "<div class='inbox status'><div class='inbox-st-nav inbox-nav-mg'>"+
	                                                    "<button onclick=ajouterStock('"+data[0] +"','"+ data[1] +"','"+ data[2] +"','"+ data[3] +"','"+data[4]+"','"+data[5]+"','"+data[6]+"','"+ data[7] +"','"+ data[8]+"','"+ data[9]+"') style='margin-left: 5px;' class='btn btn-lightblue lightblue-icon-notika' data-toggle='modal' data-target='#myModalthree'><i class='fa fa-plus'></i><span style='padding-left: 5px;'> Nouveau arrivage</span></button>" +
	        											"<button onclick=modifierProduit('"+data[0] +"','"+ data[1] +"','"+ data[2] +"','"+ data[3] +"','"+data[4]+"','"+data[5]+"','"+data[6]+"','"+ data[7] +"','"+ data[8]+"','"+ data[9]+"') style='margin-left: 5px;' class='btn btn-info info-icon-notika' data-toggle='modal' data-target='#myModalproduit'>"+
	        												"<i class='notika-icon notika-draft'></i><span style='padding-left: 5px;'>Modifier</span>"+
	                                                    "</button>" +
	                                                    "<button onclick=deleteProduit('"+data[0] +"','"+ data[1] +"','"+ data[2] +"','"+ data[3] +"','"+data[4]+"','"+data[5]+"','"+data[6]+"','"+ data[7] +"','"+ data[8]+"','"+ data[9]+"') style='margin-left: 5px;' class='btn btn-danger danger-icon-notika'>"+
	                                                    	"<i class='notika-icon notika-trash'></i><span style='padding-left: 5px;'>Supprimer</span>"+
	                                                    "</button>"+
	                            "</div></div>";
	        				}
	        			}
	        		]
	        	});	
				cliqueProduit = true;
	    	}
	}

	function modifierProduit(id ,  prix , quantite , article , image , marque , qualite , taille , type , couleur ){
		products = new Array(id , prix , quantite , article , image , marque , qualite , taille , type , couleur);
		console.log(" Products " + products);
		if($('#article').val() == 'Sac'){
			$('.Vêtement').hide();
			$('.Sac').show();
		}
		else if($('#article').val() == 'Vêtement'){
			$('.Vêtement').show();
			$('.Sac').hide();
		}
		$('#nombre').val(quantite);
		$('#article').val(article);
		$('#type').val(type);
		$('#taille').val(taille);
		$('#qualite').val(qualite);
		$('#marque').val(marque);
		$('#prix').val(prix);
		$('#couleur').val(couleur);
		$('#btnUpdateProduit').show();
		$('#btnEnregistrerProduit').hide();
	}
	
	function ajouterStock(id ,  prix , quantite , article , image , marque , qualite , taille , type , couleur ){
		products = new Array(id , prix , quantite , article , image , marque , qualite , taille , type , couleur);
		console.log(" Products " + products);
	}
	
	function ajouterAuStock(){
		console.log("Quantite = " + products);
		var qte = parseInt($('#stock').val()) + parseInt(products[2]);
		console.log("Prix = " + qte);
		$.ajax({
					url:path+'/adminProduct/ajouterStock',
					type:'POST',
					data:{ idProduit : products[0] , quantite : qte , article : products[3] , type : products[8], taille : products[7] , qualite : products[6] , marque : products[5], prix : products[1], image : products[4] , couleur : products[9]},
					success: function(response){
							console.log(response);
							$('#listeProduct').DataTable().ajax.reload();
							$('#stock').val('');
					}				
		});
	}
	function deleteProduit(id){
			console.log(" Id = " + id);
			swal({
			  title: "Etes vous sûr de supprimer ce produit ?",
			  icon: "error",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			  	$.ajax({
					url:path+'/adminProduct/deleteProduct',
					type:'POST',
					data:{idProduit:id},
					success: function(response){
							console.log(response);
							$('#listeProduct').DataTable().ajax.reload();
							swal("Le produit a été suppprimé!", {
						      icon: "success",
						    });
						    fermerModalProduit();
					}				
				});
			  } else {
			    swal("La suppression a été annulé!");
			  }
			});
	}

	function fermerModalProduit(){
		$('.modal-backdrop').remove();
	    $('body').removeClass('modal-open');
		//$('#myModalclient').css('display', 'none');
	}

	function e_erreurPro(){
		var erreur ='';
		if (  ($('#img').text().length) > 0 || ($('#earticle').val().length) > 0 || ($('#etype').val().length) > 0 || ($('#etaille').val().length) > 0 || ($('#equalite').val().length) > 0 || ($('#eprix').text().length) > 0 || ($('#enb').text().length) > 0 )  {
			if(($('#eimg').text().length) > 0){
				erreur += ' - '+$('#eimg').text()+'<br>';
			}
			if(($('#earticle').val().length) > 0){
				erreur += ' - '+$('#earticle').val()+'<br>';
			}
			if(($('#etype').val().length) > 0){
				erreur += ' - '+$('#etype').val()+'<br>';
			}
			if(($('#etaille').val().length) > 0){
				erreur += ' - '+ $('#etaille').val()+'<br>';
			}
			if(($('#equalite').val().length) > 0){
				erreur += ' - '+ $('#equalite').val()+'<br>';
			}
			if(($('#eprix').text().length) > 0){
				erreur += ' - '+ $('#eprix').text()+'<br>';
			}
			if(($('#enb').text().length) > 0){
				erreur += ' - '+ $('#enb').text()+'<br>';
			}
				var p = document.getElementById('erreur');
				p.innerHTML = erreur;
				$('#close_pro').trigger('click');
				$('#btn_erreur').trigger('click');
			


			return true;
		}else{
			$('#close_pro').trigger('click');
			$('#succes')[0].play();
			swal({
			  title: "Produits enregistré !",
			  icon: "success",
			  button: "Retour",
			});


		}
	}

	function verifiePro(){
		img();
		article();
		type();
		qualite();
		prix();
		nb();
	}


	function img(){
		if ( $('#img').text().length == 0 ){
			$('#eimg').text("Vous devez choisir l'image du produit.");
			return true;
		}else{
			return false;
		}
	}

	function article(){
		if ( $('#article').val().length == 0 ){
			$('#earticle').text("Vous devez choisir l'article.");
			return true;
		}else{
			return false;
		}
	}

	function type(){
		if ( $('#type').val().length == 0 ){
			$('#etype').text("Vous devez choisir le type du produit.");
			return true;
		}else{
			return false;
		}
	}

	function qualite(){
		if ( $('#qualite').val().length == 0 ){
			$('#equalite').text("Vous devez choisir la qualité du produit.");
			return true;
		}else{
			return false;
		}
	}

	function prix(){
		if ( $('#prix').text().length == 0 ){
			$('#eprix').text("Vous devez saisir le prix du produit.");
			return true;
		}else{
			return false;
		}
	}

	function nb(){
		if ( $('#nb').text().length == 0 ){
			$('#enb').text("Vous devez saisir le nombre du produit.");
			return true;
		}else{
			return false;
		}
	}