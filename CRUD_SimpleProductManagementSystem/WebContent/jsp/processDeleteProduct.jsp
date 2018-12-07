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
	
	//No need to instantiate Product since were only need the ID to delete
	
	//Instantiate ProductDao
	ProductDao productDao = new ProductDao();
		
	//Inserting new entry in DB. It will return an integer status
	int status = productDao.deleteProduct(productId);
	
	//Validate the return. 1 - Success ; Other value - Failed
	if(status == 1)
	{
		response.sendRedirect("viewProducts.jsp");
	}
	else
	{
		response.sendRedirect("deleteError.jsp");
	}
%>

