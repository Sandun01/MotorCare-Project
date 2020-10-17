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

import com.model.Admin;
import com.service.AdminServiceImpl;

/**
 * Servlet implementation for update admin password
 * @author IT19362854 - S.L Abeygunawardana
 */

@WebServlet("/mainAdminUpdate")
public class UpdateMainAdmin extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	//get values from form
	String Newpass = null;
	String RNewpass = null;
	
	String pass = request.getParameter("CPwd");
	Newpass = request.getParameter("NPwd1");
	RNewpass = request.getParameter("NPwd2");
	String un = request.getParameter("un");
	
	//check passwords are equal
	boolean chkP1 = pass.equals(Newpass); 
	boolean chkP2 = RNewpass.equals(Newpass); 
	
	//check passwords are equal
		if(chkP1 == false && chkP2 == true )
		{
		//update value in database and get result
		boolean result = AdminServiceImpl.changePassword(un,Newpass);
		
		//check password is updated
			if(result == true)
			{	
			//User redirect to profile page
			request.setAttribute("Message", "Password Successfully Updated.Login again using new Password");
			HttpSession session = request.getSession();
			session.removeAttribute("username");
			session.removeAttribute("DetailsList");
			session.invalidate();
			
			//user redirected to the login page
			RequestDispatcher rd1 = request.getRequestDispatcher("AdminLogin.jsp");
			rd1.forward(request,response);
			
			}
			else
			{
			request.setAttribute("msg", "Can't update password");
			//user redirect to the admin profile page	
			RequestDispatcher rd1 = request.getRequestDispatcher("AdminProfile.jsp");
			rd1.forward(request,response);
			}
		}
		else
		{
		request.setAttribute("msg", "Error:Invalid Inputs");
		//user redirect to the admin profile page	
		RequestDispatcher rd1 = request.getRequestDispatcher("AdminProfile.jsp");
		rd1.forward(request,response);
		}
	

	}

}
