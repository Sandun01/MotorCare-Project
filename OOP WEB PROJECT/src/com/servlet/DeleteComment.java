package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.CustomerService;

/**
 * Servlet implementation delete comment
 * @author IT19802022 W.A.L Priyasarani
 */

//@WebServlet("/DeleteComment")
public class DeleteComment extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get username
		String un = request.getParameter("name");
		int id = Integer.parseInt(request.getParameter("id"));
		
		//delete comment
		CustomerService.DeleteComment(un,id);
		
		RequestDispatcher rd = request.getRequestDispatcher("ContactUs.jsp");
		rd.forward(request, response);
		
	}

}
