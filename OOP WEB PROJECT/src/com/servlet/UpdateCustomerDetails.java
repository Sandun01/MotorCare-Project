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
 * Class implementation Main Services Class for Customer
 * @author IT19374666 - D.A.D.Madubashini
 */
@WebServlet("/UpdateCustomerDetails")
public class UpdateCustomerDetails extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean chk;
		String EMsg = null;
		String uname = request.getParameter("un");
		
		try {
			Customer customer = new Customer();
			
			//Get element values
			customer.setFirstName(request.getParameter("firstname"));
			customer.setLastName(request.getParameter("lastname"));
			customer.setUsername(request.getParameter("username"));
			customer.setEmail(request.getParameter("email"));
			customer.setGender(request.getParameter("gender"));
			customer.setUsername(uname);
			
			//Update details in the database
			InterfaceUserProfileService uUpdate = new UserProfileServiceImpl();
			chk = uUpdate.UpdateCustomer(customer);
				
			//check the details are inserted to the database
			if (chk == true) {
				EMsg = "Customer Details Updated Successfully";
				request.setAttribute("errorUpdate", EMsg);
				RequestDispatcher dis = request.getRequestDispatcher("/UserProfile.jsp");
				dis.forward(request, response);	
			} else {
				EMsg = "Error:Can't Update customer Detalis.Invalid details";
				request.setAttribute("errorUpdate", EMsg);
				RequestDispatcher dis = request.getRequestDispatcher("/UpdateUserProfile.jsp");
				dis.forward(request, response);	
			}
		
		} catch (Exception e2) {
			EMsg = "Exception occured";
			request.setAttribute("errorUpdate", EMsg);
			RequestDispatcher dis = request.getRequestDispatcher("/UpdateUserProfile.jsp");
			dis.forward(request, response);	
		} 
		
	}

}
