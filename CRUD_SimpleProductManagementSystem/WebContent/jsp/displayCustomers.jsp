<%
/*
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */
%>
<%@page import="pojo.Customer"%> <%-- imports Customer.java --%>
<%@page import="dao.CustomerDao"%> <%-- imports CustomerDao.java --%>
<%@page import="java.util.List"%> <%-- import java.util.List --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>List of Customers</title>
</head>

<body>
	<%
		CustomerDao customerDao = new CustomerDao();
		List<Customer> customerList = customerDao.getAllCustomer();
	%>
	<table border="1">
		<tr>
			<th>Customer ID</th>
			<th>First Name</th>
			<th>Last Name</th>
		</tr>
		
		<%
			//short hand notation for for-loop
			for(Customer customer : customerList)
			{
		%>
				<tr>
					<%--This "<%=" tag is used to assign value --%>
					<td><%= customer.getCustomerId() %></td> 
					<td><%= customer.getFirstName() %></td>
					<td><%= customer.getLastName() %></td>
				</tr>
		<%	
			}
		%>
	</table>
	
</body>

</html>