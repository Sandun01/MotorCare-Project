<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Add Appointment</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>
/* Home page*/

/*top menue, nav bar*/
.nav2
{
list-style-type:none;
margin:0;
padding:0;
}

.nav1
{
list-style-type:none;
margin:0;
padding:0;
overflow: hidden;
background-color: #000;
}

/* nav bar Main Menue*/
li.list1
{
float:left;
}

li a.nav
{
display:block;
color:white;
text-align:center;
font-size:25px;
padding:13px 16px;
text-decoration: none;

}

.nav:hover
{
background-color:#0B70EC;
}

.activeHome
{
background-color: #121996;
}

/* appointment droplist*/
.droplist
{
display: none;
position: absolute;
background-color:#f1f1f1;
min-width: 200px;
z-index: 1;
font-size:25px;
}

.droplist a
{
color: black;
padding: 12px 16px;
text-decoration: none;
display: block;
}

.droplist a:hover
{
background-color: #0B70EC;
}

.dropbox:hover .droplist
{
display: block;
}

/*profile dropdown list*/
.droplistprof
{
display: none;
position: absolute;
background-color:#f1f1f1;
min-width: 50px;
z-index: 1;
font-size:25px;
}

.droplistprof a
{
color: black;
padding: 12px 16px;
text-decoration: none;
display: block;
}
.droplistprof a:hover
{
background-color: #0B70EC;
}

.dropboxprof:hover .droplistprof
{
display: block;
}

/*end profile dropdown list*/

/* nav bar profile*/
.profile
{
float:right;
padding: 6px 10px;
margin-top: 1px;
margin-right: 5px;
}

.profile .profile1:hover
{
background:#0B70EC;
}

.profile1
{
display:block;
color:white;
font-size:20px;
text-decoration: none;

}

/* nav bar Cart*/
.cart
{
float:right;
padding: 6px 10px;
margin-top: 1px;
margin-right: 0px;
}

.cart .cart1:hover
{
background:#0B70EC;
}

.cart1
{
display:block;
color:white;
font-size:20px;
text-decoration: none;
}

input[type=submit]
{
background-color: #9D2929;
color: white;
padding: 13px;
border: none;
border-radius: 3px;
cursor: pointer;
font-size: 25px;
font-family: timesNewRoman;
}

input[type=submit]:hover
{
background-color: #FF0000;
}

.logout
{
float:right;
}

/* sub menue*/
.nav3
{
float: right;
list-style-type:none;
margin:0;
padding:0;
}

li.list2
{
float:left;
}

.Text1
{
float:right;
padding: 6px 10px;
margin-top: 1px;
margin-right: 0px;
}

.Text1 .Text2:hover
{
background:#CC0808;
}

.Text2
{
display:block;
color:white;
font-size:20px;
text-decoration: none;
}


/* End top menue*/
/*Form begin*/

body
{
  background-image: url('Pictures/interfaceBakcground.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}


*{
	margin:0;
	padding:0;
}
p{
	text-align:left;
	font-size:60px;

}
img{
	
vertical-align: l;
}


.Hetext{

	text-align:left ;
	text-shadow: 2px 2px 5px blue;
	padding:10px;
	font-size:70px;

}
h2{

	text-align:center;
	padding:20px;
	color:#A9A9A9;
	font-size:40px;

}
.appointment{
	background:	#6495ED;
	width:550px;
	margin: 0px 0px 0px 430px;
	color:white;
	font-size:18px;
	padding:20px;
	border-radius: 30px;
	margin-left:800px;   
	border: 2px solid ash;
	transform: translate(-50%,-5%);
	background: rgba(0,0,0,0.8);
	text-align:center;
	top: 10000px;
	

}

#appointment{
	margin-left:50px; 
	

}
label{
	color:#F0FFFF;
	font-family:sans-serif;
	font-size:18px;
	font-style:italic;
    margin-left:-400px;  


}
#j{
	margin-left:-500px;  
	

}
#name{

	width:300px;
	border:none;
	border-radius:10px;
	outline:0;
	padding:7px;
	 
	
	
}
#num{

	width:150px;
	border:none;
	border-radius:10px;
	outline:0;
	padding:7px;


}



#ph{
	width:100px;
	padding:5px;
	border:none;
	border-radius:10px;
	outline:0;
}

#sub {
  width: 100%;
  background-color: 	#191970;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

#sub:hover {
  background-color:#483D8B;
}
input[type=text], select {
  width: 150px;
  padding: 10px 15px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 10px;
  box-sizing: border-box;
  border: 2px solid ash;
}


.column.side {
  position:center;
  
}


/*End Form*/
/*footer begin*/

/*social media icons*/

.foot
{
list-style-type:none;
margin:0;
padding:20;
overflow: hidden;
background-color: #000;
}

.socialmedia1
{
float:left;
padding: 6px 10px;
margin-top: 1px;
margin-left: 5px;

display:block;
color:white;
font-size:20px;
text-decoration: none;

}

.socialmedia .socialmedia1:hover
{
background:#307C03;
}

/*end of social media icons*/


/*menue*/
.nav3
{
float: right;
list-style-type:none;
margin:0;
padding:0;
}

li.list2
{
float:left;
}

/*end of menue*/

/* end of foooter*/


</style>


</head>
<body>
<!----------------------------------Start of menue bar--------------------------------->

