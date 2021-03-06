<%@ page import="beans.Utilisateur" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.Produit"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<head>

<meta charset="UTF-8">
<style type="text/css">
</style>

<title>Profil</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	if ((boolean) session.getAttribute("isConnected")) {
			Utilisateur uti = (Utilisateur) session.getAttribute("utilisateur");
			System.out.println(uti.getPhoto());
	%>
	<p></p>
	<div class="container">
		<div class="row align-items-center">
			<div class="col">
				<%
				if(uti.getPhoto()==null){
						uti.setPhoto("docs/img/default-avatar.jpg");
					}
				%>
				<img src=<%=uti.getPhoto()%> class="img-thumbnail" width="120"
					height="120" alt="">
			</div>
			<div class="col">
				<h5><%=uti.getPrenom()%>
					<%=uti.getNom()%>
				</h5>
				<br>
				<%=uti.getCodePostal()%>
				<%=uti.getVille()%>
			</div>
			<div class="col"></div>
			<div class="col">
				<a href="ajoutObjet.jsp"
					style="text-decoration: none; color: black;"> <svg
						xmlns="http://www.w3.org/2000/svg" width="30" height="30"
						fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
  <path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
  <path
							d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
</svg> Ajoutez un objet !
				</a>
			</div>
		</div>
		<br> <br>

		<h4>La cave aux trésors</h4>
		<hr>
		<%
		ArrayList<Produit> products = (ArrayList<Produit>) session.getAttribute("myProfilProducts");
			if (products != null) {
		%>
		<div class="row row-cols-1 row-cols-md-3 g-3">


			<%
			for (Produit p : products) {
						if (p.getDispo() == 1) {
							System.out.println(p.getImage());
			%>
			<div class="col">
				<div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
					<img class="card-img-top" src=<%=p.getImage()%> width="200"
						height="200" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getNom()%></h5>
						<p class="card-text"><%=p.getPrix()%>
							euros
						</p>
						<p class="card-text"><%=p.getCategorie()%></p>
						<a href="produit.jsp?id=<%=p.getIdProduct()%>"
							class="btn btn-success">Voir le produit</a>
					</div>
				</div>
			</div>

			<%
					}
				}
				%>

			<%
			}
		}
		%>
		</div>
	</div>




	<%@include file="footer.jsp"%>
</body>
</html>