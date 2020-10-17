package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.Item;
import com.util.CheckTablesUtil;
import com.util.CommonUtil;
import com.util.DBconnectionUtil;

/**
 * Class implementation for item services
 * @author IT19362854 - S.L Abeygunawardana
 */

public class ItemServiceImpl implements InterfaceItemService
{

	private static PreparedStatement preSt;
	private static Connection conn;

//ADD new Item
	@Override
	public boolean addItem(Item item)
	{
		//declaring variables
		boolean chekAdd = false;
		boolean chkT;
		
		//check table available in database
		chkT = CheckTablesUtil.checkTableAvailability("item");
		
		//if table not available in the database create a new table	
		if(chkT == false)
		{
			CheckTablesUtil.CreateItemTable();
		}
		
		//get auto generated employee id
	    String itemId = CommonUtil.generateItemId(getitemIDs());

		try
		{
		//set auto generated item id
			item.setItemId(itemId);
			
		//check database connection
			conn = DBconnectionUtil.getDBConnection();
			conn.setAutoCommit(false);
			
		//Initialize item details(values)  to  insert
			String sql = "Insert into item(ItemID, ItemName, ItemPrice, Quantity, Supplier, Description) values(?, ?, ?, ?, ?, ?)";
			preSt = conn.prepareStatement(sql);
	
			preSt.setString(1, item.getItemId());
			preSt.setString(2, item.getItemName());
			preSt.setString(3, String.valueOf(item.getItemPrice() ) );
			preSt.setString(4, String.valueOf(item.getItemQuantity() ) );
			preSt.setString(5, item.getSupplier() );	
			preSt.setString(6, item.getDescription() );	
		
		//Add item details to database
			int res = preSt.executeUpdate();
			conn.commit();
			
		//check data inserted to item table
			if(res > 0)
			{
				chekAdd = true;
			}
			
		} 
	
		catch (ClassNotFoundException | SQLException | NumberFormatException e1) 
		{
			//print error
			e1.printStackTrace();
		}
		finally
		{
			//close the database connection after entering the Item details
			try
			{
				if(preSt != null)
				{
					preSt.close();
				}
			
				if(conn != null)
				{
					conn.close();
				}
			}
		
			catch(SQLException ex)
			{
				ex.printStackTrace();	
			}
		}
		
		return chekAdd;
	}
	
//get All item id s to auto generate id for new item
	private ArrayList<String> getitemIDs()
	{
		ArrayList IDlist = new ArrayList();
		try
		{
		//check database connection 
		conn = DBconnectionUtil.getDBConnection();
	
		//get all item ID s from database
		String Allsql = "select * From item";
		preSt = conn.prepareStatement(Allsql);
		
	
		ResultSet result = preSt.executeQuery();
	
		//get item details
		while(result.next())
		{
			IDlist.add(result.getString(1));
		}
			
		} 
		catch (SQLException | ClassNotFoundException | NumberFormatException e) 
		{
			e.printStackTrace();
		}
	
		finally
		{
			//close the database connection after entering the Item details
			try
			{
				if(preSt != null)
				{
					preSt.close();
				}
			
				if(conn != null)
				{
					conn.close();
				}
			}
			catch(SQLException ex)
			{
				ex.printStackTrace();	
			}
		}
	
		//return ID array list
		return IDlist;
	}

//get all item details to display
	@Override
	public ArrayList<Item> getItems(String ItemID)
	{	
		//declaring variables || objects
		ArrayList Itemlist = new ArrayList();
		boolean chkT;
		
		//check table available in database
		chkT = CheckTablesUtil.checkTableAvailability("item");
		
		//if table not available in the database create a new table	
		if(chkT == false)
		{
			CheckTablesUtil.CreateItemTable();
		}
		
		try
		{
			//check database connection 
			conn = DBconnectionUtil.getDBConnection();
	
			//check ItemID is NUll
			if(ItemID == null || ItemID.isEmpty())
			{
				//get all item details from database
				String Allsql = "select * From item";
				preSt = conn.prepareStatement(Allsql);
			}
			else
			{
				//get relevant item details from the database
				String IdSql = "Select * From item Where ItemID =?";
				
				preSt = conn.prepareStatement(IdSql);
				preSt.setString(1, ItemID);
			}
	
			ResultSet result = preSt.executeQuery();
	
			//get item details
			while(result.next())
			{
				Item item = new Item();
				item.setItemId(result.getString(1));
				item.setItemName(result.getString(2));
				item.setItemPrice(Float.parseFloat(result.getString(3) ) );
				item.setItemQuantity(Integer.parseInt(result.getString(4) ) );
				item.setSupplier(result.getString(5));
				item.setDescription(result.getString(6));
				Itemlist.add(item);
			}
		
		
		} 
		catch (SQLException | ClassNotFoundException | NumberFormatException e) 
		{
			e.printStackTrace();
		}
	
		finally
		{
			//close the database connection after entering the Item details
			try
			{
				if(preSt != null)
				{
					preSt.close();
				}
			
				if(conn != null)
				{
					conn.close();
				}
			}
			catch(SQLException ex)
			{
				ex.printStackTrace();	
			}
		}
	
		//return array list
		return Itemlist;
	}

//update item details
	@Override
	public boolean UpdateItem(Item item) 
	{
		boolean result = false;
		
		try
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
		
		//Initialize item details(values)  to  insert
		String sql = "Update item Set ItemName = ?, ItemPrice = ?, Quantity = ?, Supplier= ?, Description = ? Where ItemID = ?";
		
		preSt = conn.prepareStatement(sql);
		
		preSt.setString(1, item.getItemName());
		preSt.setString(2, String.valueOf(item.getItemPrice() ) );
		preSt.setString(3, String.valueOf(item.getItemQuantity() ) );
		preSt.setString(4, item.getSupplier() );	
		preSt.setString(5, item.getDescription() );	
		preSt.setString(6, item.getItemId());
		
		//Update item details in database
		int returned = preSt.executeUpdate();
		
		//check returned value
		if(returned > 0)
		{
		result = true;	
		}
		
		} 
		
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
		//print error
		e.printStackTrace();
		}
		finally
		{
		//close the database connection after updating the Item details
			try
			{
				if(preSt != null)
				{
				preSt.close();
				}
				
				if(conn != null)
				{
				conn.close();
				}
			}
			
			catch(SQLException ex)
			{
				ex.printStackTrace();	
			}
		}
		
		return result;

	}

//delete item details
	@Override
	public boolean DeleteItem(String ItemID)
	{
		
		boolean result = false;
	
		try
		{
			//check database connection
			conn = DBconnectionUtil.getDBConnection();
	
			//Initialize item details(values)  to  insert
			String sql = "Delete From item  Where ItemID = ?";
	
			preSt = conn.prepareStatement(sql);
			preSt.setString(1, ItemID);
	
			//Delete item details in database
			int returned = preSt.executeUpdate();
	
			//check returned value
			if(returned > 0)
			{
				result = true;	
			}
			
		} 
	
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			//print error
			e.printStackTrace();
		}
		finally
		{
			//close the database connection after updating the Item details
			try
			{
				if(preSt != null)
				{
					preSt.close();
				}
			
				if(conn != null)
				{
					conn.close();
				}
			}
		
			catch(SQLException ex)
			{
				ex.printStackTrace();	
			}
		}
	
	return result;
	}


}
