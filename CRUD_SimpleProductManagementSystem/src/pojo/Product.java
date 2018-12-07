/**
 *  @author Tonnie V. Ya-on
 *  @description: Serves as a template for JSP projects
 */

package pojo;

/*
 *  POJO - Plain Old Java Object Typical Format
 */

public class Product 
{
	private int productId;
	private String productName;
	private String productCategory;
	private int productPrice;
	
	//Default Constructor
	public Product()
	{
		
	}
	//Parameterized Constructor
	public Product(int productId, String productName, String productCategory, int productPrice)
	{
		this.productId = productId;
		this.productName = productName;
		this.productCategory = productCategory;
		this.productPrice = productPrice;
	}
	
	//Getters and Setters
	
	public int getProductId() 
	{
		return productId;
	}

	public void setProductId(int productId) 
	{
		this.productId = productId;
	}


	public String getProductName() 
	{
		return productName;
	}

	public void setProductName(String productName) 
	{
		this.productName = productName;
	}

	public String getProductCategory() 
	{
		return productCategory;
	}

	public void setProductCategory(String productCategory) 
	{
		this.productCategory = productCategory;
	}

	public int getProductPrice() 
	{
		return productPrice;
	}


	public void setProductPrice(int productPrice) 
	{
		this.productPrice = productPrice;
	}

	@Override
	public String toString()
	{
		return "Product [ productId= " +  productId + ", productName= " 
				+ productName  + ", productCategory= " + productCategory + ", productPrice= " + productPrice +  " ]";
	}

}
