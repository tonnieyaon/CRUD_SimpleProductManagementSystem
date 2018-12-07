/**
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */

package pojo;

/*
 *  POJO - Plain Old Java Object Typical Format
 */

public class LoginInfo 
{
	private String userName;
	private String password;
	
	//Default Constructor
	public LoginInfo()
	{
		
	}
	
	//Parameterized Constructor
	public LoginInfo(String userName, String password)
	{
		this.userName = userName;
		this.password = password;
	}
	
	//Getters and Setters
	
	public String getUserName() 
	{
		return userName;
	}
	public void setUserName(String userName) 
	{
		this.userName = userName;
	}
	public String getPassword() 
	{
		return password;
	}
	public void setPassword(String password) 
	{
		this.password = password;
	}
	
	@Override
	public String toString()
	{
		return "LoginInfo [ user_name= " +  userName + ", password= " + password  + " ]";
	}

}
