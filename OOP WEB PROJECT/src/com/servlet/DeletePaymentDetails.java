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
 * Servlet implementation delete payment
 * @author IT19804316 R.M.K.D.Kumarasiri
 */

@WebServlet("/deletePaymentDetails")
public class DeletePaymentDetails extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//variables
		boolean st = false;
		
		//get payment id
		int id = Integer.parseInt(request.getParameter("pid"));
		
		//delete payment method
		st = PaymentDBUtil.DeletePayment(id);
		
			if(st == true)
			{
				RequestDispatcher Display =request.getRequestDispatcher("PaymentMethods.jsp");
				Display.forward(request, response); 
			}
			
			else
			{
				List<Payment> paymentDetails = PaymentDBUtil.getRelPayementDetails(id);
				request.setAttribute("paymentDetails", paymentDetails);
				
				RequestDispatcher Display =request.getRequestDispatcher("PaymentDetails.jsp");
				Display.forward(request, response); 
			
			}

	}

}
