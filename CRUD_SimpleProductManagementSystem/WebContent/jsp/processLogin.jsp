<%
/*
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */
%>
<%@ page import="pojo.LoginInfo" %>
<%@ page import="dao.LoginInfoDao" %>

<%
	//Ensure naming convention on this file matches the login.jsp
	String userName = request.getParameter("userName");
	String password = request.getParameter("password");
	
	//Parameterized Constructor is used
	LoginInfo loginInfo = new LoginInfo(userName, password);
	//Default Constructor is used
	LoginInfoDao loginInfoDao = new LoginInfoDao();
	
	if(loginInfoDao.isUserValid(loginInfo))
	{
		//Session object is readily available in jsp. No need to declare anything.
		session.setAttribute("userName", userName); 
		//If user is inactive for 5 minutes, the session will be invalid
		session.setMaxInactiveInterval(300);
		
		response.sendRedirect("home.jsp");
	}
	else
	{
		response.sendRedirect("loginFailed.jsp");
	}
%>