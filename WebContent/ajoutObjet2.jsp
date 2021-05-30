<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="header.jsp"%>
	<h2 align="center">Ajoutez un article à échanger !</h2>
	<form action="AjoutProduitServlet" method="POST">
		<div class="container">
			<div class="form-group">
				<label for="SubCategory">Sous-Catégorie</label> <select
					id="SubCategory" class="form-control" required>
					<option selected>Choisissez...</option>
					<%
					if (session.getAttribute("Category").equals("Animaux")) {
					%>
					<option>Accessoires</option>
					<option>Jeux</option>
					<%
					} else if (session.getAttribute("Category").equals("Beauté")) {
					%>
					<option>Accessoires</option>
					<option>Maquillage</option>
					<option>Electroménager</option>
					<%
					} else if (session.getAttribute("Category").equals("Electroménager")) {
					%>
					<option>Bureau</option>
					<option>Cuisine</option>
					<option>Salon</option>
					<%
					} else if (session.getAttribute("Category").equals("Jardin")) {
					%>
					<option>Accessoires</option>
					<option>Outils</option>
					<option>Plantes</option>
					<%
					} else if (session.getAttribute("Category").equals("Jeux")) {
					%>
					<option>Jeux PC</option>
					<option>Jeux de société</option>
					<option>Jeux vidéos</option>
					<%
					} else if (session.getAttribute("Category").equals("Livres")) {
					%>
					<option>Action</option>
					<option>BD</option>
					<option>Classique</option>
					<option>Enfants</option>
					<option>Essais</option>
					<option>Scolaire</option>
					<option>Romance</option>
					<option>Théâtre</option>
					<option>Thriller</option>
					<%
					} else if (session.getAttribute("Category").equals("Maison")) {
					%>
					<option>Bureau</option>
					<option>Chambre</option>
					<option>Cuisine</option>
					<option>Salon</option>
					<option>Salle de bain</option>
					<%
					} else if (session.getAttribute("Category").equals("Vêtements")) {
					%>
					<option>Chaussures</option>
					<option>Déguisements</option>
					<option>Enfant</option>
					<option>Femme</option>
					<option>Homme</option>
					<option>Sac</option>
					<%
					}
					%>
				</select>
			</div>
			<div class="form-group">
				<label for="Description">Décrivez-nous votre objet !</label> <input
					type="text" class="form-control" id="Description"
					placeholder="Descriptif..." required>
			</div>
			<div class="form-group">
				<label for="State">Etat</label> <select id="State"
					class="form-control" required>
					<option selected>Choisissez...</option>
					<option>Comme neuf</option>
					<option>Bon état</option>
					<option>Etat correct</option>
					<option>A bien vécu</option>
				</select>
			</div>
			<button type="submit" class="btn btn-success">J'ajoute cet objet dans ma cave au trésor !</button>
		</div>
	</form>
</body>
</html>