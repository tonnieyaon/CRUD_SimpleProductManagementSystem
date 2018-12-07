/**
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */

package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection 
{
	private Connection conn;
	
	//Method is set to static so you don't need to instantiate
	public Connection getConnection()
	{
		try 
		{
			//Used to test connectivity in console
			System.out.println("Connecting to the database. . . ");
			
			/* Get connection contains the following information
			   JDBC is an API
			   mysql is a DB Type
			   localhost is where the DB is running
			   3306 is the port
			   pbldemo is a schema
			   root is username
			   1234 is password
			*/
			
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pbldemo","root","1234");
			
			//Used to test if connection is established in console
			System.out.println("Connection Established.");
			
			
		
		} 
		catch (ClassNotFoundException e)
		{
			//used to catch error for Class.forName
			e.printStackTrace();
		
		}
		catch(SQLException e)
		{
			//used to catch error for DriverManager
			e.printStackTrace();
		} 
		catch (InstantiationException e)
		{
			//used to catch error for com.mysql.cj.jdbc.Driver new instance
			e.printStackTrace();
		}
		catch (IllegalAccessException e)
		{
			//used to catch error for getConnection
			e.printStackTrace();
		}
		
		return conn;
	}
	
	//Method is set to static so you don't need to instantiate
	public void closeConnection(Connection conn)
	{
		try
		{
			conn.close();
		}
		catch(SQLException e)
		{
			//used to catch error for DriverManager
			e.printStackTrace();
		}
	}
	
}
