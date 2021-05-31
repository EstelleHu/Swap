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
					id="SubCategory" name="SubCategory" class="form-control" required>
					<option selected>Choisissez...</option>
					<%
					if (session.getAttribute("Category").equals("Animaux")) {
					%>
					<option>Accessoires</option>
					<option>Jeux</option>
					<%
					} else if (session.getAttribute("Category").equals("Beaute")) {
					%>
					<option>Accessoires</option>
					<option>Maquillage</option>
					<option>Electromenager</option>
					<%
					} else if (session.getAttribute("Category").equals("ElectromÃ©nager")) {
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
					<option>Jeux de societe</option>
					<option>Jeux videos</option>
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
					<option>Theatre</option>
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
					} else {
					%>
					<option>Chaussures</option>
					<option>Deguisements</option>
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
					name="Description" placeholder="Descriptif..." required>
			</div>
			<div class="form-group">
				<label for="State">Etat</label> <select id="State" name="State"
					class="form-control" required>
					<option selected>Choisissez...</option>
					<option>Comme neuf</option>
					<option>Bon etat</option>
					<option>Etat correct</option>
					<option>A bien vecu</option>
				</select>
			</div>
			<button type="submit" class="btn btn-success">J'ajoute cet
				objet dans ma cave au trésor !</button>
		</div>
	</form>
</body>
</html>