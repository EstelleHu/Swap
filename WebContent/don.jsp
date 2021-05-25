<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Don</title>
</head>
<body>
<%@include file="header.jsp"%>
   <div class="col-md-4 offset-md-4">
		<h1 class="display-4">Formulaire de don !</h1>
		<form action="AjoutObjetServlet" method="POST">
			<div class="mb-3">
				<label for="inputNom" class="col-form-label">Votre nom</label> <input
					type="text" class="form-control" id="inputNom" name="inputNom"
					required>
			</div>
			<div class="mb-3">
				<label for="inputPrenom" class="col-form-label">Votre prénom</label> <input
					type="text" class="form-control" id="inputPrenom" name="inputPrenom"
					required>
			</div>
			<div class="mb-3">
				<label for="inputSomme" class="col-form-label">La somme que vous souhaitez donner</label> <input
					type="number" class="form-control" id="inputSomme" name="inputSomme"
					required>
			</div>


			<button type="submit" class="btn btn-success">Payer avec Paypal</button>
	</form>
	</div>
</body>
</html>