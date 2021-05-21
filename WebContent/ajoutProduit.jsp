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
				<label for="NameProduct">Nom du produit</label> <input type="text"
					class="form-control" id="NameProduct" placeholder="Nom du produit" required>
			</div>
			<div class="form-group">
				<label for="Price">Prix de votre objet</label> <input type="number"
					step="0.01" class="form-control" id="Price" placeholder="Prix" required>
			</div>
			<div class="form-group">
				<label for="Image">Photo de l'objet</label> <input type="file"
					class="form-control-file" id="Image">
			</div>
			<div class="form-group">
				<label for="Category">Catégorie</label> <select id="Category"
					class="form-control" required>
					<%
					String id;
					%>
					<option selected>Choisissez...</option>
					<option>Animaux
						<%
					id = "Animaux";
					%>
					</option>
					<option>Beauté
						<%
					id = "Beauté";
					%>
					</option>
					<option>Electroménager
						<a href="#"><%
					id = "Electroménager";
					%></a>
					</option>
					<option>Jardin
						<%
					id = "Jardin";
					%>
					</option>
					<option>Jeux
						<%
					id = "Jeux";
					%>
					</option>
					<option>Livres
						<%
					id = "Livres";
					%>
					</option>
					<option>Maison
						<%
					id = "Maison";
					%>
					</option>
					<option>Vêtements
						<%
					id = "Vêtements";
					%>
					</option>
				</select>
			</div>
			<div class="form-group">
				<label for="SubCategory">Sous-Catégorie</label> <select
					id="SubCategory" class="form-control" required>
					<option selected>Choisissez...</option>
					<%
					if (id.equals("Animaux")) {
					%>
					<option>Accessoires</option>
					<option>Jeux</option>
					<%
					} else if (id.equals("Beauté")) {
					%>
					<option>Accessoires</option>
					<option>Maquillage</option>
					<option>Electroménager</option>
					<%
					} else if (id.equals("Electroménager")) {
					%>
					<option>Bureau</option>
					<option>Cuisine</option>
					<option>Salon</option>
					<%
					} else if (id.equals("Jardin")) {
					%>
					<option>Accessoires</option>
					<option>Outils</option>
					<option>Plantes</option>
					<%
					} else if (id.equals("Jeux")) {
					%>
					<option>Jeux PC</option>
					<option>Jeux de société</option>
					<option>Jeux vidéos</option>
					<%
					} else if (id.equals("Livres")) {
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
					} else if (id.equals("Maison")) {
					%>
					<option>Bureau</option>
					<option>Chambre</option>
					<option>Cuisine</option>
					<option>Salon</option>
					<option>Salle de bain</option>
					<%
					} else if (id.equals("Vêtements")) {
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
		</div>
	</form>
</body>
</html>