<!-- Validate session------------------------------------------ -->
<%
//validate session
if(session.getAttribute("un") != null)
{	
%>
<div class="all" style="display:flex">
<img src="Pictures/logo.jpg"  width="500px" height="300" style="flex: 0.75; margin-left:30%;">
<div class="par" style="background-color:#FFFBCB; flex: 0.5; padding:20px; margin-left:10%; font-family:verdana;">
<img src="Pictures/profile.png" ><br>
<h1>SIGN IN AS:<%=session.getAttribute("un") %></h1>

</div></div>
<% 
} 
else
{
%>  
 
<center><img src="Pictures/logo.jpg"  width="500px" height="300"></center>
  
<%
}
%>  

<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><a class="nav" href="Home.jsp">HOME</a></li>
<li class="list1"><a class="nav" href="Services.jsp">SERVICES & ITEMS</a></li>

<div class= "dropbox">
<li class="list1"><a class="nav">BOOK APPOINTMENT</a>

<div class = "droplist">

<div class="activeHome"><a href="BookAppointment.jsp">BOOK A NEW APPOINTMENT</a></div>
<a href="Appointment.jsp">VEIW APPOINTMENTS</a>

</div>
</li>
</div>

<li class="list1"><a class="nav" href="AboutUs.jsp">ABOUT US</a></li>
<li class="list1"><a class="nav" href="ContactUs.jsp">CONTACT US</a></li>

</ul>

<!---Sub Menue(Cart,Profile)--->

<!-- Validate session------------------------------------------ -->
<%
//validate session
if(session.getAttribute("un") != null)
{
	int count = (Integer)session.getAttribute("CartCount");
%>

<!-- Cart -->
<div class="cart"><div class="activeHome">
<a class="cart1" href="cart.jsp">Cart <font style="color:red; background-color:#FFF829;"><%=count %></font><i class="fas fa-shopping-cart fa-2x"></i></div>
</a>
</div>

<!-- profile -->

<div class="Text1">
<a class="Text2" href="UserProfile.jsp">User Profile<i class="fas fa-user-circle fa-2x"></i></a>
</div>

<form method="post" action="CustomLogOut">
<input type= "submit" value="LOGOUT" class="logout">
</form>

<% }
	
else
{
%>

<!-- End show Session active -->

<div class="profile">

<div class= "dropboxprof">

<div class="profile1">UserProfile<i class="fas fa-user-circle fa-2x"></i></div>

<div class = "droplistprof">

<!-- 
<a href="UserProfile.jsp">View Profile</a>  -->

<a href="Registration.jsp">Sign Up</a>
<a href="CustomerLogin.jsp">Sign In</a>
</div>

</div>

</div>

<% } %>

</div>

<!--end of Sub Menue(Cart,Profile)-->
<!--end of menue bar-->

<br><br>


<br><br>

<center>
	<div class = "column side">
	<h1 class="Hetext"> Service At Your Finger Tips </h1>
		<p>Online Service Booking</p>
		
		
	</div>
		<div class = "appointment">
		<form method = "post" id = "appointment" action = "add">
		<div class = "l">
			<h2>Book A Service Here </h2>
			<div class = "j"><label> First Name  </label></div>
			<input type = "text" name = "FName" id = "name" placeholder= "First name" required><br><br>
			<div class = "j"><label> Last Name  </label></div>
			<input type = "text" name = "LName" id = "name" placeholder= "Last name" required><br><br>
			<div class = "j"><label> Email  </label></div>
			<input type = "email" name = "Email" id = "name" placeholder= "Email...." required><br><br>
			<div class = "j"><label> Phone Number  </label></div>
			<select id ="ph">
				<option>+91</option>
				<option>+92</option>
				<option>+93</option>
				<option>+94</option>
				<option>+95</option>
			</select>
			<input type = "number" name = "PhoneNumber" id ="num" placeholder= "Phone Number" required><br><br>
			
			<div class = "j"><label> Prefered Date  </label></div>
			
			<input type="text" name = "PreferedDate" id = "name" placeholder="prfered date"><br><br>
			
			<div class = "j"><label> Prefered Location  </label></div>
			<select id="PreferedLocation" name="PreferedLocation" id = "name" required><br><br>
				<option value="colombo">Colombo</option>
				<option value="galle">Galle</option>
				<option value="jaffna">Jaffna</option>
			</select>
			<br><br>
			<div class = "j"><label> Vehicle Registration number  </label></div>
			<input type = "text" name = "VehicleNo" id = "name" placeholder = "Vehicle number..." required><br><br>
		
			<input type = "submit" value = "Submit" id="sub">
			</div>
		</form>
		</div>

</center>


<br><br>

<!--footer begin--->

<footer id='footer1'>

<div class="foot">

<div class="socialmedia">
<a class="socialmedia1" href="https://www.facebook.com"><i class="fab fa-facebook-square fa-2x"></i></a>

<a class="socialmedia1" href="https://www.instagram.com"><i class="fab fa-instagram fa-2x"></i></a>
<a class="socialmedia1" href="https://twitter.com/login"><i class="fab fa-twitter-square fa-2x"></i></a>
<a class="socialmedia1" href="https://www.google.com/intl/si/gmail/about/#"><i class="fab fa-google-plus-square fa-2x"></i></i></a>
<a class="socialmedia1" href="https://www.whatsapp.com"><i class="fab fa-whatsapp-square fa-2x"></i></a>
</div>

<ul class="nav3">
<li class="list2"><a class="nav" href="Home.jsp">HOME</a></li>
<li class="list2"><a class="nav" href="Services.jsp">SERVICES & ITEMS</a></li>
<li class="list2"><a class="nav" href="AboutUs.jsp">ABOUT US</a></li>
<li class="list2"><a class="nav" href="ContactUs.jsp">CONTACT US</a></li>
</ul>

</div>

</footer>

<!--footer End--->

</body>
</html>

