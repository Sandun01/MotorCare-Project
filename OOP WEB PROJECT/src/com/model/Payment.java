package com.model;

/**
 * Class implementation Payment class
 * @author IT19804316 R.M.K.D.Kumarasiri
 */


public class Payment {
	
	int pID;
	String fName;
	String lName;
	String email;
	String phoneNo;
	String cardNo;
	int year;
	String month;
	int Cvv;
	String Country;
	String Address1;
	String Address2;
	String city;
	String Username;
	float balance;
	
	public Payment()
	{
		super();
	}
	
public Payment(int pID,String Username, String fName, String lName, String email, String phoneNo, String cardNo, int year,
		String month, int cvv, String country, String address1, String address2, String city,float balance) 
{
	this.pID = pID;
	this.Username = Username;
	this.fName = fName;
	this.lName = lName;
	this.email = email;
	this.phoneNo = phoneNo;
	this.cardNo = cardNo;
	this.year = year;
	this.month = month;
	this.Cvv = cvv;
	this.Country = country;
	this.Address1 = address1;
	this.Address2 = address2;
	this.city = city;
	this.balance = balance;
}


public float getBalance() {
	return balance;
}



public void setBalance(float balance) {
	this.balance = balance;
}

public int getpID() {
	return pID;
}

public void setpID(int pID) {
	this.pID = pID;
}

public String getfName() {
	return fName;
}

public void setfName(String fName) {
	this.fName = fName;
}

public String getlName() {
	return lName;
}

public void setlName(String lName) {
	this.lName = lName;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPhoneNo() {
	return phoneNo;
}

public void setPhoneNo(String phoneNo) {
	this.phoneNo = phoneNo;
}

public String getCardNo() {
	return cardNo;
}

public void setCardNo(String cardNo) {
	this.cardNo = cardNo;
}

public int getYear() {
	return year;
}

public void setYear(int year) {
	this.year = year;
}

public String getMonth() {
	return month;
}

public void setMonth(String month) {
	this.month = month;
}

public int getCvv() {
	return Cvv;
}

public void setCvv(int cvv) {
	Cvv = cvv;
}

public String getCountry() {
	return Country;
}

public void setCountry(String country) {
	Country = country;
}

public String getAddress1() {
	return Address1;
}

public void setAddress1(String address1) {
	Address1 = address1;
}

public String getAddress2() {
	return Address2;
}

public void setAddress2(String address2) {
	Address2 = address2;
}

public String getCity() {
	return city;
}

public void setCity(String city) {
	this.city = city;
}

public String getUsername() {
	return Username;
}

public void setUsername(String username) {
	Username = username;
}


}
