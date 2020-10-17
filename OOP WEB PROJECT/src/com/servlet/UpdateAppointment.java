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
 * Servlet implementation update appointment
 * @author IT19802022 W.A.L Priyasarani
 */

@WebServlet("/UpdateAppointment")
public class UpdateAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String FName = request.getParameter("FName");
		String LName = request.getParameter("LName");
		String Email = request.getParameter("Email");
		String PhoneNumber = request.getParameter("PhoneNumber");
		String PreferedDate = request.getParameter("PreferedDate");
		String PreferedLocation = request.getParameter("PreferedLocation");
		String VehicleNo = request.getParameter("VehicleNo");
		
		 boolean isTrue;
		 isTrue = AppointmentServiceImpl.update(id,FName,LName,PhoneNumber, Email, PreferedDate, PreferedLocation, VehicleNo);
			
			if (isTrue == true) {
				RequestDispatcher ds = request.getRequestDispatcher("Appointment.jsp");//if it is updated go to this page
				ds.forward(request, response);
				
				
			}else {
				RequestDispatcher ds1 = request.getRequestDispatcher("Error.jsp");//if it is not inserted then move to this page
				ds1.forward(request, response);
			}
		
	
	}

}
