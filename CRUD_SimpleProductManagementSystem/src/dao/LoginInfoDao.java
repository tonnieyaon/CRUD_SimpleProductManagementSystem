/**
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */

package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.DbConnection;
import pojo.LoginInfo;

/*
 *  Database Access Object (DAO) is a class that contains all DB transactions 
 *  related to the object
 */

public class LoginInfoDao 
{
	private boolean isValid = false;	//only becomes True after DB checking
	
	private DbConnection dbConn;
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public boolean isUserValid(LoginInfo userDetails)
	{
		try 
		{	
			//Create connection
			dbConn = new DbConnection();
			conn = dbConn.getConnection();
			
			//Create statement
			stmt = conn.createStatement();
			
			//Execute query is used to retrieve data
			rs = stmt.executeQuery("SELECT * FROM pbldemo.login_info WHERE user_name = '" + userDetails.getUserName() + "' AND password= '" + userDetails.getPassword() + "'");
			
			//Store resultSet entries in Customer object
			while(rs.next())
			{
				//If there is an entry returned, set isValid to true
				isValid = true;
			}
			
			//close the connection
			dbConn.closeConnection(conn);
		}
		catch(SQLException e)
		{
			//used to catch error for statement
			e.printStackTrace();
		} 
		catch (Exception e) 
		{
			//Generic catch statement
			e.printStackTrace();
		}
		
		return isValid;
	}
}
