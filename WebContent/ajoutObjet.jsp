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
	<h2 align="center">Ajoutez un article à échanger !</h2>
	<form action="AjoutObjetServlet" method="POST"
		enctype='multipart/form-data'>
		<div class="container">
			<div class="form-group">
				<label for="NameProduct">Nom du produit</label> <input type="text"
					class="form-control" id="NameProduct" name="NameProduct"
					placeholder="Nom du produit" required>
			</div>
			<div class="form-group">
				<label for="Price">Prix de votre objet</label> <input type="number"
					step="0.01" class="form-control" id="Price" name="Price"
					placeholder="Prix" required>
			</div>
			<div class="form-group">
				<label for="Image" class="form-label">Une jolie photo de
					votre produit </label> <input class="form-control" type="file" id="Image"
					name="Image" accept="image/*" required >
			</div>
			<div class="form-group">
				<label for="Category">Catégorie</label> <select id="Category"
					name="Category" class="form-control" required>

					<option selected>Choisissez...</option>
					<option>Animaux</option>
					<option>Beauté</option>
					<option>Electroménager</option>
					<option>Jardin</option>
					<option>Jeux</option>
					<option>Livres</option>
					<option>Maison</option>
					<option>Vêtements</option>
				</select>
			</div>
			<button type="submit" class="btn btn-success">Suite de
				l'ajout de mon produit...</button>
		</div>
	</form>
	<%@include file="footer.jsp"%>
</body>
</html>