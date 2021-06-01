<%@ page import="beans.Utilisateur" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style type="text/css">
</style>

<title>Proposition d'échange</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	if ((boolean) session.getAttribute("isConnected")) {
		ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("myProfilProducts");
		int id = Integer.parseInt(request.getParameter("id"));
		if (id == (int) session.getAttribute("idUtilisateur")) {
	%>
	<br>
	<br>
	<h4 align="center">Cet objet vous appartient déjà ;)</h4>
	<h4 align="center">Cherchez d'autres objets à échanger</h4>
	<%
	} else if (products != null) {
	int i = 0;
	%>
	<br>
	<br>
	<h4 align="center">Que voulez-vous échanger contre cet objet ?</h4>
	<hr>
	<div class="container">
		<form action="DemandeEchangeServlet" method="POST">
			<%
			for (Product p : products) {
				if (p.getDispo() == 1) {
			%>
			<div class="form-check">
				<input class="form-check-input" type="radio" value="<%=p.getNom()%>"
					id="chosenProduct" name="chosenProduct"> <label
					class="form-check-label" for="chosenProduct"> <%=p.getNom()%>
				</label>
			</div>
			<%
			}
			}
			%>
			<button type="submit" class="btn btn-success btn-block">Envoyer
				ma proposition d'échange</button>
		</form>
	</div>
	<%
	} else {
	%>
	<h4 align="center">Vous n'avez pas de produits à échanger :(</h4>
	<%
	}
	}
	%>

	<%@include file="footer.jsp"%>