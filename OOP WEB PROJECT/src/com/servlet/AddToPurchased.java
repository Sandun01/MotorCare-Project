package com.servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Cart;
import com.model.Purchased;
import com.service.CartServiceImpl;
import com.service.PurchasedServiceImpl;
import com.util.CheckTablesUtil;

/**
 * Servlet implementation for purchased
 * @author IT19374666- D.A.D.Madubashini
 */

@WebServlet("/finalPayment")
public class AddToPurchased extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try 
		{
			//check table available in database or create a new one
			boolean res;
			
			//check table is available in database
			res = CheckTablesUtil.checkTableAvailability("purchased");

			if(res == false)
			{
				//if table doesn't exist.
				CheckTablesUtil.CreatePurchasedTable();
			}	
			
		//declaring variables
		float total = 0;
		
		//get values
		int pid = Integer.parseInt(request.getParameter("pid"));
		String uname =request.getParameter("un");
		
		//get cart details for user
		ArrayList<Cart> det = CartServiceImpl.getItemInCart(uname);
		
		//get cart details
		for(Cart c : det)
		{
			String itemId = c.getItemId();
			int qty = c.getQuantity();
			float itmPrice = c.getPrice();
			float totAmount = c.getTotal();
			
			//get total bill amount
			total = total + c.getTotal();
			
			LocalTime time = java.time.LocalTime.now();
			LocalDate date = java.time.LocalDate.now();
			
			Purchased p = new Purchased(uname,itemId,qty,itmPrice,totAmount,date,time);
			
			//add details to purchased table
			PurchasedServiceImpl.AddToPurchased(p,pid);
			
			//update item quantity in cart
			PurchasedServiceImpl.UpdateItemQuantity(itemId,qty);
		}
		
		//delete details from cart
		PurchasedServiceImpl.DeleteAllFromCart(uname);
		
		//get user current balance
		float bal = PurchasedServiceImpl.getUserAccountBalance(pid);
		
		float currentBal = bal - total;
		
		//update user account  balance
		PurchasedServiceImpl.UpdateUserAccountBalance(pid,currentBal);
		
		//set cart count
		HttpSession session = request.getSession();
		int count = CartServiceImpl.CountCartItems(uname);
		session.setAttribute("CartCount", count);
		
		RequestDispatcher rd = request.getRequestDispatcher("PurchasedItems.jsp");
		rd.forward(request, response);
		}
		
		catch(Exception e)
		{
		e.printStackTrace();
		request.setAttribute("Message", "Exception occored in Purchased");
		RequestDispatcher rd = request.getRequestDispatcher("SelectPaymentMethod.jsp");
		rd.forward(request, response);
		}
		
	}

}
