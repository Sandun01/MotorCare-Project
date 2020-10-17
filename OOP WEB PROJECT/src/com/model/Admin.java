package com.model;

/**
 * Class implementation Admin class
 * @author IT19362854 - S.L Abeygunawardana
 */
public class Admin {
	
	private String username;
	private String password;
	private String post;
	private String name;	
	private String email;
	private String phone;

	
	
	public Admin()
	{
		super();
	}

	public Admin(String username, String password, String post, String name, String email, String phone) 
	{
		super();
		this.username = username;
		this.password = password;
		this.post = post;
		this.name = name;
		this.email = email;
		this.phone = phone;
	}

	public void setUsername(String username) 
	{
		this.username = username;
	}
	
	public void setPassword(String password) 
	{
		this.password = password;
	}
	
	public String getUsername()
	{
		return username;
	}
	
	public String getPassword()
	{
		return password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	
}
