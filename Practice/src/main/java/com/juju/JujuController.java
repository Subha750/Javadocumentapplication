package com.juju;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.DaoController;

@Controller
public class JujuController 
{
	DaoController dao=new DaoController();
	
	@RequestMapping("/move")  
    public String relogin()
    {  
    	return "login.jsp";
    }  
	
	//After fail register then relogin
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
	ModelAndView mv=new ModelAndView();
	dao.create(uname, pancard, mobnumber, Email, pword);
	
	
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
		 String Email=req.getParameter("Email");
		 String pword=req.getParameter("pword");
		
		
		
		ModelAndView mv=new ModelAndView();	
		if(dao.get(Email, pword))
		{
			mv.setViewName("result.jsp");
		}
		else
		{
			 mv.setViewName("error.jsp");
		}
		return mv;
	    }  
}
