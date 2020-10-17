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
import com.service.CartServiceImpl;
import com.service.CustomerServiceImpl;
import com.util.CheckTablesUtil;;

/**
 * Servlet implementation class  CustomerLogin
 * @author IT19374666- D.A.D.Madubashini
 */

@WebServlet("/CustomerLog")
public class CustomerLog extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uname = null;
		String pwd = null; 
		String eMessage = null;
		boolean st;
		
		uname = request.getParameter("username");
		pwd = request.getParameter("password");
		
		try {
			
			//check table available in database
			st = CheckTablesUtil.checkTableAvailability("customer");
					
			//if table not available in the database create a new table	
			if(st == false)
			{
				CheckTablesUtil.CreateCustomerTable();
			}
			
			ArrayList<Customer> list = CustomerServiceImpl.CustomerLoginDetails(uname,pwd);
			request.setAttribute("CustomerProfile", list);
			
			
			if (list.size() > 0) {
			
				//create session
				HttpSession session = request.getSession();
				session.setAttribute("un", uname);
			
				//set cart count
				int count = CartServiceImpl.CountCartItems(uname);
				session.setAttribute("CartCount", count);
				
				eMessage = "You are logged into the system!!";
				
				request.setAttribute("errorLogin", eMessage);
				RequestDispatcher dis = request.getRequestDispatcher("/Home.jsp");
				dis.forward(request, response);	
				
			} else {
				eMessage = "Invalid Login";
				request.setAttribute("EMessage", eMessage);
				RequestDispatcher dis = request.getRequestDispatcher("/CustomerLogin.jsp");
				dis.forward(request, response);	
				
			}
			
					
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

}
