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
 * Servlet implementation for update item details
 * @author IT19362854 - S.L Abeygunawardana
 */

//@WebServlet("/UpdateItem")
public class UpdateItem extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean chk;
		String EMsg = null;
		
		try 
		{
		//get details from the UpdateItem.jsp from and initialize the values to item objet
		Item item = new Item();
		
		item.setItemId(request.getParameter("HiddenId"));
		item.setItemName(request.getParameter("name"));
		item.setItemPrice(Float.parseFloat(request.getParameter("price")));
		item.setItemQuantity(Integer.parseInt(request.getParameter("qty")));
		item.setSupplier(request.getParameter("supplier"));
		item.setDescription(request.getParameter("des"));
		
		//Add details to database
		InterfaceItemService serviceUpdate = new ItemServiceImpl();
		chk = serviceUpdate.UpdateItem(item);
				
		//check the details are inserted to the database
		if(chk == true)
		{
		EMsg = "Item Details Updated Successfully";
		}
		else
		{
		EMsg = "Error:Can't Update Item Detalis";
		}
		
		}
		
		catch(NumberFormatException e1)
		{
		EMsg = "Error in Data type ItemPrice OR ItemQuantity(Exception)";
		}
		catch(Exception e2)
		{
		EMsg = "Exception Occoured.Please Input Valid Details";
		}
		
		finally
		{
		request.setAttribute("EMessage", EMsg);
		RequestDispatcher dis = request.getRequestDispatcher("DisplayItem.jsp");
		dis.forward(request, response);	
		}
		
	}

}
