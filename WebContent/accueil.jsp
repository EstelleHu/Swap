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
	<%	String echange_msg=(String)request.getAttribute("demandeReussie");  
		if(echange_msg!=null)
		out.println("<div class='alert alert-success' role='alert'>"+echange_msg+"</div>");
		 %>
	<%	String acceptEchange_msg=(String)request.getAttribute("acceptEchange");  
		if(acceptEchange_msg!=null)
		out.println("<div class='alert alert-success' role='alert'>"+acceptEchange_msg+"</div>");
		 %>
	<%	String refusEchange_msg=(String)request.getAttribute("refusEchange");  
		if(refusEchange_msg!=null)
		out.println("<div class='alert alert-danger' role='alert'>"+refusEchange_msg+"</div>");
		 %>
	<%	String finEchange_msg=(String)request.getAttribute("finEchange");  
		if(finEchange_msg!=null)
		out.println("<div class='alert alert-info' role='alert'>"+finEchange_msg+"</div>");
		 %>
	<%
	String id = request.getParameter("id");
	ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
	System.out.println(products);
	if (session.getAttribute("isConnected") == null || !(boolean) session.getAttribute("isConnected")) {
	%>
	<h2 align="center"><a href="index.jsp">Connectez-vous </a> pour voir tous nos produits
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
		</div>
	</div>
	<%
		} else {
		%>
	<div class="container">
		<div class="row align-items-center">
			<div class="row row-cols-1 row-cols-md-3 g-3">
				<%
				for (Product p : products) {
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
				%>
			</div>
		</div>
		<%
			}
			}
			%>

	</div>
	<%@include file="footer.jsp"%>
</body>
</html>