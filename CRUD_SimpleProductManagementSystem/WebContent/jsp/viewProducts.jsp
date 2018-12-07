<%
/*
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="pojo.Product"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Products</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<%@ include file="header.jsp" %> <%-- You have to put this line to keep track user session --%>
	
	<%--class is used for formatting. CSS needs the class as reference --%>
	<table align="center" class="productTable">
		<%-- Table Headers --%>
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Product Category</th>
				<th>Product Price</th>
			</tr>
		</thead>
		
		<%
			//Instantiate required objects
			Product product;
			ProductDao productDao = new ProductDao();
			
			List<Product> productList = productDao.getAllProducts();
			
			//Shorthand notation for for-loop of an object
			for(Product p : productList)
			{
				//Create a row per each entry in the DB
		%>
				<tr>
					<!-- Assign DB result on HTML column -->
					<td><%= p.getProductId() %></td>
					<td><%= p.getProductName() %></td>
					<td><%= p.getProductCategory() %></td>
					<td><%= p.getProductPrice() %></td>
					
					<!-- Edit and Delete Buttons is associated per entry -->
					<td><button class="actionBtn" onclick="location.href = 'editProduct.jsp?prodId=<%= p.getProductId()%>';">Edit</button></td>
					<td><button class="actionBtn" onclick="location.href = 'processDeleteProduct.jsp?prodId=<%= p.getProductId()%>';">Delete</button></td>
				</tr>
		<%
			}
		%>
		
	</table>
</body>
</html>