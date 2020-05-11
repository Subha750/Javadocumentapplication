package com.validation;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailValidation {
	///Email validation 
		///=================================================================================
	
	 final String apikey="c2916a7a2281265fa8e4d4a74f089a8f";

		 public  boolean checkEmail(String email)throws Exception
			{
			 String url="https://apilayer.net/api/check?access_key="+apikey+"&email="+email+"&smtp=1&format=1";
				
				URL BJ=new URL(url);
				HttpURLConnection con=(HttpURLConnection )BJ.openConnection();
				con.setRequestProperty("User-Agent", "Chrome/81.0.4044.138");
				BufferedReader in=new BufferedReader(new InputStreamReader(con.getInputStream()));
				String inputLine;
				StringBuffer response=new StringBuffer();
				while((inputLine=in.readLine())!=null)
				{
					response.append(inputLine);
				}
				in.close();
				String a=response.toString();
				if(a.contains("\"smtp_check\":true"))
				{
				    return true;
				}
				else
				{
					return false;
				}
			}
		 
		 
		 ///PanCard Validation
	///========================================================================================
		 public  boolean CheckPannumber(String pan)
			{
				Pattern pattern = Pattern.compile("[A-Z]{5}[0-9]{4}[A-Z]{1}");

				Matcher matcher = pattern.matcher(pan);
				if (matcher.matches()) 
				{
					return true;
				  
				} 
				else
				{
					return false;
					
				}
			}
		 
		 ///Password validation 
		/// =============================================================
			public boolean checkpassword(String s)
			{
				String regex = "[A-Z]{4}[$&+,:;=?@#|'<>.^*()%!-]{1}[0-9]{3}";
				 
				Pattern pattern = Pattern.compile(regex);
				 
				  Matcher matcher = pattern.matcher(s);
				  if (matcher.matches()) 
					{
						return true;
					  
					} 
					else
					{
						return false;
						
					}
				}
			
		///	Mobile validation ...
			public boolean checkMobile(String s)
			{
				String regex = "^[7-9][0-9]{9}$";
				 
				Pattern pattern = Pattern.compile(regex);
				 
				  Matcher matcher = pattern.matcher(s);
				  if (matcher.matches()) 
					{
					  System.out.println(true);
						return true;
					  
					} 
					else
					{
						System.out.println(false);
						return false;
						
					}
				}	
			
				 
}
