package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.CartServiceImpl;

/**
 * Servlet implementation for update item in cart
 *  @author IT19802022 W.A.L Priyasarani
 */

//@WebServlet("/UpdateCart")
public class UpdateCart extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		//variables
		String EMsg = null ;
		boolean chk = false;
				
		//get item id and username
		String un = request.getParameter("un");
		String id = request.getParameter("Itmid");
		int qty = Integer.parseInt(request.getParameter("qty"));
		float price = Float.parseFloat(request.getParameter("price") );
		float Tamount;	
		
		//check quantity
		chk = CartServiceImpl.CheckQuantity(id,qty);
		
		if(chk == true)
		{
		//calculate total amount
		Tamount = qty * price;

		//update item
		CartServiceImpl.UpdateCartDetails(un,id,qty,Tamount);
		
		}
		
		//quantity exceeded
		else
		{
			EMsg= "Maximum item quantity exceeded.Please enter low quantity";
		}
		
		request.setAttribute("EMessage", EMsg);
		RequestDispatcher dis = request.getRequestDispatcher("cart.jsp");
		dis.forward(request, response);	
		
	}

}
