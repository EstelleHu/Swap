<%@ page import="beans.Utilisateur" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
a {
	text-decoration: none;
	color: white;
}
</style>

<title>Profil</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
		if ((boolean) session.getAttribute("isConnected")) {
		Utilisateur uti = (Utilisateur) request.getAttribute("utilisateur");
	%>
	<p></p>

	<div class="container">
		<div class="row align-items-center">
			<div class="col">
				<img src="docs\img\default-avatar.jpg" class="img-thumbnail"
					width="120" height="120" alt="">
			</div>
			<div class="col"><%=uti.getPrenom()%>
				<%=uti.getNom()%><br>
				<%=uti.getCodePostal()%>
				<%=uti.getVille()%></div>
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
	</div>

	<%
		}
	%>
<%@include file="footer.jsp"%>
</body>
</html>