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
 * Servlet implementation add new sub admin
 * @author IT19362854 - S.L Abeygunawardana
 */
@WebServlet("/addNewAdmin")
public class AddNewAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
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
		res = AdminServiceImpl.addNewSubAdmin(a);
		
		if(res == true)
		{
			RequestDispatcher rd = request.getRequestDispatcher("viewAllAdmin.jsp");
			rd.forward(request, response);
		}
		else
		{
			request.setAttribute("msg", "Can't add admin");	
			RequestDispatcher rd1 = request.getRequestDispatcher("AdminProfile.jsp");
			rd1.forward(request,response);
		}
		}
		catch(Exception e)
		{
			request.setAttribute("msg", "Can't add admin.Exceprion occured.");	
			RequestDispatcher rd1 = request.getRequestDispatcher("AdminProfile.jsp");
			rd1.forward(request,response);
		}
		
		
	}

}
