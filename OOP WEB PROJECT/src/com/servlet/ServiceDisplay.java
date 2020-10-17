package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Service;
import com.service.AdminDBUtil;


/**
 * Servlet implementation display service
 * @author IT19804316 R.M.K.D.Kumarasiri
 */


//@WebServlet("/ServiceDisplay")
public class ServiceDisplay extends HttpServlet {
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ServiceNo = request.getParameter("sNo");

		try {
		List<Service> serviceDetails = AdminDBUtil.validate(ServiceNo);
		
			if(serviceDetails.size() > 0)
			{
				request.setAttribute("serviceDetails", serviceDetails);
				RequestDispatcher Display = request.getRequestDispatcher("ServiceDetails.jsp");
				Display.forward(request, response); 
			}
			else
			{
				RequestDispatcher Display =request.getRequestDispatcher("DisplayService.jsp");
				Display.forward(request, response); 
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
}
