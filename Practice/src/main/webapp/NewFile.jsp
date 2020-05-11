<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<link href="https://fonts.googleapis.com/css2?family=Jost:wght@600&display=swap" rel="stylesheet">
<style>

body{
	background-color:#f5efed;
}
.container{
font-family: 'Jost', sans-serif;
text-align:center;
font-size:15px;
border: 1px solid white;
padding:10px 10px;
background-color:#f5a742;
margin:15% auto
}
.header{
font-size:20px;
}
input[type="submit"] {
    background-color: blue;
    border: none;
    color: white;
    padding: 10px 20px;
    text-transform: uppercase;
}
.margin{
margin:0 auto;
max-width:50%
}
.labels{
margin: 20px;}
</style>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body>
<div class="container margin">
<h1 class="header">LOGIN FORM</h1>
	<form action="login">
		<div class="labels">
		<label for="email">UserName/Email:<input type="text" required placeholder="Email Id" name="email" /></label>
		</div>
		<div class="labels">
		<label for="pass">Password:<input type="password" required placeholder="Password" name="pass" /></label>
		<p>[It contains (4 uppper case letter) (1 special ch )and (3 number)]</p>
		</div>
		<div class="g-recaptcha margin" data-sitekey="6LcHqPUUAAAAAKPqQuYcWV6dqOevmlVaPHK9-jHk"></div><br>
		<input type="submit" value="Login" />
	</form>
</div>
</body>
</html>