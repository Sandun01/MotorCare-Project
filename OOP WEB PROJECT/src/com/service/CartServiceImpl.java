package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.Cart;
import com.util.CheckTablesUtil;
import com.util.DBconnectionUtil;

/**
 * Class implementation cart service
 * @author IT19802022 W.A.L Priyasarani
 */

public class CartServiceImpl
{
	private static PreparedStatement preSt;
	private static Connection conn;

	
	//add item to cart
	public static void AddToCart(String Username, String ItmID, float TAmount)
	{
		
		try
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
		conn.setAutoCommit(false);
						
		//Initialize values
		String sql = "Insert into cart values(?,?,?,?,?)";
		preSt = conn.prepareStatement(sql);
		preSt.setString(1, Username);
		preSt.setString(2, ItmID);
		//assign initial value of quantity as 1 initially
		preSt.setInt(3, 1);
		//initially one item price = total price
		preSt.setFloat(4, TAmount);
		preSt.setFloat(5, TAmount);
					
		//Add item to cart
		preSt.executeUpdate();
		conn.commit();
						
		} 
				
		catch (ClassNotFoundException | SQLException | NumberFormatException e1) 
		{
		//print error
		e1.printStackTrace();
		}
		
		finally
		{
		//close the database connection after entering the Item to cart
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
			
	}

	//check item already exist in cart
	public static boolean CheckCart(String un, String id)
	{
		//declaring variables
		boolean res = false;
				
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
				
		//Initializing values
		String sql = "Select * From cart Where Username = '"+un+"' AND ItemId = '"+id+"' ";
					
		preSt = conn.prepareStatement(sql);
					
		ResultSet rs = preSt.executeQuery();
					
		//check username and password is available
		res = rs.next();
				
		}
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			e.printStackTrace();
		} 
				
		finally
		{
		//close the database connection after entering the user details
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
		
		return res;
		
	}
		
	//display cart details
	public static ArrayList<Cart> getItemInCart(String Username)
	{
		//initializing variables,objects
		ArrayList<Cart> list = new ArrayList();
		
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
				
		//Initializing values
		String sql = "Select * From cart Where Username = '"+Username+"' ";
		
		preSt = conn.prepareStatement(sql);
		
		ResultSet rs = preSt.executeQuery();
		
			while(rs.next())
			{
				Cart c = new Cart();
				c.setUsername(rs.getString(1));
				c.setItemId(rs.getString(2));
				c.setQuantity(rs.getInt(3));
				c.setPrice(rs.getFloat(4));
				c.setTotal(rs.getFloat(5));
				list.add(c);
			}
				
		}
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			e.printStackTrace();
		} 
				
		finally
		{
		//close the database connection after entering the user details
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
		
		
		return list;
		
	}

//delete item from cart
	public static boolean DeleteFromCart(String un, String id) {
		//variables
		boolean chk = false;
		int no;
		
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
				
		//Initializing values
		String sql = "Delete From cart Where Username = '"+un+"' AND ItemId = '"+id+"' ";
					
		preSt = conn.prepareStatement(sql);
					
		no = preSt.executeUpdate();
		
		//check sucessfully deleted
			if(no > 0)
			{
				chk = true;
			}
				
		}
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			e.printStackTrace();
		} 
				
		finally
		{
		//close the database connection after deleting the user details
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
		
		return chk;
	}

	//check quantity
	public static boolean CheckQuantity(String id,int qty) {
		//variables
		int MQty = 0;
		boolean chk = false;
		
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
				
		//Initializing values
		String sql = "Select Quantity From item Where ItemID = '"+id+"' ";
					
		preSt = conn.prepareStatement(sql);
		
		ResultSet rs = preSt.executeQuery();
		
		while(rs.next())
		{
			MQty = rs.getInt(1);
		}
		
		//check quantity
			if(MQty > qty)
			{
			chk = true;
			}
				
		}
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			e.printStackTrace();
		} 
				
		finally
		{
		//close the database connection after check the quantity
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
		
		
		return chk;
	}

	//update cart details
	public static void UpdateCartDetails(String un, String id, int qty, float tamount) 
	{			
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
				
		//Initializing values
		String sql = "Update cart set Quantity='"+qty+"', TotalAmount='"+tamount+"' Where Username='"+un+"' AND ItemId = '"+id+"'  ";
					
		preSt = conn.prepareStatement(sql);
		
		//execute query
		preSt.executeUpdate();
		
		}
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			e.printStackTrace();
		} 
				
		finally
		{
		//close the database connection after updating cart
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
		
	}

	//count number of items in cart for particular user
	public static int CountCartItems(String Username)
	{
		//variables
		int count = 0;
		
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
				
		//Initializing values
		String sql = "Select Count(*) From cart Where Username = '"+Username+"' ";
					
		preSt = conn.prepareStatement(sql);
		
		//execute query
		ResultSet rs = preSt.executeQuery();
		
		//get result
			while(rs.next() )
			{
			count = rs.getInt(1);
			}
		
		}
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			e.printStackTrace();
		} 
				
		finally
		{
		//close the database connection after counting cart items
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
		
		return count;
		
	}
	
}
