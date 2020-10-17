package com.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.Payment;


public class PaymentDBUtil {
	
	private static boolean isSuccess;
	private static Connection connect = null;
	private static Statement state = null;
	private static ResultSet result = null;
	
	
public static ArrayList<Payment> getRelPayementDetails(int Pid){
	
		ArrayList<Payment> payList = new ArrayList<>();
		try {
			connect = DBconnectionUtil.getDBConnection();
			state = connect.createStatement();
			String sql= "select * from payment where Pid = '"+Pid+"'";
			
			result = state.executeQuery(sql);
			
			if (result.next()) {
				
				int pID  = result.getInt(1);
				String un = result.getString(2);
				String fName = result.getString(3);
				String lName = result.getString(4);
				String Email = result.getString(5);
				String phoneNo  = result.getString(6);
				String cardNo = result.getString(7);
				int year = result.getInt(8);
				String month = result.getString(9);
				int cvv = result.getInt(10);
				String country = result.getString(11);
				String address1 = result.getString(12);
				String address2 = result.getString(13);
				String city = result.getString(14);
				float bal = result.getFloat(15);
				
				Payment pay = new Payment(pID,un,fName,lName,Email,phoneNo,cardNo,year,month,cvv,country,address1,address2,city,bal); 
				
				payList.add(pay);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	return payList;
	}

public static boolean insertPayment(String uname,String fName,String lName,
		String email,String phoneNo,int cardNo,int year,String Month,int Cvv,String Country,String Address1,String  Address2,String City,float balance)
{
	
	isSuccess = false;

	try {
		connect = DBconnectionUtil.getDBConnection();
		state = connect.createStatement();
		String SQL = "insert into payment values(0,'"+uname+"','"+fName+"',"
				+ "'"+lName+"','"+email+"','"+phoneNo+"','"+cardNo+"','"+year+"',"
						+ "'"+Month+"','"+Cvv+"','"+Country+"','"+Address1+"','"+Address2+"','"+City+"','"+balance+"' )";
		
		int result = state.executeUpdate(SQL);
		
		if (result > 0) {
			isSuccess = true;
			
		}
		else {
			isSuccess = false;
		}	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
	 	 
	 }

//get all payment details of user
public static ArrayList<Payment> getDetails(String un){
	
	
	//check table available in database or create a new one
	boolean res;
	
	//check  table is available in database
	res = CheckTablesUtil.checkTableAvailability("payment");

	if(res == false)
	{
		//if table doesn't exist.s
		CheckTablesUtil.CreatePaymentTable();
	}	
	
	ArrayList<Payment> payList = new ArrayList<Payment>();
	
	try {
		connect = DBconnectionUtil.getDBConnection();
		
		PreparedStatement pr;
		
		String sql= "select * from payment where Username = '"+un+"'";
		
		pr = connect.prepareStatement(sql);
		
		ResultSet result = pr.executeQuery();
		
		while(result.next()) {
			
			int pID  = result.getInt(1);
			String uname = result.getString(2);
			String fName = result.getString(3);
			String lName = result.getString(4);
			String Email = result.getString(5);
			String phoneNo  = result.getString(6);
			String cardNo = result.getString(7);
			int year = result.getInt(8);
			String month = result.getString(9);
			int cvv = result.getInt(10);
			String country = result.getString(11);
			String address1 = result.getString(12);
			String address2 = result.getString(13);
			String city = result.getString(14);
			float bal = result.getFloat(15);
			
			Payment pay = new Payment(pID,uname,fName,lName,Email,phoneNo,cardNo,year,month,cvv,country,address1,address2,city,bal); 
			
			payList.add(pay);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
return payList;
}

//delete payment details
public static boolean DeletePayment(int pid) {
	
	boolean isSuccess = false;

	try {
		connect = DBconnectionUtil.getDBConnection();
		
		String sql = "Delete from payment where Pid='"+pid+"' ";
		
		PreparedStatement pr = connect.prepareStatement(sql);
		
		int no = pr.executeUpdate();
		
		if(no > 0)
		{
			isSuccess = true;
		}
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
	 	 
	 }

//update payment details
public static boolean UpdatePaymentDetails(Payment p)
{
	
	isSuccess = false;

	try {
		connect = DBconnectionUtil.getDBConnection();
		
		String sql = "Update payment Set Fname = '"+p.getfName()+"' , Lname = '"+p.getlName()+"' , Email = '"+p.getEmail()+"' , Phone = '"+p.getPhoneNo()+"' ,"
		+ " Cardno = '"+p.getCardNo()+"' , Year = '"+p.getYear()+"' , Month = '"+p.getMonth()+"' , Cvv = '"+p.getCvv()+"' , Country = '"+p.getCountry()+"' ,"
		+ " Address1 = '"+p.getAddress1()+"' , Address2 = '"+p.getAddress2()+"' , City = '"+p.getCity()+"' Where Pid = '"+p.getpID()+"' ";
		
		PreparedStatement pr = connect.prepareStatement(sql);
				
		int result = pr.executeUpdate(sql);
		
		if (result > 0) {
			isSuccess = true;
			
		}
		else {
			isSuccess = false;
		}	
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
	 	 
	 }

//get user's total amount from cart
public static float getTotalAmount(String uname)
{
	//variables
	float total = 0;
	
	try {
		connect = DBconnectionUtil.getDBConnection();
		
		String sql ="Select SUM(TotalAmount) From cart Where Username = '"+uname+"'  ";
		
		PreparedStatement pr = connect.prepareStatement(sql);
				
		result = pr.executeQuery(sql);
		
		if(result.next())	
		{
			total = result.getFloat(1);
		}
		
			
	}catch(Exception e) {
		e.printStackTrace();
	}

	return total;
}

//get 
public static float getAccountBalance(int PID)
{
	//variables
	float balance = 0;
	
	try {
		connect = DBconnectionUtil.getDBConnection();
		
		String sql ="Select Balance From payment Where Pid = '"+PID+"'  ";
		
		PreparedStatement pr = connect.prepareStatement(sql);
				
		result = pr.executeQuery(sql);
		
		if(result.next())	
		{
			balance = result.getFloat(1);
		}
		
			
	}catch(Exception e) {
		e.printStackTrace();
	}

	return balance;
}


}
