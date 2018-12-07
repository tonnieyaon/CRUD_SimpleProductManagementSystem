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
	<title>Home</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<%@ include file="header.jsp" %> <%-- You have to put this line to keep track user session --%>

	<%
	String userName = (String)session.getAttribute("userName");
	%>

	<div align="center">
		<h2>Product Management System</h2>
		<label>Welcome <%= userName %></label>
	</div>
</body>
</html>