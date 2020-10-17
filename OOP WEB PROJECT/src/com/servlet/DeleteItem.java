package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Item;
import com.service.InterfaceItemService;
import com.service.ItemServiceImpl;

/**
 * Servlet implementation for delete item
 * @author IT19362854 - S.L Abeygunawardana
 */

//@WebServlet("/DeleteItem")
public class DeleteItem extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean result;
		Item item = new Item();
		
		//get item id to delete
		String ID = request.getParameter("HiddenItemId");
		
		//Add details to database
		InterfaceItemService serviceDelete = new ItemServiceImpl();
		result = serviceDelete.DeleteItem(ID);
		
		//set alert message to display according to the result
			if(result == true)
			{
			request.setAttribute("EMessage","Item Details Deleted Successfully");
			}
			else
			{
			request.setAttribute("EMessage","Error:Can't Delete Item Detalis");
			}
			
			RequestDispatcher dis = request.getRequestDispatcher("DisplayItem.jsp");
			dis.forward(request, response);
	}

}
