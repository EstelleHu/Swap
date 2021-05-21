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
	<h2 align="center">Nos produits en stock</h2>
	<br>
	
		

	
		<%
		String id = request.getParameter("id");
		ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
		int i = 0;
		if(session.getAttribute("isConnected")==null || !(boolean) session.getAttribute("isConnected")  ){
		%>
			<h2 align="center">Connectez-vous pour voir tous nos produits disponibles à l'échange</h2>
		<% } else{
		if (id.equals("accueil")) {%>
			<div class="card-deck">
			<% for (Product p : products) {
				i++;
				if (i > 3) {
			i = 0;
		%>
	</div>
	<div class="card-deck">
		<%
		}
		if (!p.getDispo()) {
		%>
		<div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
			<img class="card-img-top" src="docs\brand\swap.png"
				alt="Card image cap">
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

		<%
		}
		}
		%>
	</div>
	<%
	} else {
	for (Product p : products) {
		i++;
		if (i > 3) {
			i = 0;
	%>
	<div class="card-deck">
		<%
		}
		if (!p.getDispo() && p.getSousCategorie().equals(id)) {
		%>
		<div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
			<img class="card-img-top" src="docs\brand\swap.png"
				alt="Card image cap">
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
		<%
		}
		}
		}
		}
		%>

	</div>
</body>
</html>