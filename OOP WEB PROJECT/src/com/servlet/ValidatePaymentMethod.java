package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.PaymentDBUtil;

/**
 * Servlet implementation validate payement balance
 * @author IT19804316 R.M.K.D.Kumarasiri
 */

@WebServlet("/validatePaymentMethod")
public class ValidatePaymentMethod extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		//get method id adn username
		int id = Integer.parseInt(request.getParameter("pid"));
		String un = request.getParameter("un");
		
		//get total amount of items
		float total = PaymentDBUtil.getTotalAmount(un);
		
		//get user method balance
		float bal = PaymentDBUtil.getAccountBalance(id);
		
		//check valid
		if(bal > total)
		{
			request.setAttribute("pid", id);
			RequestDispatcher Display2 = request.getRequestDispatcher("ConfirmPayment.jsp");
			Display2.forward(request, response);
		}
		
		else
		{
			request.setAttribute("Message", "Insufficient balance.choose another method");
			RequestDispatcher Display2 = request.getRequestDispatcher("SelectPaymentMethod.jsp");
			Display2.forward(request, response);
		}
		
		
	}

}
