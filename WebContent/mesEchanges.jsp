<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="beans.Echange"%>
<%@ page import="beans.Product"%>
<%@ page import="beans.Utilisateur"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	padding-bottom: 90px;
}

body {
	margin-bottom: 90px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<br>
	<br>
	<h4 align="center">Mes échanges</h4>
	<hr>
	<%
	HashMap<Integer, Echange> mesEchanges = (HashMap<Integer, Echange>) session.getAttribute("myExchange");
	System.out.println(mesEchanges);
	ArrayList<Product> product = (ArrayList<Product>) session.getAttribute("products");
	if (mesEchanges.isEmpty()) {
	%>
	<h4 align="center">Vous n'avez pas encore d'échanges en cours !</h4>
	<h4 align="center">
		Retrouvez tous les produits de vos rêves <a
			href="accueil.jsp?id=accueil"> ici</a>
	</h4>
	<%
	} else {
	%>
	<table class="table table-bordered">
		<thead>
			<tr class="table-success">
				<th scope="col" class="table-success">Mon objet à swapper</th>
				<th scope="col" class="table-success">L'objet que je vais
					recevoir en retour</th>
				<th scope="col" class="table-success">Le nom de l'autre swappeur</th>
				<th scope="col" class="table-success">Son téléphone</th>
				<th scope="col" class="table-success">Date de l'échange</th>
				<th scope="col" class="table-success">Statut de l'échange</th>
				<th scope="col" class="table-success">Visualiser l'objet</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Map.Entry<Integer, Echange> m : mesEchanges.entrySet()) {
				Echange e = m.getValue();
				String objectDest = "";
				String objectEm = "";
				for (Product p : product) {
					if (p.getIdProduct() == e.getIdMonObjet()) {
				objectDest = p.getNom();
					} else if (p.getIdProduct() == e.getIdAutreObjet()) {
				objectEm = p.getNom();
					}
				}
			%>
			<tr>
				<%if(e.getIdAutreUser() != (int) session.getAttribute("idUtilisateur")){ %>
				<th scope="row" class="table-success"><%=objectDest%></th>
				<td class="table-success"><%=objectEm%></td>
				<td class="table-success"><%=e.getNom()%></td>
				<td class="table-success"><%=e.getPhone()%></td>
				<td class="table-success"><%=e.getDate()%></td>
				<td class="table-success"><%=e.getState()%></td>
				<td class="table-success"><a href="exchangePage.jsp?id=<%=m.getKey()%>"
					class="btn btn-success">Détail du produit à recevoir</a></td>
				<%} else {
				HashMap<Integer, Utilisateur> users = (HashMap<Integer, Utilisateur>) session.getAttribute("users");
				Utilisateur u = users.get(e.getIdDest());%>
					<th scope="row" class="table-success"><%=objectEm%></th>
				<td class="table-success"><%=objectDest%></td>
				<td class="table-success"><%=u.getPrenom()%> <%=u.getNom()%></td>
				<td class="table-success"><%=e.getPhone()%></td>
				<td class="table-success"><%=e.getDate()%></td>
				<td class="table-success"><%=e.getState()%></td>
				<td class="table-success"><a href="exchangePage.jsp?id=<%=m.getKey()%>"
					class="btn btn-success">Détail du produit à recevoir</a></td>
				<%}%>
			</tr>
			<%
			}
			}
			%>
		</tbody>
	</table>
	<%@include file="footer.jsp"%>
</body>
</html>