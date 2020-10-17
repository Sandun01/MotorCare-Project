package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Admin;
import com.service.AdminServiceImpl;

/**
 * Servlet implementation update sub admin
 * @author IT19362854 - S.L Abeygunawardana
 */

@WebServlet("/updateSubAdmin")
public class UpdateSubAdmin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
			boolean res = false;
			
			//get values
			String un = request.getParameter("un");
			String pwd = request.getParameter("pwd");
			String post = "sub";
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			Admin a = new Admin(un,pwd,post,name,email,phone);
			
			//add details
			res = AdminServiceImpl.UpdateSubAdmin(a);
			
			if(res == true)
			{
				RequestDispatcher rd = request.getRequestDispatcher("AdminProfile.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd1 = request.getRequestDispatcher("UpdateSubAdmin.jsp");
				rd1.forward(request,response);
			}

		
	}

}
