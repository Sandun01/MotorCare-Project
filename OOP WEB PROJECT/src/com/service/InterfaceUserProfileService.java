package com.service;

import java.util.ArrayList;

import com.model.Customer;

/**
 * interface implementation of Customer class
 * @author IT19374666 - D.A.D.Madubashini
 */

public interface InterfaceUserProfileService {
	
	//Method adding new customer
	public String addCustomer(Customer customer);
	
	//Method get customer details
	public Customer getCustomer(String uname);

	//Update customer details
	public boolean UpdateCustomer(Customer customer);

	//Delete customer 
	public boolean DeleteCustomer(String uname);
	
	
}
