package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AdminDBUtil;

/**
 * Servlet implementation update service
 * @author IT19804316 R.M.K.D.Kumarasiri
 */


@WebServlet("/UpdateServiceServlet")
public class UpdateServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String serviceNo = request.getParameter("sNo");
		String serviceName = request.getParameter("sName");
		String serviceDescription = request.getParameter("sDec");
		String serviceAmount = request.getParameter("sAmount");
		
		boolean isCorrect;
		isCorrect = AdminDBUtil.UpdateService(serviceNo, serviceName, serviceDescription, serviceAmount);
		
		if(isCorrect == true) {
			RequestDispatcher Display = request.getRequestDispatcher("AllService.jsp");
			Display.forward(request, response);
		}else {
			RequestDispatcher Display = request.getRequestDispatcher("Unsuccess.jsp");
			Display.forward(request, response);
		}
		
	}

}
