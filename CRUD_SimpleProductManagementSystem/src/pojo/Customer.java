/**
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */

package pojo;

/*
 *  POJO - Plain Old Java Object Typical Format
 */

public class Customer 
{
	private int customerId;
	private String firstName;
	private String lastName;
	
	//Default Constructor
	public Customer()
	{
		
	}
	
	//Parameterized Constructor
	public Customer(int customerId, String firstName, String lastName)
	{
		this.customerId = customerId;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	//Getters and Setters
	public int getCustomerId() 
	{
		return customerId;
	}

	public void setCustomerId(int customerId) 
	{
		this.customerId = customerId;
	}

	public String getFirstName() 
	{
		return firstName;
	}

	public void setFirstName(String firstName) 
	{
		this.firstName = firstName;
	}

	public String getLastName() 
	{
		return lastName;
	}

	public void setLastName(String lastName) 
	{
		this.lastName = lastName;
	}
	
	@Override
	public String toString()
	{
		return "Customer [ customer_id= " +  customerId + ", first_name= " + firstName + ", last_name= " + lastName + " ]";
	}
}
