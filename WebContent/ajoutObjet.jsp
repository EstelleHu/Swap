<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajout d'un produit</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<%
		if ((boolean) session.getAttribute("isConnected")) {
	%>
	<div class="col-md-4 offset-md-4">
		<h1 class="display-4">Ajoutez votre objet !</h1>
		<form action="AjoutObjetServlet" method="POST">
			<div class="mb-3">
				<label for="inputNom" class="col-form-label">Nom du produit</label> <input
					type="text" class="form-control" id="inputNom" name="inputNom"
					required>
			</div>
			<div class="mb-3">
				<label for="inputCat" class="col-form-label">Catégorie</label> <input
					type="number" class="form-control" id="inputPrix" name="inputPrix"
					required>
			</div>
			<div class="mb-3">
				<label for="inputSsCat" class="col-form-label">Sous-catégorie
					</label> <input type="select" class="form-control"
					id="inputSsCat" name="inputSsCat" required>
			</div>
			<div class="mb-3">
				<label for="inputDescription" class="col-form-label">Description</label> <input
					type="text" class="form-control" id="inputDescription" name="inputDescription"
					required>
			</div>
			<div class="mb-3">
				<label for="inputEtat" class="form-label">Etat</label> <input
					type="select" class="form-control" id="inputEtat" name="inputEtat"
					required>
			</div>
			<div class="mb-3">
				<label for="formFile" class="form-label">Une jolie photo de votre objet
				</label> <input class="form-control" type="file" id="formFile" name="formFile" accept="image/*"> 
			</div>


	<button type="submit" class="btn btn-success">Ajouter cet
		objet</button>
	</form>
	</div>
	<%
		}
	%>
</body>
</body>
</html>