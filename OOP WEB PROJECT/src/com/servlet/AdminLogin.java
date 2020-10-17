package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.AdminServiceImpl;

/**
 * Servlet implementation admin login
 * @author IT19362854 - S.L Abeygunawardana
 */

//@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uname = null;
		String pwd = null; 
		boolean res;
		
		uname = request.getParameter("username");
		pwd = request.getParameter("password");
		
		try
		{		
		res = AdminServiceImpl.ValidateAdminLogin(uname, pwd);
		
		if(res == true)
		{
		//create session
		HttpSession session = request.getSession();
		session.setAttribute("username", uname);
		
		//pass Admin details to Home and user can enter the home page
		RequestDispatcher dis = request.getRequestDispatcher("/AdminHome");
		dis.forward(request, response);
		}
		
		//If login details are invalid alert message set to the user
		else
		{
		request.setAttribute("Message", "Invalid Login Details");
		RequestDispatcher dis1 = request.getRequestDispatcher("/AdminLogin.jsp");
		dis1.forward(request, response);
		}
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
			request.setAttribute("Message", "DB not connected or SQL syntax error");
			RequestDispatcher dis1 = request.getRequestDispatcher("/AdminLogin.jsp");
		}
		
	}

}
