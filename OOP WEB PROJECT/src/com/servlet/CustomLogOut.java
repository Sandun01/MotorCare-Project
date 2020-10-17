package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class customer logout
 * @author IT19374666 - D.A.D.Madubashini
 */
@WebServlet("/CustomLogOut")
public class CustomLogOut extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession session = request.getSession();
		session.removeAttribute("un");
		session.removeAttribute("CartCount");
		session.invalidate();
		
		response.sendRedirect("CustomerLogin.jsp");
	}


}
