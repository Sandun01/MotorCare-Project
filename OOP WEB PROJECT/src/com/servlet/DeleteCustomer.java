package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Customer;
import com.service.InterfaceUserProfileService;
import com.service.UserProfileServiceImpl;

/**
 * Servlet implementation to delete Customer Account
 * @author IT19374666 - D.A.D.Madubashini
 */
@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean result;
		String eMsg = null;
		
		//get username of the customer 
		String uname = request.getParameter("un");

		//Delete customer details from database
		InterfaceUserProfileService uDelete = new UserProfileServiceImpl();
		result = uDelete.DeleteCustomer(uname);
		
		if (result == true) {
			eMsg = "Deleted Successfully";
			request.setAttribute("errorDelete", eMsg);
			RequestDispatcher dis = request.getRequestDispatcher("CustomLogOut");
			dis.forward(request, response);
		} else {
			eMsg = "Error:Can't Delete Your Account!!";
			request.setAttribute("errorDelete", eMsg);
			RequestDispatcher dis = request.getRequestDispatcher("/UserProfile.jsp");
			dis.forward(request, response);
		}
		
	  
	}

}
