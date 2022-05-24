<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<div>
	${ exception }
</div>
<div id="formProd">
	
	<f:form modelAttribute="produit" action="saveProd" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>ID Produits : </td>
				<td><f:input path="idProduit"/></td>
				<td><f:errors path="idProduit" cssClass="errors"/></td>
			</tr>
			<tr>
				<td>Designation : </td>
				<td><f:textarea path="designation"/></td>
				<td><f:errors path="designation" cssClass="errors"/></td>
			</tr>
			<tr>
				<td>Déscription : </td>
				<td><f:textarea path="description"/></td>
				<td><f:errors path="description" cssClass="errors"/></td>
			</tr>
			<tr>
				<td>Categorie : </td>
				<td><f:select path="categorie.idcategorie" items="${categories}" itemValue="idcategorie" itemLabel="nomCategorie">
				</f:select></td>
				<td><f:errors path="description" cssClass="errors"/></td>
			</tr>
			<tr>
				<td>Prix : </td>
				<td><f:textarea path="prix"/></td>
				<td><f:errors path="prix" cssClass="errors"/></td>
			</tr>
			<tr>
				<td>Quantité : </td>
				<td><f:textarea path="quantite"/></td>
				<td><f:errors path="quantite" cssClass="errors"/></td>
			</tr>
			<tr>
				<td>Séléctionner ? </td>
				<td><f:checkbox path="selected"/></td>
				<td><f:errors path="selected" cssClass="errors"/></td>
			</tr>
			<c:if test="${ produit.idProduit != null }">
				<tr>
					<td></td>
					<td><img src="photoProd?idProd=${produit.idProduit}" width="50" height="50"/></td>
				</tr>
			</c:if>
			<tr>
				<td>Photo</td>
				<td><input type="file" name="file"/></td>
			</tr>
			<tr>
				<td><input type="submit" value="Save"/></td>
			</tr>
		</table>
	</f:form>
	<div id="">
		<table>
			<tr>
				<th>ID</th>
				<th>DESIGNATION </th>
				<th>DESCRIPTION</th>
				<th>CATEGORIES</th>
				<th>Prix</th>
				<th>Quantite</th>
				<th>Selected</th>
				<th>Photo</th>
			</tr>
			<c:forEach items="${produits}" var="p">
			<tr>
				<td>${p.idProduit}</td>
				<td>${p.designation}</td>
				<td>${p.description}</td>
				<td>${p.categorie.nomCategorie}</td>
				<td>${p.prix}</td>
				<td>${p.quantite}</td>
				<td>${p.selected}</td>
				<td><img src="photoProd?idProd=${p.idProduit}" width="50" height="50" /></td>
				<td><a href="suppProd?idProd=${p.idProduit}">Supp</a> </td>
				<td><a href="editProd?idProd=${p.idProduit}">Edit</a> </td>
			</tr>
		</c:forEach>
		</table> 
		<a href=" <c:url value="/j_spring_security_logout" />" >LOGOUT</a>
	</div>
</div>