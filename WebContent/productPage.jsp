<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="controller.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Page</title>
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
	<h1><%=toDisplay.getNom()%></h1>

</body>
</html>