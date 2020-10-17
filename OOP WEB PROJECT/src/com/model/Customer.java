package com.model;

/**
 * Class implementation of Customer class
 * @author IT19374666 - D.A.D.Madubashini
 */

public class Customer {
	private String lname;
	private String fname;
	private String username;
	private String gender;
	private String email;
	private String password;
	
	
	public void setFirstName(String fname) {
		this.fname = fname;
	}
	
	public void setLastName(String lname) {
		this.lname = lname;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public void setEmail(String email) {
		this.email = email ;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	public String getFirstName() {
		return fname;
	}
	
	public String getLastName() {
		return lname;
	}
	
	public String getUsername() {
		return username;
	}
	
	
	public String getGender() {
		return gender;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPassword() {
		return password;
	}
	
	
	

	
}

