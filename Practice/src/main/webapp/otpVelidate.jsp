<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}
/* The Modal (background) */
.modal fade {
	display: display; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: blue /*rgb(0, 0, 0); /* Fallback color */ 
	 padding-top: 60px;
}

.modal-content {
	background-color: #b5d145;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered #fefefe*/
	/*border: 1px solid #333;*/
	width: 60%;
	Could
	be
	more
	or
	less,
	depending
	on
	screen
	size
}

/* Full-width input fields */
input[type=text] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #f5df18;
	color: black;
	padding: 10px 18px;
	margin: 8px 0;
	border: #2a8dde;
	cursor: pointer;
	width: 30%;
}

button:hover {
	opacity: 0.30;
}

/* Extra styles for the cancel button */

/* Center the image and position the close button */
.imgcontainer {
	text-align: curner;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}
/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 60s;
	animation: animatezoom 70s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>

</head>
<body>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">OTP Validation</h4>
				</div>
				<div class="modal-body">
					<form action="otpvalidate">

						<input type="number" placeholder="Enter OTP" name="otp" required><br>
						<button type="submit">Validate</button>

					</form>
					Please Enter your OTP before Validate.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<!--  <button type="button" class="btn btn-primary">Save changes</button>-->
				</div>
			</div>
		</div>
	</div>



	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script
		src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		//Call the method on pageload
		$(window).load(function() {
			//Disply the modal popup
			$('#myModal').modal('show');
		});
	</script>
</body>
</html>