package com.juju;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.DaoController;
import com.validation.EmailValidation;

@Controller
public class JujuController 
{
	EmailValidation emailv=new EmailValidation();
	DaoController dao=new DaoController();
	String Pancards=" ";
	
	@RequestMapping("/move")
    public String relogin()
    {  
    	return "login.jsp";
    }  
	
	//After fail register then relogin
///========================================================================================	
	@RequestMapping("/regmove")  
    public String reregister()
    {  
    	return "registration.jsp";
    }  
	
	
	
	
	
	@RequestMapping("/register")
	 
    public ModelAndView Register(HttpServletRequest req,HttpServletResponse res)
 {  
	String uname=req.getParameter("uname");
	String pancard=req.getParameter("pancard");
	String mobnumber=req.getParameter("mobnumber");
	String Email=req.getParameter("Email");
	String pword=req.getParameter("pword");
	Pancards=pancard;
	ModelAndView mv=new ModelAndView();
	
	
	///Email validation
	
	try
	{
	if(emailv.checkEmail(Email)==true && emailv.CheckPannumber(pancard)==true && emailv.checkpassword(pword)==true && emailv.checkMobile(mobnumber)==true)
	{
		System.out.println("Email successfully validated");
		dao.create(uname, pancard, mobnumber, Email, pword);
	}
	
	}
	catch(Exception e)
	{
		System.out.println("Invalied Email Id");
	}
	
	
	
	if(dao.get(Email,pword))
	{
		String name=uname;
		mv.setViewName("successfullyreg.jsp");
		mv.addObject("data",name);
	}
	
	else
	{
		 mv.setViewName("regfail.jsp");
	}
	return mv;
    }  
	
	
	
	
	
	 @RequestMapping("/login")
	 
	    public ModelAndView Login(HttpServletRequest req,HttpServletResponse res)
	 {  
		 String Email=req.getParameter("email");
		 String pword=req.getParameter("pass");
		
		ModelAndView mv=new ModelAndView();
		if(dao.get(Email, pword))
		{
			mv.setViewName("finalpage.jsp");
		}
		else
		{
			 mv.setViewName("error.jsp");
		}
		return mv;
	    }  
	 ///redirect to fileup jsp page
	 
	 @RequestMapping("/redirectupload")  
	    public String redirectupload()
	    {  
	    	return "fileup.jsp";
	    }  
	 
	 ///Redirect to userlogout page
	 
	 @RequestMapping("/logout")
	    public String redirectlogoutpage()
	    {  
	    	return "userlogout.jsp";
	    }  
	 
	 ///User Forgot the password
	 
	 @RequestMapping("/forGot")
	    public ModelAndView Userforgot(HttpServletRequest req,HttpServletResponse res)
	 {  
		 
		 String pancard=req.getParameter("pancard");
			String mobnumber=req.getParameter("mobnumber");
		 String pword=req.getParameter("pass");
		
		ModelAndView mv=new ModelAndView();
		
		try
		{
		if(emailv.CheckPannumber(pancard)==true && emailv.checkpassword(pword)==true && emailv.checkMobile(mobnumber)==true)
		{
			System.out.println("Forgot data pass from controller in to DAO validated");
			dao.forgot(pancard, mobnumber, pword);
		}
		else
		{
			System.out.println("Wrong format data entry ! please try again");
		}
		
		}
		catch(Exception e)
		{
			System.out.println("Wrong format data entry ! please try again");
		}
		
		
		
		if(dao.checkforgotData(pancard, pword))
		{
			mv.setViewName("login.jsp");
		}
		else
		{
			 mv.setViewName("error.jsp");
		}
		return mv;
	    }  
	 
	 
	 ///File upload in database
///=======================================================================================	 
	 @RequestMapping(value="/fileupload",method=RequestMethod.POST)
	 
	    public ModelAndView upload(@RequestParam("File") CommonsMultipartFile file,HttpSession session)
	 {  
		 System.out.println("bansjsbaDSb");
		 String path=session.getServletContext().getRealPath("/");
		 String filename=file.getOriginalFilename();
		 System.out.println("path"+path+"filename"+filename);
		 try
		 {
			byte barr[]=file.getBytes();
			BufferedOutputStream bout=new BufferedOutputStream(new FileOutputStream(path+"/"+filename));
			Object o=bout;
			bout.write(barr);
			bout.flush();
			bout.close();
		 }
		 catch(Exception e)
		 {
			 System.out.println(e);
		 }
		
		return new ModelAndView("finalpage.jsp");
	 }
	 
 
	 
		  
			 
		
	 
}
