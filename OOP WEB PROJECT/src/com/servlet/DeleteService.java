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
 * Servlet implementation delete service
 * @author IT19804316 R.M.K.D.Kumarasiri
 */


@WebServlet("/DeleteService")
public class DeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String serviceNo = request.getParameter("sNo");
		
		 boolean isTrue;
		 isTrue = AdminDBUtil.DeleteService(serviceNo);
			
			if (isTrue == true) {
				RequestDispatcher display = request.getRequestDispatcher("AllService.jsp");
				display.forward(request, response);
				
				
			}else {
				RequestDispatcher Display = request.getRequestDispatcher("Unsuccess.jsp");
				Display.forward(request, response);
			}
		
		
	}
}

