package com.model;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * Class implementation of purchased class
 * @author IT19374666 - D.A.D.Madubashini
 */

public class Purchased extends Cart{


	private int purchasedID;
	private int paymentMethodId;
	private LocalDate Date;
	private LocalTime Time;
	
	
	public Purchased() 
	{
		super();
	}

	public Purchased(String uname, String itemId, int qty, float itmPrice, float totAmount, LocalDate date, LocalTime time) 
	{
		super(uname,itemId,qty,itmPrice,totAmount);
		this.Date = date;
		this.Time = time;
	}

	
	
	public int getPurchasedID() {
		return purchasedID;
	}

	public void setPurchasedID(int purchasedID) {
		this.purchasedID = purchasedID;
	}

	public int getPaymentMethodId() {
		return paymentMethodId;
	}

	public void setPaymentMethodId(int paymentMethodId) {
		this.paymentMethodId = paymentMethodId;
	}

	public LocalDate getDate() {
		return Date;
	}

	public void setDate(LocalDate date) {
		Date = date;
	}

	public LocalTime getTime() {
		return Time;
	}

	public void setTime(LocalTime time) {
		Time = time;
	}
	
	
	
}
