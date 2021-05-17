<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profil</title>
</head>
<body>
<%@include file="header.jsp" %>
<%if((boolean)session.getAttribute("isConnected")){%>
		<p>Bienvenue <%=session.getAttribute("idUtilisateur") %></p>
		<p><%=request.getAttribute("test")%></p>
	<%}%>
</body>
</html>