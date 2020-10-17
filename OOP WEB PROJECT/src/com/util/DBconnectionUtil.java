package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnectionUtil {

	private static Connection conn;

	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {
	// This create new connection objects when connection is closed or it is null
		
	String url ="jdbc:mysql://localhost:3306/motorcare";
	String DBUname = "root";
	String DBPwd = "root";
	
	try {
		
	if (conn == null || conn.isClosed()) 
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,DBUname,DBPwd);
	}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
			
	return conn;
	
	}
	
}
