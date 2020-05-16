<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://www.google.com/recaptcha/api.js"></script>
<style>
body {
	font-family: Arial;
	padding: 10px;
	background-image:
		url("https://www.canva.com/learn/wp-content/uploads/2015/12/blog-header-design.jpg");
	background-repeat: no-repeat
}

.container_header {
	color: dark black;
	text-align: center;
}
/* Style all input fields */
input {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
}

.inputlabel {
	width: 40%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	margin-top: 6px;
	margin-bottom: 16px;
	color: #ba0f59
}
/* Style the submit button */
input[type=submit] {
	background-color: #4CAF50;
	color: white;
	text-align: center;
	width: 10;
}

/* Style the container for inputs */
.container {
	background-color: #8c8416;
	padding: 30px;
	width: 60;
	/*padding: 30px;*/
	/* text-align: center;*/
	background: transparent;
}

/* The message box is shown when the user clicks on the password field */
#message {
	display: none;
	background: #f1f1f1;
	color: #000;
	position: relative;
	padding: 20px;
	margin-top: 10px;
}

#message p {
	padding: 10px 35px;
	font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
	color: green;
}

.valid:before {
	position: relative;
	left: -35px;
	content: "Correct";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
	color: red;
}

.invalid:before {
	position: relative;
	left: -35px;
	content: "Wrong";
}
</style>
</head>
<body>
	<div class="container_header">
		<h3>Registration Form</h3>
		<p>Try to submit the form.</p>
	</div>

	<div class="container">
		<form action="register">
			<div class="inputlabel">
				<label for="usrname">UserName</label> <input type="text"
					id="usrname" name="uname" placeholder="User Name" required>
				<label for="pancard">PanCard</label> <input type="text" id="pancard"
					name="pancard" placeholder="Pancard no" required> <label
					for="mobnumber">Mobile No</label> <input type="text" id="mobnumber"
					name="mobnumber" placeholder="Mobile No" required> <label
					for="Email">Email Id</label> <input type="text" id="Email"
					name="Email" placeholder="Email Id" required> <label
					for="psw">Password</label> <input type="password" id="psw"
					placeholder="Password" name="psw"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
					required>

				<div class="g-recaptcha"
					data-sitekey="6LcHqPUUAAAAAKPqQuYcWV6dqOevmlVaPHK9-jHk"></div>
				<br> <input type="submit" value="Sign Up">
			</div>
		</form>
	</div>
	<div class="container signin">
		<p>
			Already have an account? <a href="login.jsp">Login</a>.
		</p>
	</div>
	<div id="message">
		<h3>Password must contain the following:</h3>
		<p id="letter" class="invalid">
			A <b>lowercase</b> letter
		</p>
		<p id="capital" class="invalid">
			A <b>capital (uppercase)</b> letter
		</p>
		<p id="number" class="invalid">
			A <b>number</b>
		</p>
		<p id="length" class="invalid">
			Minimum <b>8 characters</b>
		</p>
	</div>

	<script>
		var myInput = document.getElementById("psw");
		var letter = document.getElementById("letter");
		var capital = document.getElementById("capital");
		var number = document.getElementById("number");
		var length = document.getElementById("length");

		// When the user clicks on the password field, show the message box
		myInput.onfocus = function() {
			document.getElementById("message").style.display = "block";
		}

		// When the user clicks outside of the password field, hide the message box
		myInput.onblur = function() {
			document.getElementById("message").style.display = "none";
		}

		// When the user starts to type something inside the password field
		myInput.onkeyup = function() {
			// Validate lowercase letters
			var lowerCaseLetters = /[a-z]/g;
			if (myInput.value.match(lowerCaseLetters)) {
				letter.classList.remove("invalid");
				letter.classList.add("valid");
			} else {
				letter.classList.remove("valid");
				letter.classList.add("invalid");
			}

			// Validate capital letters
			var upperCaseLetters = /[A-Z]/g;
			if (myInput.value.match(upperCaseLetters)) {
				capital.classList.remove("invalid");
				capital.classList.add("valid");
			} else {
				capital.classList.remove("valid");
				capital.classList.add("invalid");
			}

			// Validate numbers
			var numbers = /[0-9]/g;
			if (myInput.value.match(numbers)) {
				number.classList.remove("invalid");
				number.classList.add("valid");
			} else {
				number.classList.remove("valid");
				number.classList.add("invalid");
			}

			// Validate length
			if (myInput.value.length >= 8) {
				length.classList.remove("invalid");
				length.classList.add("valid");
			} else {
				length.classList.remove("valid");
				length.classList.add("invalid");
			}
		}
	</script>

</body>
</html>
