<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<div>
	${ exception }
</div>
<div id="formCat">
	
	<div id="">
		<table>
			<tr>
				<th>ID</th>
				<th>NOM CAT</th>
				<th>DESCRIPTION</th>
				<th>PHOTO</th>
			</tr>
			<c:forEach items="${categories}" var="cat">
			<tr>
				<td>${cat.idcategorie}</td>
				<td>${cat.nomCategorie}</td>
				<td>${cat.description}</td>
				<td><img src="photoCat?idCat=${cat.idcategorie}" width="50" height="50" /></td>
				<td><a href="suppCat?idCat=${cat.idcategorie}">Supp</a> </td>
				<td><a href="editCat?idCat=${cat.idcategorie}">Edit</a> </td>
			</tr>
		</c:forEach>
		</table> 
		
	</div>
</div>