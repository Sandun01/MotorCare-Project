package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Payment;
import com.util.PaymentDBUtil;

/**
 * Servlet implementation validate payement details
 * @author IT19804316 R.M.K.D.Kumarasiri
 */  

@WebServlet("/UpdatePaymentDetails")
public class UpdatePaymentDetails extends HttpServlet {
	
	/**
	 * Servlet implementation update payment
	 * @author IT19804316 R.M.K.D.Kumarasiri
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			boolean isSuccess;
			//assign balance as 5000
			float balance = 5000;
			
			Payment p = new Payment();
			
			p.setpID(Integer.parseInt(request.getParameter("pid")));
			p.setUsername(request.getParameter("un"));
			p.setfName(request.getParameter("fName"));
			p.setlName(request.getParameter("lName"));
			p.setEmail(request.getParameter("email"));
			p.setPhoneNo(request.getParameter("pNo"));
			p.setCardNo(request.getParameter("cardNo"));
			p.setYear(Integer.parseInt(request.getParameter("year")));
			p.setMonth(request.getParameter("month"));
			p.setCvv(Integer.parseInt(request.getParameter("Cvv")));
			p.setCountry(request.getParameter("Country"));
			p.setAddress1(request.getParameter("Add1"));
			p.setAddress2(request.getParameter("Add2"));
			p.setCity(request.getParameter("city"));
			
			isSuccess = PaymentDBUtil.UpdatePaymentDetails(p);
			
			if(isSuccess == true) {
					
					RequestDispatcher Display =request.getRequestDispatcher("PaymentMethods.jsp");
					Display.forward(request, response); 
			}
			
				else {
				request.setAttribute("error", "Error in adding payment details");
				RequestDispatcher Display2 = request.getRequestDispatcher("Error.jsp");
				Display2.forward(request, response);
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
				request.setAttribute("error", "Exception.Invalid inputs");
				RequestDispatcher Display2 = request.getRequestDispatcher("Error.jsp");
				Display2.forward(request, response);
			}
		
		
	}

}
