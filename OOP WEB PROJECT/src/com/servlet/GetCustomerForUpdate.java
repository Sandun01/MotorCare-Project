package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation to get customer details before update
 * @author IT19374666 - D.A.D.Madubashini
 */
@WebServlet("/GetCustomerForUpdate")
public class GetCustomerForUpdate extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Assign passed id value to a variable
		String username = request.getParameter("un");
		
		//Creating an instance of UserProfileServiceImpl class
		InterfaceUserProfileService Uservice = new UserProfileServiceImpl();
		
		//Customer class
		Customer customer = Uservice.getCustomer(username);
		

		//send Item details to update page
		
		request.setAttribute("CustomerDetails", customer);
		RequestDispatcher req = request.getRequestDispatcher("/UpdateUserProfile.jsp");
		req.forward(request, response);
	}

}