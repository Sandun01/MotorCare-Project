package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Customer;
import com.service.UserProfileServiceImpl;
import com.util.CheckTablesUtil;
import com.service.InterfaceUserProfileService;

/**
 * Servlet implementation for user registration
 * @author IT19374666- D.A.D.Madubashini
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public registration() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pwd = null;
		String cnpwd = null;
		String chk = null;
		String EMsg = null;
		boolean st;
		
		Customer customer = new Customer();
		
		//Get element values
		customer.setFirstName(request.getParameter("firstname"));
		customer.setLastName(request.getParameter("lastname"));
		customer.setUsername(request.getParameter("username"));
		customer.setEmail(request.getParameter("email"));
		customer.setGender(request.getParameter("gender"));
		pwd = request.getParameter("password");
		cnpwd = request.getParameter("cnfrmpw");
			
			
		//Validate passwords
		if (pwd.equals(cnpwd) && pwd.length() >= 8) {
			customer.setPassword(pwd);
				
			//check table available in database
			st = CheckTablesUtil.checkTableAvailability("customer");
					
			//if table not available in the database create a new table	
			if(st == false)
			{
				CheckTablesUtil.CreateCustomerTable();
			}
			
			//Add details to database
			InterfaceUserProfileService userAdd = new UserProfileServiceImpl();
			chk = userAdd.addCustomer(customer);
				
			//check the details are inserted to the database
			if (chk == "true") {
				EMsg = "Registration is Successfully";
				request.setAttribute("EMessage", EMsg);
				RequestDispatcher dis = request.getRequestDispatcher("/CustomerLogin.jsp");
				dis.forward(request, response);	
					
			} else {
				EMsg = chk;
				request.setAttribute("EMessage", EMsg);
				RequestDispatcher dis = request.getRequestDispatcher("/Registration.jsp");
				dis.forward(request, response);	
			}

				
		} else {
				
		    if ((pwd.length() < 8) || (!pwd.equals(cnpwd))) {
				EMsg = "Two passwords are dismatched or Password is too short!!!";
				
			
				
		    request.setAttribute("EMessage", EMsg);
		    RequestDispatcher dis = request.getRequestDispatcher("/Registration.jsp");
		    dis.forward(request, response);	
		
		    }
		}
			
			
	}
			
		
		
			
}
			
		

		
		
