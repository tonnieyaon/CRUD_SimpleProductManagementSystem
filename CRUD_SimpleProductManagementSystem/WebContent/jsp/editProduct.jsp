<%
/*
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="pojo.Product" %>
<%@ page import="dao.ProductDao" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Edit Product</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
	<%@ include file = "header.jsp" %> <%-- You have to put this line to keep track user session --%>
	
	<%
		//prodId was passed from viewProducts.jsp through Edit button
		//Parsing is needed because value is passed as String by default
		int productId = Integer.parseInt(request.getParameter("prodId"));
		
		//Instantiate ProductDao
		ProductDao productDao = new ProductDao();
	
		//Create a Product object using DB result
		Product product = productDao.getProductById(productId);
	%>
	
	<!-- Populate the form using existing values from DB -->
	
	<!-- You use POST in form when you need to submit or validate inputs -->
	<div align="center">
		<form action="processEditProduct.jsp" method="post">
			<table class="productTable">
				<thead>
					<tr>
						<th colspan="2">Product Details</th>
					</tr>
				</thead>
				
				<!-- We make Product ID as readonly because users should not be allowed to modify Primary Key -->
				<tr>
					<td>Product ID</td>
					<td><input type="text" name="prodId" size="20" value="<%= productId %>" class="productTextField" readonly></input></td>
				</tr>
				
				<tr>
					<td>Product Name</td>
					<td><input type="text" name="prodName" size="20" value="<%= product.getProductName() %>" class="productTextField"></input></td>
				</tr>
				
				<tr>
					<td>Product Category</td>
					<td><input  type="text" name="prodCategory" size="20" value="<%= product.getProductCategory() %>" class="productTextField"></input></td>
				</tr>
				
				<tr>
					<td>Product Price</td>
					<td><input  type="text" name="prodPrice" size="20" value="<%= product.getProductPrice() %>" class="productTextField"></input></td>
				</tr>
				
			</table>
			
			<!-- Add Button -->
			<button class="actionBtn" style="margin-top:10px">Save</button>
					
		</form>
	</div>
	
</body>
</html>