package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation for get item to update
 * @author IT19362854 - S.L Abeygunawardana
 */

//@WebServlet("/GetUpdateItem")
public class GetUpdateItem extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Assign passed id value to a variable
		String ItemID = request.getParameter("HiddenItemID");
		
		//get item details by ItemID
		InterfaceItemService Iservice = new ItemServiceImpl();
		ArrayList<Item> ItmDetails = Iservice.getItems(ItemID);
		

		//send Item details to update page
		request.setAttribute("ItemDetails",ItmDetails);
		RequestDispatcher req = request.getRequestDispatcher("UpdateItem.jsp");
		req.forward(request, response);
	}

}
