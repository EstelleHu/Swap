<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.Product"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Accueil</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<br>

	<%
	String id = request.getParameter("id");
	ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
	if (session.getAttribute("isConnected") == null || !(boolean) session.getAttribute("isConnected")) {
	%>
	<h2 align="center">Connectez-vous pour voir tous nos produits
		disponibles à l'échange</h2>
	<%
	} else {
	%>
	<h2 align="center">Nos produits en stock</h2>
	<hr>
	<%
	if (id.equals("accueil")) {
	%>
	<div class="container">
		<div class="row align-items-center">
			<div class="row row-cols-1 row-cols-md-3 g-3">
				<%
				for (Product p : products) {
					if (p.getDispo() == 1) {
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
							<a href="productPage.jsp?id=<%=p.getIdProduct()%>"
								class="btn btn-success">Voir le produit</a>
						</div>
					</div>
				</div>

				<%
				}

				}
				%>
			</div>
			<%
			} else {
			for (Product p : products) {
			%>
			<div class="row row-cols-1 row-cols-md-3 g-3">
				<%
				if (p.getDispo() == 1 && p.getSousCategorie().equals(id)) {
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
							<a href="productPage.jsp?id=<%=p.getIdProduct()%>"
								class="btn btn-success">Voir le produit</a>
						</div>
					</div>
				</div>
				<%
				}
				}
				}
				}
				%>

			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>