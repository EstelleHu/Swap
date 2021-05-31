<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="beans.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="header.jsp"%>
	<br>
	<% int id = Integer.parseInt(request.getParameter("id"));
	ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
	int j = 0;
	for(int i=0; i < products.size(); i++){
		j = j + 1;
		if(products.get(i).getIdProduct() == id){
			break;
		}
	}
	Product toDisplay = products.get(j-1);%>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-auto"><img class="card-img-top" src=<%=toDisplay.getImage()%>
				alt=""></div>
		</div>
		<div class="row justify-content-md-center">
			<h3 class="col-md-auto text-success"><strong><%=toDisplay.getNom()%></strong></h3>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto"> Prix : <%=toDisplay.getPrix() %> euros</div>
			<div class="col-md-auto">Etat : <%=toDisplay.getEtat() %></div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto">Catégorie : <%=toDisplay.getCategorie() %></div>
			<div class="col-md-auto">Sous-catégorie : <%=toDisplay.getSousCategorie() %></div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto"><%=toDisplay.getDescription() %></div>
		</div>
		<div class="row justify-content-md-center">
			<a href="demandeEchange.jsp?id=<%=toDisplay.getIdUser()%>" class="btn btn-success btn-block">Demander un échange <%session.setAttribute("productToExchange", toDisplay); %></a>
		</div>
	</div>

</body>
</html>