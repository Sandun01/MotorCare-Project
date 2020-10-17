package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.AdminServiceImpl;

/**
 * Servlet implementation delete sub admin
 * @author IT19362854 - S.L Abeygunawardana
 */

@WebServlet("/deleteSubAmin")
public class DeleteSubAmin extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		boolean res = false;
		
		//get username
		String un = request.getParameter("un");
		
		//delete admin account
		res = AdminServiceImpl.deleteSubAdmin(un);
		
		if(res == true)
		{
			//destroy the session of user
			HttpSession session = request.getSession();
			session.removeAttribute("username");
			session.invalidate();
			
			//user redirected to the login page
			response.sendRedirect("AdminLogin.jsp");
		}
		else
		{
			request.setAttribute("msg", "Can't Delete Admin");	
			RequestDispatcher rd1 = request.getRequestDispatcher("AdminProfile.jsp");
			rd1.forward(request,response);
		}
	}

}
