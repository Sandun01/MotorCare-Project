package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AppointmentServiceImpl;

/**
 * Servlet implementation delete appointment
 * @author IT19802022 W.A.L Priyasarani
 */

@WebServlet("/DeleteAppointment")
public class DeleteAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get id from database
		String id = request.getParameter("id");
		
		 boolean isTrue;
		 isTrue = AppointmentServiceImpl.delete(id);
			
			if (isTrue == true) {
				RequestDispatcher ds = request.getRequestDispatcher("Appointment.jsp");//if it is deleted go to this page
				ds.forward(request, response);
				
				
			}else {
				request.setAttribute("error", "Appointement details didn't Deleted");
				RequestDispatcher ds1 = request.getRequestDispatcher("Error.jsp");//if it is not inserted go to this page
				ds1.forward(request, response);
			}
	
	}

}
