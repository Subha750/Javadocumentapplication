package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DaoController 
{
	Connection con=null;
	public DaoController()
	{
		  String classname="com.mysql.jdbc.Driver";
		  String url="jdbc:mysql://localhost:3306/banshiplg";
		  String username="root";
		  String pasword="banshi";
		  try
		  {
			  Class.forName(classname);
			  con=DriverManager.getConnection(url,username,pasword);  
		  }
		  catch(Exception e)
		  {
			  System.out.println(e);
		  }
	}
	
	///Store data means uname and pass in database
	public void create(String uname,String pancard,String mobnumber,String Email,String pword)
	{
		String sql="insert into userdata values(?,?,?,?,?)";
		 
		  try
		  {
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1,uname);
			st.setString(2,pancard);
			st.setString(3,mobnumber);
			st.setString(4,Email);
			st.setString(5,pword);
			st.executeUpdate();
		  }
		  catch(Exception e)
		  {
			  System.out.println(e);
		  }
		  
	}
	
	
	////Update password in database when user forgot password
	
	public void forgot(String pancard,String mobnumber,String pword)
	{
		String sql="update userdata set pword=? where pancard=? and mobnumber=?";
		
		  try
		  {
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(5,pword);
			st.setString(2,pancard);
			st.setString(3,mobnumber);
			st.executeUpdate();
		  }
		  catch(Exception e)
		  {
			  System.out.println(e);
		  }
		  
	}
	
	
	
	///Get data from database when user login from Application
	///for login page
	public boolean get(String Email,String pword)
	  {
		  try
		  {
			  
			  PreparedStatement pst=con.prepareStatement("select * from userdata where Email=? and pword=?");
			  pst.setString(1,Email);///here uname is nothing but pass veriable on method parameter
			  pst.setString(2,pword);
			 
			 ResultSet rs= pst.executeQuery();
			 if(rs.next())
			 {
				 return true;
			 }
			  
		  }
		  catch(Exception e)
		  {
			  System.out.println(e);
		  }
		  return false;
	  }
	
	
	
///After forgot check data then go for next page
	
	public boolean checkforgotData(String pancard,String pword)
	  {
		  try
		  {
			  
			  PreparedStatement pst=con.prepareStatement("select * from userdata where pancard=? and pword=?");
			  pst.setString(1,pancard);///here uname is nothing but pass veriable on method parameter
			  pst.setString(2,pword);
			 
			 ResultSet rs= pst.executeQuery();
			 if(rs.next())
			 {
				 return true;
			 }
			  
		  }
		  catch(Exception e)
		  {
			  System.out.println(e);
		  }
		  return false;
	  }
	
	
	
}
