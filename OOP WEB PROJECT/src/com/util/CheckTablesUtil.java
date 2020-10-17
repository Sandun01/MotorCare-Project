package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckTablesUtil
{

//declaring variables
	public static PreparedStatement prst;
	public static Connection conn;
	public static Statement stm;	
	
//check the relevant table available in database
	public static boolean checkTableAvailability(String tableName)
	{	
		boolean chk = false;
		
		try 
		{
		//get database connection 
		conn = DBconnectionUtil.getDBConnection();
		stm = conn.createStatement();
		
		//sql query to check relevant table is available
		String sql = "SELECT * FROM information_schema.tables WHERE table_schema = 'motorcare' AND TABLE_NAME='"+tableName+"'";
		
		//create object for send SQL statements
		prst = conn.prepareStatement(sql);
		
		//execute query and get result
		ResultSet rSet = prst.executeQuery();
		
		//check result is empty
		if(rSet.next() == false)
		{
			chk = false;
		}
		//if table already exist return true
		else
		{
			chk = true;
		}
		
		}
		catch(ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}
		
		finally 
		{
		//close connection
			try 
			{
				if (prst != null)
				{
					prst.close();
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
		
		return chk;
				
	}
	

//if Admin table does't exist in the database,create new table and insert default login details
	public static void CreateAdminTableWithValues()
	{
		try
		{
		//get database connection 
		conn = DBconnectionUtil.getDBConnection();
		stm = conn.createStatement();
		
		//SQL Query to create new table
		String sql1 = "Create table admin(Username varchar(30) primary key, Password varchar(10)"
				+ " ,Post varchar(6),Name varchar(30),Email varchar(45),Phone varchar(10) )" ;
		
		//SQL Query to insert default login data to the table 
		String val = "admin";
		String sql2 = "Insert into admin(Username,Password,Post,Name) values('"+val+"' , '"+val+"' ,'main' , 'Main_Admin')";
		
		//execute queries
		stm.executeUpdate(sql1);
		stm.executeUpdate(sql2);
		
		} 
		
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		}
		
	}
	
//check the item table available in database if not availabl create a new item table
	public static void CreateItemTable()
	{
			try
			{
			//get database connection 
			Connection conn = DBconnectionUtil.getDBConnection();	
			
			stm = conn.createStatement();
			
			//sql to create new table
			String addSql = "Create table item(ItemID varchar(8) primary key, ItemName varchar(30),ItemPrice float, Quantity int, Supplier varchar(30), Description text)";
					
			//execute Query
			stm.executeUpdate(addSql);
			 
			} 
			catch (ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			} 

		}

//create user table
	public static void CreateCustomerTable() 
	{
		try
		{
		//get database connection 
		Connection conn = DBconnectionUtil.getDBConnection();	
		
		stm = conn.createStatement();
		
		//sql to create new table
		String addSql = "Create table customer(fname varchar(20), lname varchar(20), username varchar(30) primary key, gender varchar(8), email varchar(30), password varchar(10) ) ";
				
		//execute Query
		stm.executeUpdate(addSql);
		 
		} 
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		} 
		
	}


	//create cart table
	public static void CreateCartTable() 
	{
		try
		{
		//get database connection 
		Connection conn = DBconnectionUtil.getDBConnection();	
		
		stm = conn.createStatement();
		
		//sql to create new table
		String addSql = "Create table cart(Username varchar(30), ItemId varchar(8), Quantity int, ItemPrice float, TotalAmount float, Primary key(Username,ItemId))";
				
		//execute Query
		stm.executeUpdate(addSql);
		 
		} 
		catch (ClassNotFoundException | SQLException e)
		{
			e.printStackTrace();
		} 
		
		
	}
	
	//create comment table
		public static void CreateCommentTable() 
		{
			try
			{
			//get database connection 
			Connection conn = DBconnectionUtil.getDBConnection();	
			
			stm = conn.createStatement();
			
			//sql to create new table
			String addSql = "Create table comment(Username varchar(30),Email varchar(30), Comment text, ComID INT NOT NULL AUTO_INCREMENT primary key)";
					
			//execute Query
			stm.executeUpdate(addSql);
			 
			} 
			catch (ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			} 
			
			
		}
		
		//create appointment table
		public static void CreateAppointmentTable() 
		{
			try
			{
			//get database connection 
			Connection conn = DBconnectionUtil.getDBConnection();	
			
			stm = conn.createStatement();
			
			//sql to create new table
			String addSql = "Create table appointment(id INT NOT NULL AUTO_INCREMENT primary key,"
					+ " FName varchar(30), LName varchar(30), Email varchar(30), PhoneNumber varchar(15),"
					+ " PreferedDate varchar(15), PreferedLocation varchar(30), VehicleNo varchar(45) )";
					
			//execute Query
			stm.executeUpdate(addSql);
			 
			} 
			catch (ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			} 
			
		}
		
		//create service table
		public static void CreateServiceTable() 
		{
			try
			{
			//get database connection 
			Connection conn = DBconnectionUtil.getDBConnection();	
			
			stm = conn.createStatement();
			
			//sql to create new table
			String addSql = "Create table service(serviceNo varchar(10), serviceName varchar(45), serviceDescription text,  serviceAmount varchar(45)  )";
					
			//execute Query
			stm.executeUpdate(addSql);
			 
			} 
			catch (ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			} 
			
			
		}
		
		//create payment table
		public static void CreatePaymentTable() 
		{
			try
			{
			//get database connection 
			Connection conn = DBconnectionUtil.getDBConnection();	
			
			stm = conn.createStatement();
			
			//sql to create new table
			String Sql = "Create table Payment( `Pid` INT NOT NULL AUTO_INCREMENT,`Username` VARCHAR(30) NOT NULL, `Fname` VARCHAR(45) ,"
			+ " `Lname` VARCHAR(45) , `Email` VARCHAR(45) , `Phone` VARCHAR(45), `Cardno` VARCHAR(20) UNIQUE, `Year` INT ,"
			+ " `Month` VARCHAR(20) , `Cvv` VARCHAR(45) , `Country` VARCHAR(45) ,  `Address1` VARCHAR(45) , `Address2` VARCHAR(45) ,"
			+ " `City` VARCHAR(45) ,  `Balance` float , PRIMARY KEY (`Pid`) )";
					
			//execute Query
			stm.executeUpdate(Sql);
			 
			} 
			catch (ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			} 
			
			
		}
		
		//create purchased table
		public static void CreatePurchasedTable() 
		{
			try
			{
			//get database connection 
			Connection conn = DBconnectionUtil.getDBConnection();	
			
			stm = conn.createStatement();
			
			//sql to create new table
			String Sql = "Create table purchased(  `Username` VARCHAR(30) NOT NULL, `ItemId` VARCHAR(8),"
			+ "`Quantity` INT(11), `ItemPrice` FLOAT,`TotalAmount` FLOAT, "
			+ " `Date` VARCHAR(45) , `Time` VARCHAR(45) ,  `PaymentMethodID` INT , `PurchasedD` INT NOT NULL AUTO_INCREMENT PRIMARY KEY)";
					
			//execute Query
			stm.executeUpdate(Sql);
			 
			} 
			catch (ClassNotFoundException | SQLException e)
			{
				e.printStackTrace();
			} 
			
			
		}

}
