package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.model.Admin;

import com.util.CheckTablesUtil;
import com.util.DBconnectionUtil;

/**
 * Class implementation Admin Services class
 * @author IT19362854 - S.L Abeygunawardana
 */

public class AdminServiceImpl 
{
	private static Connection conn;
	private static PreparedStatement prStatement;

//Admin login
//check username and password
	public static boolean ValidateAdminLogin(String username,String password) 
	{
	    //check table available in database or create a new one
		boolean res,result = false;
		
			//check admin table is available in database
			res = CheckTablesUtil.checkTableAvailability("admin");

			if(res == false)
			{
			//if table doesn't exist.(create new table and insert default login data to the table)
			CheckTablesUtil.CreateAdminTableWithValues();
			}
		
		try 
		{
		//connect to database
		conn = DBconnectionUtil.getDBConnection();

		//SQL Query
		String sql = "Select Username,Password from admin where Username=? AND  Password=?";
		
		//create object for send SQL statements
		prStatement = conn.prepareStatement(sql);
		
		//set username=? and password=? in SQL Query
		prStatement.setString(1, username);
		prStatement.setString(2, password);
		

		//get result of executed SQL statement to table rSet
		ResultSet rSet = prStatement.executeQuery();

		//check result 
		result = rSet.next();

		} 
		
		catch (SQLException  | ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		
		finally 
		{
		//close connection
			try 
			{
				if (prStatement != null)
				{
					prStatement.close();
				}
				
				if (conn != null) 
				{
					conn.close();
				}
			} 
			
			catch (SQLException ex)
			{
				ex.printStackTrace();
			}
			
		}
	

		return result;
	
	}

//get relevent admin details
	public static ArrayList<Admin> getReleventAdmin(String Username)
	{		
		ArrayList<Admin> list = new ArrayList<Admin>();
		
		try 
		{
		//connect to database
		conn = DBconnectionUtil.getDBConnection();

		//SQL Query
		String sql = "Select * from admin where Username=? ";
		
		//create object for send SQL statements
		prStatement = conn.prepareStatement(sql);
		
		//set username=?  in SQL Query
		prStatement.setString(1, Username);
		
		//get result of executed SQL statement to table rSet
		ResultSet rs = prStatement.executeQuery();

		//check result 
			while(rs.next())
			{
			Admin a = new Admin();
			a.setUsername(rs.getString(1));
			a.setPassword(rs.getString(2));
			a.setPost(rs.getString(3));
			a.setName(rs.getString(4));
			a.setEmail(rs.getString(5));
			a.setPhone(rs.getString(6));
			list.add(a);
			}

		} 
		
		catch (SQLException  | ClassNotFoundException e) 
		{
			e.printStackTrace();
		} 
		
		finally 
		{
		//close connection
			try 
			{
				if (prStatement != null)
				{
					prStatement.close();
				}
				
				if (conn != null) 
				{
					conn.close();
				}
			} 
			
			catch (SQLException ex)
			{
				ex.printStackTrace();
			}
			
		}
		
		return list;
		
	}
	
	//Change admin password
		public static boolean changePassword(String Username,String Password) 
		{
			//declaring variables
			boolean result = false;

			try 
			{
				//connect to the database
				Connection conn = DBconnectionUtil.getDBConnection();
				
				//sql query
				String sql = "Update admin Set password=? Where Username=?";
				
				//create assign values
				prStatement = conn.prepareStatement(sql);
				prStatement.setString(1, Password);
				prStatement.setString(2, Username);
				
				//execute query and get result
				int no =prStatement.executeUpdate();
				
				//check result
				if(no > 0)
				{
					result = true;
				}
			
			} 
			catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			} 
			
			finally
			{
			//close connection
				try 
				{
					if(conn != null)
					{
						conn.close();
					}
					if(prStatement != null)
					{
						prStatement.close();
					}
					
				}	
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			
			}
			return result;
		}
		
