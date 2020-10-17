package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Comment;
import com.util.CheckTablesUtil;
import com.util.DBconnectionUtil;

/**
 * Class implementation comment
 * @author IT19802022 W.A.L Priyasarani
 */

public class CustomerService {
	
	public static Connection conn;
	public static PreparedStatement pr;

	//add comment
	public static void AddComment(String un, String email, String comment) {
		
		try
		{
		//check database connection
			conn = DBconnectionUtil.getDBConnection();
			conn.setAutoCommit(false);
		
		//sql query
			String sql = "Insert Into comment(Username,Email,Comment) values('"+un+"','"+email+"','"+comment+"')";
			
		//execute query	
		pr = conn.prepareStatement(sql);
		pr.executeUpdate();
		conn.commit();
			
		} 
		
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
			
		} 
		
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		

	}

	//display all comments
	public static ArrayList<Comment> DisplayComments()
	{
		ArrayList comments = new ArrayList();
		boolean chkT;
		
		//check table available in database
		chkT = CheckTablesUtil.checkTableAvailability("comment");
						
				//if table not available in the database create a new table	
				if(chkT == false)
				{
					CheckTablesUtil.CreateCommentTable();
				}
				
		try
		{
		//check database connection
			conn = DBconnectionUtil.getDBConnection();
			
		
		//sql query
			String sql = "Select * From comment";
			
		//execute query	
		pr = conn.prepareStatement(sql);
		
		ResultSet rs = pr.executeQuery();
		
		while(rs.next())
		{
			Comment c1 = new Comment();
			c1.setUsername(rs.getString(1));
			c1.setEmail(rs.getString(2));
			c1.setComment(rs.getString(3));
			c1.setCommentId(rs.getInt(4));
			comments.add(c1);
		}
			
		} 
		
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
			
		} 
		
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		return comments;
		
	}
	
	//delete comment
	public static void DeleteComment(String username,int id) {

		try
		{
		//check database connection
			conn = DBconnectionUtil.getDBConnection();

		//sql query
			String sql = "Delete from comment where Username='"+username+"' AND ComID = '"+id+"' ";
			
		pr = conn.prepareStatement(sql);
		pr.executeUpdate();

		} 
		
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
			
		} 
		
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		
	}

	
}
