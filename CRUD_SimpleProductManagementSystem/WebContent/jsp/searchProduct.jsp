<%
/*
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.ProductDao"%>
<%@page import="pojo.Product"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Search Product</title>
	<link rel="stylesheet" href="../css/style.css">
</head>
<body>
<%@ include file="header.jsp" %>  
<div align="center" style="padding-top:25px;">
	<form action="searchProduct.jsp">
		<label>Enter Product ID: </label>
		<input type="text" name="prodId" size="25" class="searchTextField"/>
		<button class="actionBtn">Search</button>
	</form>
</div> 
	<table align="center" class="productTable">
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Category</th>
				<th>Price</th>
			</tr> 
		</thead>
		<%
			ProductDao productDao = new ProductDao();
		
			String productId = request.getParameter("prodId");
			
			//Null checking is used for empty search
			if(productId != null)
			{
				Product p = productDao.getProductById(Integer.parseInt(productId));
				
				if(p != null)
				{
		%>
			<tr>
				<td><%=p.getProductId()%></td>
				<td><%=p.getProductName()%></td>
				<td><%=p.getProductCategory()%></td>
				<td><%= p.getProductPrice() %></td>
			</tr>
	    <%		}
				else
				{
					//If there is nothing retrieved in the DB, display no record
		%>
			<tr>
				<td colspan="5">No record to display</td>
			</tr>
		<% 
				}
			}
			else 
			{
					//Display no record if its an empty search
		%>
			<tr>
				<td colspan="5">No record to display</td>
			</tr>
		<% 
			}
		%>
	</table>

</body>
</html>