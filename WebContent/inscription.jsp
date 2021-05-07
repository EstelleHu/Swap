<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Inscription</title>
</head>
<body>


<%@include file="header.jsp" %>
       
<div class="col-md-4 offset-md-4"> 
	<h1 class="display-4">Inscrivez-vous !</h1>
	  <form action="InscriptionServlet" method="POST">
		  <div class="mb-3">
		    <label for="inputNom" class="col-form-label">Nom</label>
		    <input type="text" class="form-control" id="inputNom" name="inputNom" required>
		  </div>
		  <div class="mb-3">
		    <label for="inputPrenom" class="col-form-label">Prénom</label>
		    <input type="text" class="form-control" id="inputPrenom" name="inputPrenom" required>
		  </div>
		  <div class="mb-3">
		    <label for="inputDateNaissance" class="col-form-label">Date de naissance</label>
		    <input type="date" class="form-control" id="inputDateNaissance" name="inputDateNaissance" required>
		  </div>
		  <div class="mb-3">
		    <label for="inputEmail" class="col-form-label">Email</label>
		    <input type="email" class="form-control" id="inputEmail" name="inputEmail" required>
		  </div>
		  <%
		String email_msg=(String)request.getAttribute("errorDoublon");  
		if(email_msg!=null)
		out.println("<font color=red size=3px>"+email_msg+"</font>");
		 %>
		  <div class="mb-3">
		    <label for="inputMdp" class="form-label">Mot de passe</label>
		    <input type="password" class="form-control" id="inputMdp" name="inputMdp" required>
		  </div>
		  <div class="mb-3">
		    <label for="inputAdresse" class="col-form-label">Adresse</label>
		    <input type="text" class="form-control" id="inputAdresse" name="inputAdresse" required>
		  </div>
		  <div class="mb-3">
		    <label for="inputCodePostal" class="col-form-label">Code Postal</label>
		    <input type="text" class="form-control" id="inputCodePostal" name="inputCodePostal" maxlength="5"required >
		  </div>
		  <div class="mb-3">
		    <label for="inputVille" class="col-form-label">Ville</label>
		    <input type="text" class="form-control" id="inputVille" name="inputVille" required>
		  </div>
		  <div class="mb-3">
		    <label for="inputTelephone" class="col-form-label">Téléphone</label>
		    <input type="tel" class="form-control" id="inputTelephone" name="inputTelephone">
		  </div>
		  <button type="submit" class="btn btn-success">S'inscrire</button>
		</form>
</div>

</body>
</html>