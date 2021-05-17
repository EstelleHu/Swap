<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="controller.Product"%>
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
	ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
	%>
	<div class="card-deck">
		<div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
			<img class="card-img-top" src="..." alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title">Card title</h5>
				<p class="card-text">This is a longer card with supporting text
					below as a natural lead-in to additional content. This content is a
					little bit longer.</p>
				<a href="#" class="btn btn-primary">Go somewhere</a>
			</div>
		</div>
	</div>
</body>
</html>