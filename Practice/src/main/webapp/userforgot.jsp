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
<title>Forgot Form</title>
<script src="https://www.google.com/recaptcha/api.js"></script>
</head>
<body>
<div class="container margin">
<h1 class="header">Forgot Password</h1>
	<form action="forGot">
		<div class="labels">
		<label for="pancard">PanCard:<input type="text" required placeholder="Pan Card" name="pancard" /></label>
		<p>[It contains (5 upper case letter) (4 number )and (1uppper case letter )]</p>
		</div>
		<div class="labels">
		<label for="mobnumber">Mobile_no:<input type="text" required placeholder="Mobile no" name="mobnumber" /></label>
		
		</div>
		<div class="labels">
		<label for="pass">New Password:<input type="password" required placeholder="Password" name="pass" /></label>
		</div>
		<input type="submit" value="Forgot password" />
	</form>
</div>
</body>
</html>