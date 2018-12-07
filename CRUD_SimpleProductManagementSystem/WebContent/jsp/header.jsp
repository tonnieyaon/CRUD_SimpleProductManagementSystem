<%
/*
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<%--Check if the user is still active --%>
	<%
	if(session.getAttribute("userName") == null)
	{
		response.sendRedirect("login.jsp"); 
	}
	%>
	<%-- These are menu bars --%>
	<nav class="navbar">
		<ul class="navbar-nav">
			<li><a href="home.jsp">Home</a></li>
			<li><a href="addProduct.jsp">Add Product</a></li>
			<li><a href="viewProducts.jsp">View Products</a></li>
			<li><a href="searchProduct.jsp">Search Product</a></li>
			<li style="float:right;margin-right:10px"><a href="logout.jsp">Logout</a></li>
		</ul>
	</nav>
</body>
</html>