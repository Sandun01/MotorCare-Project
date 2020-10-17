package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation for admin logout
 * @author IT19362854 - S.L Abeygunawardana
 */

//@WebServlet("/AdminLogout")
public class AdminLogout extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		//destroy the session of user
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
		
		//user redirected to the login page
		response.sendRedirect("AdminLogin.jsp");
	}


}
