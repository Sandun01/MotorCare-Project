package com.model;

/**
 * Class implementation cart
 * @author IT19802022 W.A.L Priyasarani
 */

public class Cart {
	
	private String Username;
	private String ItemId;
	private int quantity;
	private float price;
	private float total;
	
	
	public Cart()
	{
		super();
	}

	public Cart(String username, String itemId, int quantity, float price, float total) {
		super();
		Username = username;
		ItemId = itemId;
		this.quantity = quantity;
		this.price = price;
		this.total = total;
	}
	
	
	public float getPrice() 
	{
		return price;
	}
	public void setPrice(float price)
	{
		this.price = price;
	}
	
	public String getUsername()
	{
		return Username;
	}
	public void setUsername(String username) 
	{
		Username = username;
	}
	public String getItemId()
	{
		return ItemId;
	}
	public void setItemId(String itemId)
	{
		ItemId = itemId;
	}
	public int getQuantity()
	{
		return quantity;
	}
	public void setQuantity(int quantity)
	{
		this.quantity = quantity;
	}
	public float getTotal()
	{
		return total;
	}
	public void setTotal(float total)
	{
		this.total = total;
	}
	
	

}