		//add new admin
		public static boolean addNewSubAdmin(Admin a)
		{
			//declaring variables
			boolean result = false;

			try 
			{
				//connect to the database
				Connection conn = DBconnectionUtil.getDBConnection();
				
				//sql query
				String sql = "Insert into admin values(?,?,?,?,?,?)";
				
				//create assign values
				prStatement = conn.prepareStatement(sql);
				prStatement.setString(1, a.getUsername());
				prStatement.setString(2, a.getPassword());
				prStatement.setString(3, a.getPost());
				prStatement.setString(4, a.getName());
				prStatement.setString(5, a.getEmail());
				prStatement.setString(6, a.getPhone());
				
				//execute query and get result
				int no =prStatement.executeUpdate();
				
				//check result
				if(no > 0)
				{
					result = true;
				}
			
			} 
			catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			} 
			
			finally
			{
			//close connection
				try 
				{
					if(conn != null)
					{
						conn.close();
					}
					if(prStatement != null)
					{
						prStatement.close();
					}
					
				}	
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			
			}
			return result;
		}
		
		//delete admin
		public static boolean deleteSubAdmin(String username)
		{
			//declaring variables
			boolean result = false;

			try 
			{
				//connect to the database
				Connection conn = DBconnectionUtil.getDBConnection();
				
				//sql query
				String sql = "Delete from admin where Username=?";
				
				//create assign values
				prStatement = conn.prepareStatement(sql);
				prStatement.setString(1, username);

				//execute query and get result
				int no = prStatement.executeUpdate();
				
				//check result
				if(no > 0)
				{
					result = true;
				}
			
			} 
			catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			} 
			
			finally
			{
			//close connection
				try 
				{
					if(conn != null)
					{
						conn.close();
					}
					if(prStatement != null)
					{
						prStatement.close();
					}
					
				}	
				catch (SQLException e)
				{
					e.printStackTrace();
				}
			
			}
			
			return result;
		}
	
		//get all admin details
		public static ArrayList<Admin> getAllSubAdmin()
		{		
			ArrayList<Admin> list = new ArrayList<Admin>();
			
			try 
			{
			//connect to database
			conn = DBconnectionUtil.getDBConnection();

			//SQL Query
			String sql1 = "Select * from admin";
			
			//get result of executed SQL statement to table rSet
			prStatement = conn.prepareStatement(sql1);
			ResultSet ra = prStatement.executeQuery();

			//check result 
				while(ra.next())
				{
				Admin a = new Admin();
				a.setUsername(ra.getString(1));
				a.setPassword(ra.getString(2));
				a.setPost(ra.getString(3));
				a.setName(ra.getString(4));
				a.setEmail(ra.getString(5));
				a.setPhone(ra.getString(6));
				list.add(a);
				}

			} 
			
			catch (SQLException  | ClassNotFoundException e) 
			{
				e.printStackTrace();
			} 
			
			finally 
			{
			//close connection
				try 
				{
					if (prStatement != null)
					{
						prStatement.close();
					}
					
					if (conn != null) 
					{
						conn.close();
					}
				} 
				
				catch (SQLException ex)
				{
					ex.printStackTrace();
				}
				
			}
			
			return list;
			
		}
		
		//add update sub
				public static boolean UpdateSubAdmin(Admin a)
				{
					//declaring variables
					boolean result = false;

					try 
					{
						//connect to the database
						Connection conn = DBconnectionUtil.getDBConnection();
						
						//sql query
						String sql = "Update admin set Password=?,Post=?,Name=?,Email=?,Phone=? where Username=?";
						
						//create assign values
						prStatement = conn.prepareStatement(sql);
	
						prStatement.setString(1, a.getPassword());
						prStatement.setString(2, a.getPost());
						prStatement.setString(3, a.getName());
						prStatement.setString(4, a.getEmail());
						prStatement.setString(5, a.getPhone());
						prStatement.setString(6, a.getUsername());
						
						//execute query and get result
						int no =prStatement.executeUpdate();
						
						//check result
						if(no > 0)
						{
							result = true;
						}
					
					} 
					catch (ClassNotFoundException | SQLException e) 
					{
						e.printStackTrace();
					} 
					
					finally
					{
					//close connection
						try 
						{
							if(conn != null)
							{
								conn.close();
							}
							if(prStatement != null)
							{
								prStatement.close();
							}
							
						}	
						catch (SQLException e)
						{
							e.printStackTrace();
						}
					
					}
					return result;
				}
}
