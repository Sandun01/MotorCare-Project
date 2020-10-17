package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Item;
import com.service.ItemServiceImpl;
import com.service.InterfaceItemService;

/**
 * Servlet implementation class AddItem
 * @author IT19362854 - S.L Abeygunawardana
 */
//@WebServlet("/AddItem")
public class AddItem extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		boolean chk;
		String EMsg = null;
		
		try
		{
		//assign details to item object
		Item item = new Item();
		
		item.setItemName(request.getParameter("name"));
		item.setItemPrice(Float.parseFloat(request.getParameter("price")));
		item.setItemQuantity(Integer.parseInt(request.getParameter("qty")));
		item.setSupplier(request.getParameter("supplier"));
		item.setDescription(request.getParameter("des"));

		//Add details to database
		InterfaceItemService serviceAdd = new ItemServiceImpl();
		chk = serviceAdd.addItem(item);
		
			//check the details are inserted to the database
			if(chk == true)
			{
				EMsg = "Sucessfully Added Item Detalis";
				response.sendRedirect("DisplayItem.jsp");
			}
			//if details can't insert to the database alert message set to the user
			else
			{
				EMsg = "Error:Can't Add Item Detalis";
				request.setAttribute("EMessage", EMsg);
				RequestDispatcher dis1 = request.getRequestDispatcher("AddItem.jsp");
				dis1.forward(request, response);
			}
			
		}
		
		catch(NumberFormatException e1)
		{
		EMsg = "Error in Data type ItemPrice OR ItemQuantity(Exception).Please input valid details";
		request.setAttribute("EMessage", EMsg);
		RequestDispatcher dis2 = request.getRequestDispatcher("AddItem.jsp");
		dis2.forward(request, response);
		}
		catch(Exception e2)
		{
		EMsg = "Exception Occoured.";
		request.setAttribute("EMessage", EMsg);
		RequestDispatcher dis3 = request.getRequestDispatcher("AddItem.jsp");
		dis3.forward(request, response);
		}
		

	}

}
