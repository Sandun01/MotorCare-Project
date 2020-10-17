package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Appointment;
import com.service.AppointmentServiceImpl;
import com.util.CheckTablesUtil;

/**
 * Servlet implementation add appointment
 * @author IT19802022 W.A.L Priyasarani
 */

//@WebServlet("/AddAppointment")
public class AddAppointment extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		boolean chkT;
		
		//check table available in database
		chkT = CheckTablesUtil.checkTableAvailability("appointment");
						
		//if table not available in the database create a new table	
			if(chkT == false)
			{
				CheckTablesUtil.CreateAppointmentTable();
			}
				
		
		Appointment a = new Appointment();
		
		a.setFname(request.getParameter("FName"));
		a.setLname(request.getParameter("LName"));
		a.setEmail(request.getParameter("Email"));
		a.setPhonenumber(request.getParameter("PhoneNumber"));
		a.setPreferedDate(request.getParameter("PreferedDate"));
		a.setPreferedLocation(request.getParameter("PreferedLocation"));
		a.setVehicleNo(request.getParameter("VehicleNo"));
		
		
		String FName = request.getParameter("FName");
		String LName = request.getParameter("LName");
		String Email = request.getParameter("Email");
		String PhoneNumber = request.getParameter("PhoneNumber");
		String PreferedDate = request.getParameter("PreferedDate");
		String PreferedLocation = request.getParameter("PreferedLocation");
		String VehicleNo = request.getParameter("VehicleNo");
		
		boolean isTrue;
		//
		isTrue = AppointmentServiceImpl.insert(a);
		
		if (isTrue == true) {
			RequestDispatcher ds = request.getRequestDispatcher("Appointment.jsp");//If it is insert then go to this page
			ds.forward(request, response);
			
			
		}else {
			request.setAttribute("error", "Appointement details didn't added sucessfully");
			RequestDispatcher ds1 = request.getRequestDispatcher("Error.jsp");//if it is not inserted go to this page
			ds1.forward(request, response);
		}
	
	
	
	}

}
