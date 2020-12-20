package com.highradius.internship;

import java.util.Date;
//import java.lang.*;
//import java.text.ParseException;
import java.text.SimpleDateFormat;
public class dtoOrder {
	 

int Order_ID,Customer_ID;
double Order_Amount;
String Customer_Name,Approval_Status,Approved_By,Notes;
Date Order_Date;
//	 String Customer_Name;
//	 String Approval_Status;

	 public Date getDate()throws Exception
	 {
			Date d=new SimpleDateFormat("yyyy-MM-dd").parse("2022-11-30");
			return d;
	 }
	 public int getOrderID()
	 {
		return Order_ID; 
	 }
	 public void setOrderID(int Order_ID)
	 {
		 this.Order_ID = Order_ID;
	 }
	 public int getCustomer_ID()
	 {
		return Customer_ID; 
	 }
	 public void setCustomer_ID(int Customer_ID)
	 {
		 this.Customer_ID = Customer_ID;
	 }
	 public double getOrder_Amount()
	 {
		return Order_Amount; 
	 }
	 public void setOrder_Amount(int Order_Amount)
	 {
		 this.Order_Amount = Order_Amount;
	 }
	public String getCustomer_Name() {
		return Customer_Name;
	}
	public void setCustomer_Name(String Customer_Name) {
		this.Customer_Name = Customer_Name;
	}
	public String getApproval_Status() {
		return Approval_Status;
	}
	public void setApproval_Status(String Approval_Status) {
		this.Approval_Status = Approval_Status;
	}
	
	public String getApproved_By() {
		return Approved_By;
	}
	public void setApproved_By(String Approved_By) {
		this.Approved_By = Approved_By;
	}
	public String getNotes() {
		return Notes;
	}
	public void setNotes(String Notes) {
		this.Notes = Notes;
	}
	public Date getOrder_Date()throws Exception {
		return Order_Date==null?getDate():Order_Date;
	}
	public void setOrder_Date(Date Order_Date) {
		this.Order_Date = Order_Date;
	}

	}

