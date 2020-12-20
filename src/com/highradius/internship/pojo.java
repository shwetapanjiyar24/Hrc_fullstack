package com.highradius.internship;

public class pojo 
{
	String username;
	String password;
	String user_level;
	
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
	public String getpassword() {
		return password;
	}
	public void setpassword(String password) {
		this.password = password;
	}
	
	public String getLevel(String user_level)
	{
		return user_level;
	}
	public void setLevel(String user_level)
	{
		this.user_level=user_level;
	}

}
