package com.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import com.model.Purchased;
import com.util.CheckTablesUtil;
import com.util.CommonUtil;
import com.util.DBconnectionUtil;

/**
 * Class implementation of purchased item services
 * @author IT19374666 - D.A.D.Madubashini
 */

public class PurchasedServiceImpl 
{
	private static PreparedStatement preSt;
	private static Connection conn;

	//Insert values to purchased table
	
	public static void AddToPurchased(Purchased p,int pid)
	{
		//declaring variables
		boolean chkT;
		
		//check table available in database
		chkT = CheckTablesUtil.checkTableAvailability("purchased");
		
		//if table not available in the database create a new table	
		if(chkT == false)
		{
			//CheckTablesUtil.CreateItemTable();
		}
		
		//get auto generated employee id

		try
		{
		//check database connection
			conn = DBconnectionUtil.getDBConnection();
			conn.setAutoCommit(false);
			
		//Initialize item details(values)  to  insert
			String sql = "Insert into purchased values('"+p.getUsername()+"' , '"+p.getItemId()+"', '"+p.getQuantity()+"' ,"
					+ " '"+p.getPrice()+"' , '"+p.getTotal()+"' , '"+p.getDate()+"' , '"+p.getTime()+"' ,'"+pid+"' , 0)";
			
			preSt = conn.prepareStatement(sql);
	
		//Add details to database
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
			//close the database connection after entering details
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
	
	//delete item from cart
	public static void DeleteAllFromCart(String un)
	{

		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
					
		//Initializing values
		String sql = "Delete From cart Where Username = '"+un+"' ";
						
		preSt = conn.prepareStatement(sql);
						
		preSt.executeUpdate();
			
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
			
	}
			
	//get user's account balance
	public static float getUserAccountBalance(int pid)
	{
		//variables
		float bal = 0;
					
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
						
		//Initializing values
		String sql = "Select Balance From payment Where Pid = '"+pid+"' ";
						
		preSt = conn.prepareStatement(sql);
				
		//execute query
		ResultSet rs = preSt.executeQuery();
					
		//get result
			while(rs.next() )
			{
				bal = rs.getInt(1);
			}
					
		}
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			e.printStackTrace();
		} 
							
		finally
		{
		//close the database connection
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
				
		return bal;
				
	}

	//update user account balance
	public static void UpdateUserAccountBalance(int pid,float currentBal) 
	{
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
					
		//Initializing values
		String sql = "Update payment set Balance = '"+currentBal+"' where Pid = '"+pid+"'  ";
						
		preSt = conn.prepareStatement(sql);
						
		preSt.executeUpdate();
			
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
			
	}

	//update item quantity
	public static void UpdateItemQuantity(String id,int qty)
	{
		//declaring variables
		int Gqty = 0, Cqty = 0;  
		
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
					
		//Initializing values to get quantity
		String sql1 = "Select Quantity From item where ItemID = '"+id+"' ";
						
		preSt = conn.prepareStatement(sql1);
		
		ResultSet rs = preSt.executeQuery();
		
		if(rs.next() )
		{
			Gqty = rs.getInt(1);
		}
		
		//set new quantity
			if(Gqty > 0)
			{
			Cqty = Gqty - qty;
		
			String sql2 = "Update item Set Quantity = '"+Cqty+"' where ItemID = '"+id+"' ";
			
			preSt = conn.prepareStatement(sql2);
			
			preSt.executeUpdate();
			
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
		
		
	}
	
	//get purchased details
	
	public static ArrayList<Purchased> getPurchasedDetails(String Username)
	{
		//check table available in database or create a new one
		boolean res;
		
		//check table is available in database
		res = CheckTablesUtil.checkTableAvailability("purchased");

		if(res == false)
		{
			//if table doesn't exist.
			CheckTablesUtil.CreatePurchasedTable();
		}	
		
		ArrayList<Purchased> list = new ArrayList<Purchased>();
		
		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
					
		//Initializing values
		String sql = "Select * From purchased Where Username = '"+Username+"'  ";
						
		preSt = conn.prepareStatement(sql);
						
		ResultSet rs = preSt.executeQuery();
		
			while(rs.next())
			{
				Purchased p = new Purchased();
				
				p.setUsername(rs.getString(1));
				p.setItemId(rs.getString(2));
				p.setQuantity(rs.getInt(3));
				p.setPrice(rs.getFloat(4));
				p.setTotal(rs.getFloat(5));
				p.setPaymentMethodId(rs.getInt(8));
				p.setPurchasedID(rs.getInt(9));
				
				String date = rs.getString(6);
				String time = rs.getString(7);
				
				p.setDate(LocalDate.parse(date));
				p.setTime(LocalTime.parse(time));
				
				list.add(p);
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
		
		
		return list;
	}

	//delete purchased item
	public static void deletePurchasedItem(int id)
	{

		try 
		{
		//check database connection
		conn = DBconnectionUtil.getDBConnection();
					
		//Initializing values
		String sql = "Delete From purchased Where PurchasedD = '"+id+"' ";
						
		preSt = conn.prepareStatement(sql);
		
		preSt.executeUpdate();
		
		}
		catch (ClassNotFoundException | SQLException | NumberFormatException e) 
		{
			e.printStackTrace();
		} 
					
		finally
		{
		//close the database connection after deleting item
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
	
}
