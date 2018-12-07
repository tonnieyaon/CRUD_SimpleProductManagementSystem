<%
/*
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */
%>
<%@ page import="pojo.Product" %>
<%@ page import="dao.ProductDao" %>

<%
	//We have to do parsing since text field is written as String
	int productId = Integer.parseInt(request.getParameter("prodId")); 
	
	String productName = request.getParameter("prodName");
	String productCategory = request.getParameter("prodCategory");
	
	//We have to do parsing since text field is written as String
	int productPrice = Integer.parseInt(request.getParameter("prodPrice"));
	
	//Parameterized Constructor is used since we are creating a new entry
	Product product = new Product(productId, productName, productCategory, productPrice);
	
	//Instantiate ProductDao
	ProductDao productDao = new ProductDao();
	
	//Inserting new entry in DB. It will return an integer status
	int status = productDao.addProduct(product);
	
	//Validate the return. 1 - Success ; Other value - Failed
	if(status == 1)
	{
		response.sendRedirect("viewProducts.jsp");
	}
	else
	{
		response.sendRedirect("addError.jsp");
	}
%>