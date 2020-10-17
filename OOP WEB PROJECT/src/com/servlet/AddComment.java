package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.CustomerService;
import com.util.CheckTablesUtil;

/**
 * Servlet implementation add comment
 * @author IT19802022 W.A.L Priyasarani
 */

//@WebServlet("/AddComment")
public class AddComment extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String un;
		String email;
		String comment;
		boolean chk;
		
		//check table available in database
		chk = CheckTablesUtil.checkTableAvailability("comment");
						
				//if table not available in the database create a new table	
				if(chk == false)
				{
					CheckTablesUtil.CreateCommentTable();
				}
				
		
		//get values from contact us form
		un = request.getParameter("name");
		email = request.getParameter("email");
		comment = request.getParameter("des");
		
		//pass values to database
		CustomerService.AddComment(un,email,comment);
		

		RequestDispatcher rd = request.getRequestDispatcher("ContactUs.jsp");
		rd.forward(request, response);
	
	
	}

}
