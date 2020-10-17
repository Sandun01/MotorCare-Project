package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.CartServiceImpl;

/**
 * Servlet implementation for delete item from cart
 *  @author IT19802022 W.A.L Priyasarani
 */

//@WebServlet("/DeleteCartItem")
public class DeleteCartItem extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//variables
		String EMsg;
		boolean result;
		
		//get item id and username
		String un = request.getParameter("un");
		String id = request.getParameter("Itmid");
		
		//delete item
		result = CartServiceImpl.DeleteFromCart(un,id);
		
		//check sucessfully deleted
		if(result == true)
		{
			EMsg= "Item Successfully removed from the cart";
			//create session
			HttpSession session = request.getSession();
			int count = CartServiceImpl.CountCartItems(un);
			session.setAttribute("CartCount", count);
		}
		
		else
		{
			EMsg= "Error in removing item";
		}
		
		request.setAttribute("EMessage", EMsg);
		RequestDispatcher dis = request.getRequestDispatcher("cart.jsp");
		dis.forward(request, response);
		
	}

}
