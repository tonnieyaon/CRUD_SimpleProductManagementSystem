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
	<title>Add Product</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<%@ include file="header.jsp" %>  <%-- You have to put this line to keep track user session --%>
	
	<!-- You use POST in form when you need to submit or validate inputs -->
	<div align="center">
		<form action="processAddProduct.jsp" method="post">
			<table class="productTable">
				<thead>
					<tr>
						<th colspan="2">Product Details</th>
					</tr>
				</thead>
				
				<tr>
					<td>Product ID</td>
					<td><input type="text" name="prodId" size="20" class="productTextField"></input></td>
				</tr>
				
				<tr>
					<td>Product Name</td>
					<td><input type="text" name="prodName" size="20" class="productTextField"></input></td>
				</tr>
				
				<tr>
					<td>Product Category</td>
					<td><input  type="text" name="prodCategory" size="20" class="productTextField"></input></td>
				</tr>
				
				<tr>
					<td>Product Price</td>
					<td><input  type="text" name="prodPrice" size="20" class="productTextField"></input></td>
				</tr>
				
			</table>
			
			<!-- Add Button -->
			<button class="actionBtn" style="margin-top:10px">Add</button>
					
		</form>
	</div>
</body>
</html>