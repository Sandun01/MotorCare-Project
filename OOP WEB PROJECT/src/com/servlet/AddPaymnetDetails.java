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
import com.util.CheckTablesUtil;
import com.util.PaymentDBUtil;

/**
 * Servlet implementation add payment
 * @author IT19804316 R.M.K.D.Kumarasiri
 */

@WebServlet("/AddPaymnetDetails")
public class AddPaymnetDetails extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
		//check table available in database or create a new one
		boolean res;
			
		//check table is available in database
		res = CheckTablesUtil.checkTableAvailability("payment");

		if(res == false)
		{
		//if table doesn't exist.
		CheckTablesUtil.CreatePaymentTable();
		}	
		
		//assign balance as 5000
		float balance = 5000;
		
		String un  = request.getParameter("un");
		String fName  = request.getParameter("fName");
		String lName = request.getParameter("lName");
		String email = request.getParameter("email");
		String phoneNo = request.getParameter("pNo");
		int cardNo = Integer.parseInt(request.getParameter("cardNo"));
		int year = Integer.parseInt(request.getParameter("year"));
		String month = request.getParameter("month");
		int Cvv = Integer.parseInt(request.getParameter("Cvv"));
		String Country = request.getParameter("Country");
		String Address1 = request.getParameter("Add1");
		String Address2 = request.getParameter("Add2");
		String City = request.getParameter("city");
		
		boolean isSuccess;
		
		isSuccess = PaymentDBUtil.insertPayment(un,fName, lName, email, phoneNo, cardNo, year, month, Cvv, Country, Address1, Address2, City,balance);
		
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
			request.setAttribute("error", "Exception.Invalid inputs");
			RequestDispatcher Display2 = request.getRequestDispatcher("Error.jsp");
			Display2.forward(request, response);
		}
	}
		

}
