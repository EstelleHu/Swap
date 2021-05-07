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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="docs\assets\brand\swap.png" width="80"
				height="30" alt="">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Accueil</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Animaux</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Jeux</a> <a
								class="dropdown-item" href="#">Accessoires</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Beauté</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Accessoires</a> <a
								class="dropdown-item" href="#">Maquillage</a> <a
								class="dropdown-item" href="#">Electroménager</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Electroménager</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Bureau</a> <a
								class="dropdown-item" href="#">Cuisine</a> <a
								class="dropdown-item" href="#">Salon</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Jardin</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Accessoires</a> <a
								class="dropdown-item" href="#">Outils</a> <a
								class="dropdown-item" href="#">Plantes</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Jeux</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Jeux PC</a> <a
								class="dropdown-item" href="#">Jeux de société</a> <a
								class="dropdown-item" href="#">Jeux vidéos</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Livres</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">BD</a> <a class="dropdown-item"
								href="#">Classique</a> <a class="dropdown-item" href="#">Enfants</a>
							<a class="dropdown-item" href="#">Essais</a> <a
								class="dropdown-item" href="#">Scolaire</a> <a
								class="dropdown-item" href="#">Romance</a> <a
								class="dropdown-item" href="#">Théâtre</a> <a
								class="dropdown-item" href="#">Thriller</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Maison</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Bureau</a> <a
								class="dropdown-item" href="#">Chambre</a> <a
								class="dropdown-item" href="#">Cuisine</a> <a
								class="dropdown-item" href="#">Salle de bain</a> <a
								class="dropdown-item" href="#">Salon</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Vêtements</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Chaussures</a> <a
								class="dropdown-item" href="#">Déguisement</a> <a
								class="dropdown-item" href="#">Enfant</a> <a
								class="dropdown-item" href="#">Femme</a> <a
								class="dropdown-item" href="#">Homme</a> <a
								class="dropdown-item" href="#">Sac</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="profil.jsp">Profil</a></li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search"
						placeholder="Research" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Rechercher</button>
				</form>
			</div>
		</div>
	</nav>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>