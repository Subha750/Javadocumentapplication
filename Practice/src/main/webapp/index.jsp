<!DOCTYPE html>
<html>
<head>
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial;
  padding: 10px;
  background-image: url("https://www.accountingprose.com/wp-content/uploads/2017/08/technical-banner-02.jpg");
	background-repeat: no-repeat
}
/* Header/Blog Title */
.header {
  padding: 30px;
  text-align: center;
  background: transparent;
}

.header h1 {
  font-size: 50px;
}

/* Style the top navigation bar */
.topnav {
  overflow: hidden;
  background-color: #333;
}

/* Style the topnav links */
.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: blue;
}

/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
  float: left;
  width: 75%;
}

/* Right column */
.rightcolumn {
  float: left;
    width: 25%;
    background-color: #7BAFD4;
    padding-left: 20px;
    box-shadow: 10px 10px 8px 10px #000000;
}

/* Fake image */
.fakeimg {
  
  width: 100%;
  padding: 20px;
}

/* Add a card effect for articles */
.card {
  background-color: transparent;
  /*padding: 20px;
  margin-top: 20px;*/
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Footer */
.footer {
  padding: 20px;
  text-align: center;
  background: #ddd;
  margin-top: 20px;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
  .leftcolumn, .rightcolumn {   
    width: 100%;
    padding: 0;
  }
}

/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
  .topnav a {
    float: none;
    width: 100%;
  }
  
  
  
}
</style>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  display: flex;
  justify-content: space-between;
}

li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;s
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>

<div class="header">
  <h1>JAVA TECHNO</h1>
  <p>Java Programming for Complete Beginners.</p>
</div>

<ul>
  <div>
  <li><a href="#home">Home</a></li>
  <li><a href="#news">Help</a></li>
  </div>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn" >Settings</a>
    <div class="dropdown-content">
      <a href="login.jsp">Login</a>
      <a href="registration.jsp">Register 2</a>
      <a href="websiteabout.jsp">About</a>
    </div>
  </li>
</ul>

<div class="row">
  <div class="leftcolumn">
    <div class="card">
      <h2>JAVA END TO END</h2>
      <h5>Date of start, May 20, 2020</h5>
      <div class="fakeimg">
      <img src="https://www.seekpng.com/png/detail/366-3666618_hire-java-developer-hire-e-commerce-developer.png" width="250px">
      </div>
      <p>Take it..</p>
      <p>Java is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible. It is intended to let application developers write once, run anywhere (WORA).</p>
    </div>
    <div class="card">
      <h2>Setting Up and Getting Started in Java Programming</h2>
      <h5>Title description, Sep 2, 2017</h5>
      <div class="fakeimg">
      <img src="https://c7.uihere.com/files/825/288/968/web-development-service-web-design-accounting-computer.jpg" width="400px">
      </div>
      <p>Only for you...</p>
      <p>Learn Java Programming with 100+ code examples. For Absolute Java Beginners! Start Learning Java Programming Now!</p>
    </div>
  </div>
  <div class="rightcolumn">
    <div class="card">
      <h2>About Me</h2>
      <div class="fakeimg" style="height:100px;">Image</div>
      <p>Our aim is to improve the java knowledge of beginners. </p>
    </div>
    <div class="card">
      <h3>Website Details</h3>
      <div class="fakeimg"><p>Image</p></div>
      <div class="fakeimg"><p>Image</p></div>
      <div class="fakeimg"><p>Image</p></div>
    </div>
    <div class="card">
      <h3>Follow Me</h3>
      <p>click here...!!</p>
    </div>
  </div>
</div>


</body>
</html>
