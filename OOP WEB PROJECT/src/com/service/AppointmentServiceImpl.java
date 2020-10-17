package com.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import com.model.Appointment;
import com.util.DBconnectionUtil;

/**
 * Class implementation appointment
 * @author IT19802022 W.A.L Priyasarani
 */

public class AppointmentServiceImpl {
//Insert booking appointment
	public static boolean insert(Appointment a)
	{
	boolean isSuccess = false;
		
		try 
		{
		
		//check database connection
		Connection con = DBconnectionUtil.getDBConnection();
			
			Statement stmp = con.createStatement(); 
			
			String FName = a.getFname();
			String LName = a.getLname();
			String Email = a.getEmail();
			String PhoneNumber = a.getPhonenumber();
			String PreferedDate = a.getPreferedDate();
			String PreferedLocation = a.getPreferedLocation();
			String VehicleNo = a.getVehicleNo();
				
		//Initializing appointment details in to database(insert)
		String strSql = "insert into appointment values(0,'"+FName+"','"+LName+"','"+ Email+"','"+PhoneNumber+"','"+PreferedDate+"','"+PreferedLocation+"','"+VehicleNo+"')";

		
		int rs = stmp.executeUpdate(strSql);
			
			if(rs > 0)
			{
				isSuccess = true;
			}
			else
			{
				isSuccess = false;
			}
			
		}
		catch (Exception e) 
		{
			//check error 
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
	
	//Update appointment
	public static boolean update( int id, String fName, String lName, String phoneNumber, String email, String preferedDate, String preferedLocation, String vehicleNo) {
		boolean isSuccess = false;
	
		
		try {
			
			//check database connection
			Connection con = DBconnectionUtil.getDBConnection();
			Statement stmp = con.createStatement(); 
			//Update database
			String strSql = "update appointment set LName='"+lName+"', Email = '"+email+"',PhoneNumber = '"+phoneNumber+"', PreferedDate = '"+preferedDate+"',PreferedLocation = '"+preferedLocation+"', VehicleNo ='"+vehicleNo+"' where id= '"+id+"' ";
			int rs = stmp.executeUpdate(strSql);
			
		
			if(rs > 0) {
				isSuccess = true;
			}else {
				isSuccess = false;
			}
			
		}catch (Exception e) {
			
			e.printStackTrace();
		}
		
		
		return isSuccess;
		
	}
//Delete booking appointment
	public static boolean delete(String id) {
		
		boolean isSuccess = false;
				
				
				
				try {
					
					//check database connection
					Connection con = DBconnectionUtil.getDBConnection();
					
					Statement stmp = con.createStatement(); 
					
					//Get appointment id from database
					String strSql = "delete from appointment where id = '"+ id +"'";
					int rs = stmp.executeUpdate(strSql);
					if(rs > 0) {
						isSuccess = true;
					}else {
						isSuccess = false;
					}
					
				}catch (Exception e) {
					//print error
					e.printStackTrace();
				}
				
				
				return isSuccess;
				
				
			}

	
	}

	

