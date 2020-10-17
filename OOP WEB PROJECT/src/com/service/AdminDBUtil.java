package com.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.model.Service;
import com.util.DBconnectionUtil;

/**
 * Class implementation service class
 * @author IT19804316 R.M.K.D.Kumarasiri
 */


public class AdminDBUtil {
	
	private static boolean isSuccess;
	private static Connection connect = null;
	private static Statement state = null;
	private static ResultSet result = null;
	

	public static boolean insertService(String no, String name, String description,String Amount) {
		isSuccess = false;
	
		try {
			connect = DBconnectionUtil.getDBConnection();
			state = connect.createStatement();
			String SQL = "insert into service values('"+no+"','"+name+"','"+description+"','"+Amount+"')";
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
	public static List<Service> validate(String serviceNo){
		
		ArrayList<Service> serList = new ArrayList<>();
		try {
			connect = DBconnectionUtil.getDBConnection();
			state = connect.createStatement();
			String sql= "select * from service where serviceNo = '"+serviceNo+"'";
			
			result = state.executeQuery(sql);
			
			if (result.next()) {
				
				String ServiceNo = result.getString(1);
				String ServiceName = result.getString(2);
				String ServiceDescription = result.getString(3);
				String ServiceAmount = result.getString(4);
				
				Service Sr = new Service(ServiceNo,ServiceName,ServiceDescription,ServiceAmount); 
				
				serList.add(Sr);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	return serList;
	}
	
	public static boolean UpdateService(String serviceNo,String serviceName, String serviceDescription,String serviceAmount) {
		try {
			connect = DBconnectionUtil.getDBConnection();
			state = connect.createStatement();
			String SQL = "update service "
					+ "set serviceName='"+serviceName+"',serviceDescription ='"+serviceDescription+"',serviceAmount='"+serviceAmount+"'"
							+ "where serviceNo = '"+serviceNo+"'";
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
	
	public static boolean DeleteService(String serviceNo) {
		isSuccess = false;	
		try {
			connect = DBconnectionUtil.getDBConnection();
			state = connect.createStatement();
			String Sql = "delete from service "
					+ "where serviceNo = '"+ serviceNo +"'";
			int result = state.executeUpdate(Sql);
			
			if(result > 0) {
					isSuccess = true;
					//System.out.println("true");
				}
				else {
					isSuccess = false;
					//System.out.println("false");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			return isSuccess;
		}
	
	public static ArrayList<Service> getAllServices(){
		
		ArrayList<Service> serList = new ArrayList<>();
		try {
			connect = DBconnectionUtil.getDBConnection();
			state = connect.createStatement();
			String sql= "select * from service ";
			
			result = state.executeQuery(sql);
			
			while(result.next()) {
				
				String ServiceNo = result.getString(1);
				String ServiceName = result.getString(2);
				String ServiceDescription = result.getString(3);
				String ServiceAmount = result.getString(4);
				
				Service Sr = new Service(ServiceNo,ServiceName,ServiceDescription,ServiceAmount); 
				
				serList.add(Sr);
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	return serList;
	}
	

}

	

