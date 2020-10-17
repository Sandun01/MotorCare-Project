package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Payment;
import com.util.PaymentDBUtil;

/**
 * Servlet implementation display payment
 * @author IT19804316 R.M.K.D.Kumarasiri
 */

@WebServlet("/displayPaymentDetails")
public class DisplayPaymentDetails extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int id = Integer.parseInt(request.getParameter("pid") );
		
		List<Payment> paymentDetails = PaymentDBUtil.getRelPayementDetails(id);
		request.setAttribute("paymentDetails", paymentDetails);
		
		RequestDispatcher Display =request.getRequestDispatcher("PaymentDetails.jsp");
		Display.forward(request, response); 
		
	}

}
