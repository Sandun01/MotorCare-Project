package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.service.CartServiceImpl;
import com.util.CheckTablesUtil;

/**
 * Servlet implementation add item to cart
 * @author IT19802022 W.A.L Priyasarani
 */

//@WebServlet("/AddToCartItem")
public class AddToCartItem extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//variables
		String msg = null;
		boolean result;
		boolean chkT;
					
		//check table available in database
		chkT = CheckTablesUtil.checkTableAvailability("cart");
							
		//if table not available in the database create a new table	
		if(chkT == false)
		{
			CheckTablesUtil.CreateCartTable();
		}
		
		try
		{
		//get item id and username
		String un = request.getParameter("un");
		String id = request.getParameter("ItmId");
		float price = Float.parseFloat(request.getParameter("price"));
		
		//check already item exists in cart
		result = CartServiceImpl.CheckCart(un, id);
		
			if(result == false)
			{
			//add details to cart
				CartServiceImpl.AddToCart(un, id, price);
				
				//create session
				HttpSession session = request.getSession();
				int count = CartServiceImpl.CountCartItems(un);
				session.setAttribute("CartCount", count);
				
			}
			else
			{
				msg = "Item already exist in cart";
			}
		}
		
		catch(Exception e)
		{
			msg = "Exception Occured";
		}
		
		request.setAttribute("EMessage", msg);
		RequestDispatcher dis = request.getRequestDispatcher("Services.jsp");
		dis.forward(request, response);
		
	}

}
