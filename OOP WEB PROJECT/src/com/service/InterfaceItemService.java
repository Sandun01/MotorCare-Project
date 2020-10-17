package com.service;

import java.util.ArrayList;

import com.model.Item;

/**
 * interface implementation for item services
 * @author IT19362854 - S.L Abeygunawardana
 */

public interface InterfaceItemService {
	
//Add new Item method 
	public boolean addItem(Item item);
	
//Get all item details 
	public ArrayList<Item> getItems(String ItemID);

//Update item details
	public boolean UpdateItem(Item item);

//Delete item Details
	public boolean DeleteItem(String ItemID);
	
}
