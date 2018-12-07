/**
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */

package dao;

import pojo.Product;
import connection.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/*
 *  Database Access Object (DAO) is a class that contains all DB transactions 
 *  related to the object
 */

public class ProductDao 
{
	private List<Product> productList;
	
	private Product product;
	private DbConnection dbConn;
	
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	/* 	VIEW PRODUCT
	 * 	Method to get all products in the database
	 */
	public List<Product> getAllProducts()
	{
		productList = new ArrayList<Product>();
		
		try 
		{	
			//Create connection
			dbConn = new DbConnection();
			conn = dbConn.getConnection();
			
			//Create statement
			stmt = conn.createStatement();
			
			//Execute query is used to retrieve data
			rs = stmt.executeQuery("SELECT * FROM pbldemo.product");
			
			//Store resultSet entries in Product object
			while(rs.next())
			{
				//create a new product object for each entry
				product = new Product(rs.getInt("product_id"), rs.getString("product_name"), rs.getString("product_category"), rs.getInt("product_price")); 
				
				//add each entry in the array list
				productList.add(product);
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
		
		return productList;
	}
	
	/*	ADD PRODUCT
	 *  Method to add products in the database.
	 *  Prepared Statement is used because it it not efficient to compile queries (Statement) 
	 *  in the DB each time you need to add an entry. 
	 *  It will take too much processing power especially if you are adding multiple entries.
	 */
	public int addProduct(Product product)
	{
		int status = 0; //DB will return an integer if INSERT statement is successful
		
		try
		{
			//Create connection
			dbConn = new DbConnection();
			conn = dbConn.getConnection();
			
			//Create statement
			pstmt = conn.prepareStatement("INSERT INTO product VALUES (?,?,?,?)");
			
			//Assign the values in prepared statement
			//Constructor is not used in this case because you need to set the values individually
			pstmt.setInt(1, product.getProductId());
			pstmt.setString(2, product.getProductName());
			pstmt.setString(3, product.getProductCategory());
			pstmt.setInt(4, product.getProductPrice());
			
			//Execute prepared query
			status = pstmt.executeUpdate();
			
			
		}
		catch(Exception e)
		{
			//Generic Exception just in case INSERT in DB failed
			e.printStackTrace();
		}
		
		return status;
	}
	
	/*
	 *  EDIT PRODUCT
	 *  Methods used to update an entry in the DB (getProductById and updateProduct)
	 *  
	 *  Prepared Statement is used because it it not efficient to compile queries (Statement) 
	 *  in the DB each time you need to add an entry.
	 *  
	 *  productId will come from View Product JSP
	 */
	public Product getProductById(int productId)
	{
		Product product = null; //Product retrieved from the DB
		
		try
		{
			//Create connection
			dbConn = new DbConnection();
			conn = dbConn.getConnection();
			
			//Create statement
			pstmt = conn.prepareStatement("SELECT * FROM product WHERE product_id=?");
			
			//Assign the values in prepared statement
			//Constructor is not used in this case because you need to set the values individually
			pstmt.setInt(1, productId);
			
			//Execute prepared query
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				//Parameterized Constructor is used because we need to catch all product details
				product =  new Product(rs.getInt("product_id"), rs.getString("product_name"), rs.getString("product_category"), rs.getInt("product_price"));
			}
		}
		catch(Exception e)
		{
			//Generic Exception just in case INSERT in DB failed
			e.printStackTrace();
		}
		
		return product;
	}
	
	public int updateProduct(Product product)
	{
		int status = 0; //DB will return an integer if UPDATE statement is successful
		
		try
		{
			//Create connection
			dbConn = new DbConnection();
			conn = dbConn.getConnection();
			
			//Create statement
			pstmt = conn.prepareStatement("UPDATE product SET product_name=?, product_category=?, product_price=? WHERE product_id= ?");
			
			//Assign the values in prepared statement
			//Constructor is not used in this case because you need to set the values individually
			pstmt.setString(1, product.getProductName());
			pstmt.setString(2, product.getProductCategory());
			pstmt.setInt(3, product.getProductPrice());
			
			//The last parameter is the product id
			pstmt.setInt(4, product.getProductId()); 
			
			//Execute prepared query
			status = pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			//Generic Exception just in case UPDATE in DB failed
			e.printStackTrace();
		}
		
		return status;
	}
	
	/*
	 *   DELETE PRODUCT
	 *   Method to delete an entry in the database
	 */
	public int deleteProduct(int productId)
	{
		int status = 0; //DB will return an integer if UPDATE statement is successful
		
		try
		{
			//Create connection
			dbConn = new DbConnection();
			conn = dbConn.getConnection();
			
			//Create statement
			pstmt = conn.prepareStatement("DELETE FROM product WHERE product_id= ?");
			
			//Assign the values in prepared statement
			//Constructor is not used in this case because you need to set the values individually
			pstmt.setInt(1, productId);
			
			//Execute prepared query
			status = pstmt.executeUpdate();
			
		}
		catch(Exception e)
		{
			//Generic Exception just in case UPDATE in DB failed
			e.printStackTrace();
		}
		
		return status;
	}
}
