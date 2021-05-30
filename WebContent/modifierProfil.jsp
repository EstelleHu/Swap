
<html>
<head>
<title>Modifier le profil</title>
</head>
<body>
<%@include file="header.jsp"%>
	<%
		if ((boolean) session.getAttribute("isConnected")) {
	%>
	<%	String mod_msg=(String)request.getAttribute("modificationReussie");  
		if(mod_msg!=null)
		out.println("<div class='alert alert-success' role='alert'>"+mod_msg+"</div>");
		 %>
	<div class="col-md-4 offset-md-4">
		<h1 class="display-4">Modifiez votre profil !</h1>
		<form action="ModifierProfilServlet" method="POST" enctype="multipart/form-data">
			<div class="mb-3">
				<label for="inputNom" class="col-form-label">Le nom que les autres utilisateurs verront</label> <input
					type="text" class="form-control" id="inputNom" name="inputNom"
					>
			</div>
			<div class="mb-3">
				<label for="inputPrenom" class="col-form-label">Le prénom que les autres utilisateurs verront</label> <input
					type="text" class="form-control" id="inputPrenom" name="inputPrenom"
					>
			</div>
			<div class="mb-3">

				<label for="inputDateNaissance" class="col-form-label">Date
					de naissance</label> <input type="date" class="form-control"
					id="inputDateNaissance" name="inputDateNaissance">
			</div>
			<div class="mb-3">
				<label for="inputMdp" class="form-label">Mot de passe</label> <input
					type="password" class="form-control" id="inputMdp" name="inputMdp"
					>
			</div>
			<div class="mb-3">
				<label for="inputAdresse" class="col-form-label">Adresse</label> <input
					type="text" class="form-control" id="inputAdresse"
					name="inputAdresse">
			</div>
			<div class="mb-3">
				<label for="inputCodePostal" class="col-form-label">Code
					Postal</label> <input type="text" class="form-control" id="inputCodePostal"
					name="inputCodePostal" maxlength="5" >
			</div>
			<div class="mb-3">
				<label for="inputVille" class="col-form-label">Ville</label> <input
					type="text" class="form-control" id="inputVille" name="inputVille"
					>
			</div>
			<div class="mb-3">
				<label for="inputTelephone" class="col-form-label">Téléphone</label>
				<input type="tel" class="form-control" id="inputTelephone"
					name="inputTelephone">
			</div>
			<div class="mb-3">
				<label for="formFile" class="form-label">Une jolie photo de
					vous </label> <input class="form-control" type="file" id="formFile"
					name="formFile" accept="image/*" required >
			</div>


			<button type="submit" class="btn btn-success">Modifier le profil</button>
	</form>
	</div>
	<%
		}
	%>
	<%@include file="footer.jsp"%>

</body>
</html>