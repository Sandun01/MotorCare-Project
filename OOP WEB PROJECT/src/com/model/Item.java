package com.model;

/**
 * Class implementation Item class
 * @author IT19362854 - S.L Abeygunawardana
 */
public class Item {
	
	private String itemId;
	private String ItemName;
	private float itemPrice;
	private int itemQuantity;
	
	public int getItemQuantity()
	{
		return itemQuantity;
	}

	public void setItemQuantity(int itemQuantity)
	{
		this.itemQuantity = itemQuantity;
	}

	private String Supplier;
	private String Description;
	
	
	public String getItemId()
	{
		return itemId;
	}
	
	public void setItemId(String itemId)
	{
		this.itemId = itemId;
	}
	
	public String getItemName()
	{
		return ItemName;
	}
	
	public void setItemName(String itemName)
	{
		ItemName = itemName;
	}
	
	public float getItemPrice()
	{
		return itemPrice;
	}
	
	public void setItemPrice(float itemPrice)
	{
		this.itemPrice = itemPrice;
	}
	
	public String getSupplier() {
		return Supplier;
	}
	
	public void setSupplier(String supplier)
	{
		Supplier = supplier;
	}
	
	public String getDescription() 
	{
		return Description;
	}
	
	public void setDescription(String description) 
	{
		Description = description;
	}
	

}
