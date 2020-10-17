package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import com.model.Customer;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;
import com.util.DBconnectionUtil;

/**
 * Class implementation Main Services Class for Userprofile
 * @author IT19374666- D.A.D.Madubashini
 */
public class UserProfileServiceImpl implements InterfaceUserProfileService
{

	private static PreparedStatement preSt;
	private static Connection conn;

	//ADD new Customer
	@Override
	public String addCustomer(Customer customer) {
		String chekAdd = null;
		try {
			//check database connection
			conn = DBconnectionUtil.getDBConnection();
			
			//Assign customer details  to  insert
			String sql = "Insert into customer(`fname`, `lname`, `username`, `gender`, `email`, `password`) values(?, ?, ?, ?, ?, ?)";
			preSt = conn.prepareStatement(sql);
	
			preSt.setString(1, customer.getFirstName());
			preSt.setString(2, customer.getLastName());
			preSt.setString(3, customer.getUsername());
			preSt.setString(4, customer.getGender());
			preSt.setString(5, customer.getEmail() );	
			preSt.setString(6, customer.getPassword() );	
		
			//Insert customer details to database
			int res = preSt.executeUpdate();
			
			//check data inserted to customer table
			if (res > 0) {
				chekAdd = "true";
			}
		} catch (MySQLIntegrityConstraintViolationException e) {
			chekAdd = "Username is already taken";
		
		} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
			
			//print error
			e.printStackTrace();
			
		} finally {
			
			//close the database connection after entering the customer details
			try {
				if (preSt != null) {
					preSt.close();
				}
			
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();	
			}
		}
		
		return chekAdd;
	}

	

	
	
	
	
	//get customer details
	@Override
	public Customer getCustomer(String username) {	
		
		Customer customer = new Customer();
		try {
			//check database connection 
			conn = DBconnectionUtil.getDBConnection();
			

			//get the customer details from the database
			String userSql = "Select * From customer Where username =?";
				
			preSt = conn.prepareStatement(userSql);
			preSt.setString(1, username);
			
	
			ResultSet result = preSt.executeQuery();
	
			//set retrieved customer details
			
			while(result.next()) {
				
				customer.setFirstName(result.getString(1));
				customer.setLastName(result.getString(2));
				customer.setUsername(result.getString(3));
				customer.setGender(result.getString(4));
				customer.setEmail(result.getString(5));
				customer.setPassword(result.getString(6));
				
				
			
			}
		
		
		} catch (SQLException | ClassNotFoundException | NumberFormatException e) {
			e.printStackTrace();
		} finally {
			
			//close the database connection after entering the customer details
			try {
				if (preSt != null) {
					preSt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException ex) {
				ex.printStackTrace();	
			}
		
		}
	
		//return customer
		//System.out.println(customer.getFirstName());
		return customer;
	}

	//update customer details
	@Override
	public boolean UpdateCustomer(Customer customer) 
	{
		boolean result = false;
		
		try {
			//check database connection
			conn = DBconnectionUtil.getDBConnection();
					
			//Assign value to update
			String sql = "Update customer Set fname = ?, lname = ?, gender = ?, email = ? where username = ?";
		
			preSt = conn.prepareStatement(sql);
		
			preSt.setString(1, customer.getFirstName());
			preSt.setString(2, customer.getLastName());
			preSt.setString(3, customer.getGender());
			preSt.setString(4, customer.getEmail());
			preSt.setString(5, customer.getUsername());
		
			//Update customer details in database
			int returned = preSt.executeUpdate();
		
			//check returned value
			if (returned > 0) {
				result = true;	
			}
		
		} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
			
			//print error
			e.printStackTrace();
		} finally {
			
			//close the database connection after updating the customer details
			try {
				if (preSt != null) {
					preSt.close();
				}
				
				if (conn != null) {
					conn.close();
				}
			} catch	(SQLException ex) {
				ex.printStackTrace();	
			}
		}
		
		return result;

	}

	//delete customer Account
	@Override
	public boolean DeleteCustomer(String uname) {
		
		boolean result = false;
	
		try {
			
			//check database connection
			conn = DBconnectionUtil.getDBConnection();
	
			//Assign customer details(values)  to  delete account
			String sql = "Delete From customer  Where username = ?";
	
			preSt = conn.prepareStatement(sql);
			preSt.setString(1, uname);
	
			//Delete customer details from database
			int returned = preSt.executeUpdate();
	
			//check returned value
			if (returned > 0) {
				result = true;	
			}
	
		} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
			
			//print error
			e.printStackTrace();
		} finally {
			
			//close the database connection after updating the Item details
			try {
				if (preSt != null) {
					preSt.close();
				}
			
				if (conn != null) {
					conn.close();
				}
			} catch	(SQLException ex) {
				ex.printStackTrace();	
			}
		
		}
	
	return result;
	}
	

}
