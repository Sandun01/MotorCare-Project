package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.PurchasedServiceImpl;

/**
 * Servlet implementation for delete purchased item
 * @author IT19374666- D.A.D.Madubashini
 */

@WebServlet("/deleteFromPurchased")
public class DeleteFromPurchased extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//get id
		int id = Integer.parseInt(request.getParameter("id"));
		
		//delete item
		PurchasedServiceImpl.deletePurchasedItem(id);
		
		RequestDispatcher rd = request.getRequestDispatcher("PurchasedItems.jsp");
		rd.forward(request, response);
		
	}

}
