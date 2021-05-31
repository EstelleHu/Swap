<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Connexion</title>
</head>
<body>
	<%@include file="header.jsp"%>
	
	<%	String inscription_msg=(String)request.getAttribute("inscriptionReussie");  
		if(inscription_msg!=null)
		out.println("<div class='alert alert-success' role='alert'>"+inscription_msg+"</div>");
		 %>
	<div class="position-absolute top-50 start-50 translate-middle">
		<h1 class="display-4">Connectez-vous !</h1>
		<form action="ConnexionServlet" method="POST">
			<div class="mb-3">
				<label for="inputEmail" class="form-label">Adresse email</label> <input
					type="email" class="form-control" id="inputEmail" name="inputEmail">
			</div>
			<div class="mb-3">
				<label for="inputMdp" class="form-label">Mot de passe</label> <input
					type="password" class="form-control" id="inputMdp" name="inputMdp">
			</div>
			<%
		String login_msg=(String)request.getAttribute("error");  
		if(login_msg!=null)
		out.println("<font color=red size=3px>"+login_msg+"</font>");
		 %>
			<div></div>
			<button type="submit" class="btn btn-secondary">Connexion</button>
			<a class="btn btn-success" href="inscription.jsp" role="button">Inscription</a>
		</form>
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>