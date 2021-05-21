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
			<a class="navbar-brand" href="#"> <img src="docs\brand\swap.png"
				width="80" height="30" alt="">
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
						aria-current="page" href="accueil.jsp?id=accueil">Accueil</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Animaux</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="accueil.jsp?id=Jeux">Jeux</a> <a
								class="dropdown-item" href="accueil.jsp?id=Accessoires">Accessoires</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Beauté</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="accueil.jsp?id=Accessoires">Accessoires</a>
							<a class="dropdown-item" href="accueil.jsp?id=Maquillage">Maquillage</a>
							<a class="dropdown-item" href="accueil.jsp?id=Electroménager">Electroménager</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Electroménager</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="accueil.jsp?id=Bureau">Bureau</a>
							<a class="dropdown-item" href="accueil.jsp?id=Cuisine">Cuisine</a>
							<a class="dropdown-item" href="accueil.jsp?id=Salon">Salon</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Jardin</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="accueil.jsp?id=Accessoires">Accessoires</a>
							<a class="dropdown-item" href="accueil.jsp?id=Outils">Outils</a>
							<a class="dropdown-item" href="accueil.jsp?id=Plantes">Plantes</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Jeux</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="accueil.jsp?id=Jeux PC">Jeux
								PC</a> <a class="dropdown-item"
								href="accueil.jsp?id=Jeux de société">Jeux de société</a> <a
								class="dropdown-item" href="accueil.jsp?id=Jeux vidéos">Jeux
								vidéos</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Livres</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="accueil.jsp?id=Action">Action</a>
							<a class="dropdown-item" href="accueil.jsp?id=BD">BD</a> <a
								class="dropdown-item" href="accueil.jsp?id=Classique">Classique</a>
							<a class="dropdown-item" href="accueil.jsp?id=Enfants">Enfants</a>
							<a class="dropdown-item" href="accueil.jsp?id=Essais">Essais</a>
							<a class="dropdown-item" href="accueil.jsp?id=Scolaire">Scolaire</a>
							<a class="dropdown-item" href="accueil.jsp?id=Romance">Romance</a>
							<a class="dropdown-item" href="accueil.jsp?id=Théâtre">Théâtre</a>
							<a class="dropdown-item" href="accueil.jsp?id=Thriller">Thriller</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Maison</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="accueil.jsp?id=Bureau">Bureau</a>
							<a class="dropdown-item" href="accueil.jsp?id=Chambre">Chambre</a>
							<a class="dropdown-item" href="accueil.jsp?id=Cuisine">Cuisine</a>
							<a class="dropdown-item" href="accueil.jsp?id=Salle de bain">Salle
								de bain</a> <a class="dropdown-item" href="accueil.jsp?id=Salon">Salon</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Vêtements</a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="accueil.jsp?id=Chaussures">Chaussures</a>
							<a class="dropdown-item" href="accueil.jsp?id=Déguisement">Déguisement</a>
							<a class="dropdown-item" href="accueil.jsp?id=Enfant">Enfant</a>
							<a class="dropdown-item" href="accueil.jsp?id=Femme">Femme</a> <a
								class="dropdown-item" href="accueil.jsp?id=Homme">Homme</a> <a
								class="dropdown-item" href="accueil.jsp?id=Sac">Sac</a>
						</div></li>
					<li class="nav-item"><a href="ProfilServlet" class="nav-link" >Profil</a></li>
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