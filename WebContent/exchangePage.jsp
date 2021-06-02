<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="beans.Product"%>
<%@ page import="beans.Echange"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exchange Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="header.jsp"%>
	<br>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	session.setAttribute("monEchange", id);
	HashMap<Integer, Echange> h = (HashMap<Integer, Echange>) session.getAttribute("myExchange");
	Echange e = h.get(id);
	ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
	int j = 0;
	if (e.getIdAutreUser() != (int) session.getAttribute("idUtilisateur")) {
		for (int i = 0; i < products.size(); i++) {
			j = j + 1;
			if (products.get(i).getIdProduct() == e.getIdAutreObjet()) {
		break;
			}
		}
	} else {
		for (int i = 0; i < products.size(); i++) {
			j = j + 1;
			if (products.get(i).getIdProduct() == e.getIdMonObjet()) {
		break;
			}
		}
	}
	Product toDisplay = products.get(j - 1);
	%>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-auto">
				<img class="card-img-top" src=<%=toDisplay.getImage()%> alt="">
			</div>
		</div>
		<div class="row justify-content-md-center">
			<h3 class="col-md-auto text-success">
				<strong><%=toDisplay.getNom()%></strong>
			</h3>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto">
				Prix :
				<%=toDisplay.getPrix()%>
				euros
			</div>
			<div class="col-md-auto">
				Etat :
				<%=toDisplay.getEtat()%></div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto">
				Catégorie :
				<%=toDisplay.getCategorie()%></div>
			<div class="col-md-auto">
				Sous-catégorie :
				<%=toDisplay.getSousCategorie()%></div>
		</div>
		<div class="row justify-content-md-center">
			<div class="col-md-auto"><%=toDisplay.getDescription()%></div>
		</div>
		<%
		if (e.getState().equals("En attente") && e.getIdAutreUser() == (int) session.getAttribute("idUtilisateur")) {
		%>
		<div class="row justify-content-md-center">
			<a href="AcceptEchangeServlet" class="btn btn-success btn-block">Accepter
				l'échange</a> <a href="RefusEchangeServlet"
				class="btn btn-danger btn-block">Refuser l'échange</a>
		</div>
		<%
		} else if (e.getState().equals("En attente") && e.getIdAutreUser() != (int) session.getAttribute("idUtilisateur")) {
		%>
		<div class="row justify-content-md-center">
			<div class="col-md-auto">
				<h4>Attendez que le swappeur vous réponde :)</h4>
			</div>
		</div>
		<%
		} else if (e.getState().equals("En cours")) {
		%>
		<div class="row justify-content-md-center">
			<a href="FinaliseEchangeServlet" class="btn btn-success btn-block">J'ai
				bien reçu mon objet</a>
			<%
			} else if (e.getState().equals("Refus")) {
			%>
			<div class="col-md-auto">
				<h4>Le swap n'a pas pu se faire...</h4>
			</div>
			<div class="col-md-auto">
				<h4>
					Swappe de nouveaux objets <a href="accueil.jsp?id=accueil">ici.
					</a>
				</h4>
			</div>
		</div>
		<%
		} else {
		%>
		<div class="row justify-content-md-center">
			<div class="col-md-auto">
				<h4>
					Le swap a bien été effectué le
					<%=e.getDate()%>.
				</h4>
			</div>
			<div class="col-md-auto">
				<h4>
					Swappe de nouveaux objets <a href="accueil.jsp?id=accueil">ici.
					</a>
				</h4>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>