package com.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.model.Customer;
import com.util.DBconnectionUtil;

/**
 * Class implementation of CustomerServices class
 * @author IT19374666 - D.A.D.Madubashini
 */

public class CustomerServiceImpl {
	
	private static Connection conn;
	private static PreparedStatement prStatement;
	
	//Customer login
	//get customer deals from customer table and return (to CustomerLogin servlet)
	public static ArrayList<Customer> CustomerLoginDetails(String username,String password) {
		
		//create ArryList object
		ArrayList<Customer> DetailsList = new ArrayList<Customer>();
		
		try {
		
			//connect to database
			conn = DBconnectionUtil.getDBConnection();

			//SQL Query
			String sql = "Select * from customer where username='"+username+"' AND  password='"+password+"'";
		
			//create object for send SQL statements
			prStatement = conn.prepareStatement(sql);
		
		
			//sql statement
		
			//get result of executed SQL statement to table rSet
			ResultSet rSet = prStatement.executeQuery();
		
			if (rSet.next()) {
				
				//get username and password from database
				String DBusername = rSet.getString(1);
				String DBpassword = rSet.getString(2);
				
				Customer customer = new Customer();
				customer.setUsername(DBusername);
				customer.setPassword(DBpassword);
				
				DetailsList.add(customer);
			}

		} catch (SQLException  | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
		
			//close connection
			try {
				if (prStatement != null) {
					prStatement.close();
				}
				
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			
		}
	
		return DetailsList;
	
	}
	
	
}
