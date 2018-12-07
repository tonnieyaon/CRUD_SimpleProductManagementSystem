/**
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */

package dao;

import java.util.ArrayList;
import java.util.List;

import pojo.Customer;
import connection.DbConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CustomerDao 
{
	private List<Customer> customerList;
	
	private Customer customer;
	private DbConnection dbConn;
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	//Method to get all customers in the database
	public List<Customer> getAllCustomer()
	{
		customerList = new ArrayList<Customer>();
		
		try 
		{	
			//Create connection
			dbConn = new DbConnection();
			conn = dbConn.getConnection();
			
			//Create statement
			stmt = conn.createStatement();
			
			//Execute query is used to retrieve data
			rs = stmt.executeQuery("SELECT customer_id, first_name, last_name, email FROM sakila.customer");
			
			//Store resultSet entries in Customer object
			while(rs.next())
			{
				//create a new customer object for each entry
				customer = new Customer(rs.getInt("customer_id"), rs.getString("first_name"), rs.getString("last_name")); 
				
				//add each entry in the array list
				customerList.add(customer);
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
		
		return customerList;
	}
}
