package com.model;

/**
 * Class implementation appointment
 * @author IT19802022 W.A.L Priyasarani
 */


public class Appointment {

	private String Fname;
	private String Lname;
	private String Email;
	private String phonenumber;
	private String preferedDate;
	private String preferedLocation;
	private String vehicleNo;
	
	
	
	
	public String getFname() {
		return Fname;
	}
	public void setFname(String fname) {
		Fname = fname;
	}
	public String getLname() {
		return Lname;
	}
	public void setLname(String lname) {
		Lname = lname;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getPreferedDate() {
		return preferedDate;
	}
	public void setPreferedDate(String preferedDate) {
		this.preferedDate = preferedDate;
	}
	public String getPreferedLocation() {
		return preferedLocation;
	}
	public void setPreferedLocation(String preferedLocation) {
		this.preferedLocation = preferedLocation;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	
	
	
}
