package com.servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AdminDBUtil;
import com.util.CheckTablesUtil;

/**
 * Servlet implementation insert service
 * @author IT19804316 R.M.K.D.Kumarasiri
 */


//@WebServlet("/ServiceInsert")
public class ServiceInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ServiceNo = request.getParameter("sNo");
		String ServiceName = request.getParameter("sName");
		String ServiceDescription = request.getParameter("sDec");
		String ServiceAmount = request.getParameter("sAmount");
		
		boolean number;
		boolean ch;
		
		//check table available in database
		ch = CheckTablesUtil.checkTableAvailability("service");
						
		//if table not available in the database create a new table	
		if(ch == false)
		{
			CheckTablesUtil.CreateServiceTable();
		}
				
		
		number =AdminDBUtil.insertService(ServiceNo, ServiceName, ServiceDescription,ServiceAmount);
		
		if(number == true) {
			RequestDispatcher Display =request.getRequestDispatcher("AllService.jsp");
			Display.forward(request, response);
		}
		else {
			RequestDispatcher Display2 = request.getRequestDispatcher("Unsuccess.jsp");
			Display2.forward(request, response);
			
		}
		
	}

}
