<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
          <td><input type="text" name="pword" /></td>
         </tr>  
         <tr>  
          <td> </td>  
          <td><input type="submit" value="Click To Submit" /></td>  	
         </tr>  
        </table>  
       </form>  
</body>
</html>