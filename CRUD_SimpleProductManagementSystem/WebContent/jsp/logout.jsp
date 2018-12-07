<%
/*
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */
%>
<%
	session.invalidate();
	response.sendRedirect("login.jsp");
%>