<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body>
<h1>Registration Form</h1>
       <form action="register"> 
      	<table >  
         <tr>  
          <td>FullName : </td> 
          <td><input type="text" name="uname"  /></td>
         </tr>  
         <tr>  
          <td>PanCard Number :</td>  
          <td><input type="text" name="pancard" /></td>
         </tr> 
         <tr>  
          <td>Mobile Number :</td>  
          <td><input type="text" name="mobnumber" /></td>
         </tr>
         <tr>  
          <td>Email Id :</td>  
          <td><input type="text" name="Email" /></td>
         </tr>
         <tr>  
          <td>Password :</td>  
          <td><input type="text" name="pword" />[It contains (4 uppper case letter) (1 special ch )and (3 number)]</td>
         </tr> 
         </table>
         <div class="g-recaptcha" data-sitekey="6LcHqPUUAAAAAKPqQuYcWV6dqOevmlVaPHK9-jHk"></div><br>
         <table>
         <tr>  
          <td> </td>  
          <td><input type="submit" value="Click To Submit" /></td>  	
         </tr>  
        </table>  
       </form>  
</body>
</html>