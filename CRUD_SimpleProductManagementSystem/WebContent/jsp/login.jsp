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
	<title>Login Information</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	
	<!-- You use POST in form when you need to submit or validate inputs -->
	<div align="center">
		<!-- Action is processed in another JSP file  -->
		<form action="processLogin.jsp" method="post">
			
			<%--class is used for formatting. CSS needs the class as reference --%>
			<table class="loginForm">
				<tr>
					<!-- Ensure variable name matches the processLogin.jsp -->
					<td><label for="userName">User Name</label></td>
					<td><input type="text" id="userName" name="userName" class="searchTextField"></input></td>
				</tr>
				<tr>
					<!-- Ensure variable name matches the processLogin.jsp -->
					<td><label for="password">Password</label></td>
					<td><input type="password" id="password" name="password" class="searchTextField"></input></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="Login" class="actionBtn"></input>
					</td>
				</tr>
			</table>
			
		</form>
	</div>
	
</body>
</html>