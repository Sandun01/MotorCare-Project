package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation send payment details for update
 * @author IT19804316 R.M.K.D.Kumarasiri
 */


@WebServlet("/SendPaymentIDUpdate")
public class SendPaymentIDUpdate extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				
		//get payment id
		int id = Integer.parseInt(request.getParameter("pid"));
		
		request.setAttribute("pid", id);
		RequestDispatcher Display =request.getRequestDispatcher("UpdatePayment.jsp");
		Display.forward(request, response); 
		
	}

}
