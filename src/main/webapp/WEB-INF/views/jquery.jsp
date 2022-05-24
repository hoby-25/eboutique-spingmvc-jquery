<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Produits</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
</head>
<body>
	<!-- 
		<input type="hidden" id="user_id">
		Name: <input type="text" id="name" required="required" name="user_name"><br>
		Email: <input type="email" id="email" required="required" name="email"><br>
		<button onclick="submit();">Submit</button>
	 -->
		<table id="table" border=1>
			<tr> <th> designation </th> <th> description </th> <th> prix </th>
				  <th> quantite </th> <th> selected </th> 
			 <th> Edit </th> <th> Delete </th> </tr>
		</table>
			
	
	<script type="text/javascript">
		data = "";
		
		$( document ).ready(function() {
		   load();
		});
		
		load = function(){	
				alert('Salut');
				$.ajax({
				url:'list',
				type:'POST',
				success: function(response){
						data = response.data;
						alert('Success');
						//console.log('Salut = ' + data[0].0);
						//$('.tr').remove();
						if(data.length > 1){
							for(i=0; i<response.data.length; i++){
								$("#table").append("<tr class='tr'> <td> "+response.data[i].designation+
								" </td> <td> "+response.data[i].description+" </td>"+
								"<td> "+response.data[i].prix+" </td>"+
								"<td> "+response.data[i].quantite+" </td>"+
								"<td> "+response.data[i].selected+" </td>"+
								" <td> <a href='#' onclick= edit("+i+
								");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("+response.data[i].idProduit+
								");'> Delete </a>  </td> </tr>");
							}	
						}
						else {
							console.log(data[0]);
							$("#table").append("<tr class='tr'> <td> "+data[0][1]+
									" </td> <td> "+ data[0][2] +" </td>"+
									"<td> "+ data[0][3] +" </td>"+
									"<td> "+ data[0][4] +" </td>"+
									"<td> "+ data[0][5] +" </td>"+
									" <td> <a href='#' onclick= edit("+1+
									");> Edit </a>  </td> </td> <td> <a href='#' onclick='delete_("+ data[0][0] +
									");'> Delete </a>  </td> </tr>");
						}
				} ,
				error : function(response){
					console.log(response);
					alert('Error');
				}
			});
		}
	</script>
	
</body>
</html>