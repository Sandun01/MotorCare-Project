<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Details</title>
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


/*footer begin*/

/*social media icons*/

.foot
{
list-style-type:none;
margin:0;
padding:0;
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

/*end of menue*/

/* end of foooter*/

/*----------------*/
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

/*----------------*/
#logout
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

#logout:hover
{
background-color: #FF0000;
}

#logout
{
float:right;
}

/*------------------*/

/* start Form css*/

input[type=text], select, textarea {
  width: 100%;
  padding: 100px;
  border: 1px solid white;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

.container {
  border-radius: 100px;
  outline-color:blue;
  padding: 10px;
  margin: 70px 400px;
  width:75%;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
  color: #C6FFFF;
  font-family:Monospace;
  font-size:27px;
  
}

.col-75 {
  float: right;
  width: 65%;
  margin-top:10px;
  font-size:27px;
  color: #C6FFFF;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

.title{
color: #FFFF00;
font-family:cursive;
font-size:30px;
text-align:left;

}
.body1{
background-color:#070A67;
}

.button1, .DetailsBtn
{
background-color:#0C9533;
width:40%;
height:30%;
margin:30px;
color:white;
text-align:center;
font-size:25px;
padding:15px 10px;
text-decoration: none;
border-radius:30px;
}

.button1:hover , .DetailsBtn:hover
{
background-color:#ECE81C;
color:#000;
}

/* end Form css*/

</style>

</head>


<body>
<!----------------------------------Start of menue bar--------------------------------->

<!-- Validate session------------------------------------------ -->
<%
//variables
	String un = null;
	
//validate session
if(session.getAttribute("un") == null)
{	
	response.sendRedirect("CustomerLogin.jsp");
}
else
{
	un = (String)session.getAttribute("un");	
}
%>
<div class="all" style="display:flex">
<img src="Pictures/logo.jpg"  width="500px" height="300" style="flex: 0.75; margin-left:30%;">
<div class="par" style="background-color:#FFFBCB; flex: 0.5; padding:20px; margin-left:10%; font-family:verdana;">
<img src="Pictures/profile.png" >
<h1>SIGN IN AS:<%=session.getAttribute("un") %></h1>

</div></div>

<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><a class="nav" href="Home.jsp">HOME</a></li>
<li class="list1"><a class="nav" href="Services.jsp">SERVICES & ITEMS</a></li>

<div class= "dropbox">
<li class="list1"><a class="nav">BOOK APPOINTMENT</a>

<div class = "droplist">

<a href="BookAppointment.jsp">BOOK A NEW APPOINTMENT</a>
<a href="Appointment.jsp">VEIW APPOINTMENTS</a>

</div>
</li>
</div>

<li class="list1"><a class="nav" href="AboutUs.jsp">ABOUT US</a></li>
<li class="list1"><a class="nav" href="ContactUs.jsp">CONTACT US</a></li>

</ul>

<!---Sub Menue(Cart,Profile)--->

<%
//get count
	int count = 0;//(Integer)session.getAttribute("CartCount");
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
<input type= "submit" value="LOGOUT" id="logout">
</form>


</div>

<!--end of Sub Menue(Cart,Profile)-->

<!--end of menue bar-->

<div class="body1">

<c:forEach var="pay" items="${paymentDetails}" >

<div class="container">
  	<br>
  	<div class= "title">
	<h2>Display Payment Details</h2>
	</div>
  	<br>

	<div class="row">
    <div class="col-25">
    <label>Full Name</label>
    </div>
    <div class="col-75">
    <label>${pay.fName} ${pay.lName}</label>
    </div>
  	</div>
  	<br>
  	
  	<div class="row">
    <div class="col-25">
    <label>Email</label>
    </div>
    <div class="col-75">
    <label>${pay.email}</label>
    </div>
  	</div>
  	<br>
  	
  	<div class="row">
    <div class="col-25">
    <label>Phone Number</label>
    </div>
    <div class="col-75">
    <label>${pay.phoneNo}</label>
    </div>
  	</div>
  	<br>
  	
  	<div class="row">
    <div class="col-25">
    <label>Card Number</label>
    </div>
    <div class="col-75">
    <label>${pay.cardNo}</label>
    </div>
  	</div>
  	<br>
  	
  	<div class="row">
    <div class="col-25">
    <label>Card Expire Details</label>
    </div>
    <div class="col-75">
    <label>${pay.year}</label>
    </div>
  	<div class="col-75">
    <label>${pay.month}</label>
    </div>
    <div class="row">
    </div>
  	<br>
  	
  	
  	<div class="row">
    <div class="col-25">
    <label>CVV</label>
    </div>
    <div class="col-75">
    <label>${pay.cvv}</label>
    </div>
  	</div>
  	<br>
  	
  	<div class="row">
    <div class="col-25">
    <label>Country</label>
    </div>
    <div class="col-75">
    <label>${pay.country}</label>
    </div>
  	</div>
  	<br>
	
	
	<div class="row">
    <div class="col-25">
    <label>Address 1</label>
    </div>
    <div class="col-75">
    <label>${pay.address1}</label>
    </div>
  	</div>
  	<br>
  	
  	<div class="row">
    <div class="col-25">
    <label>Address 2</label>
    </div>
    <div class="col-75">
    <label>${pay.address2}</label>
    </div>
  	</div>
  	<br>
  	
  	<div class="row">
    <div class="col-25">
    <label>City</label>
    </div>
    <div class="col-75">
    <label>${pay.city}</label>
    </div>
  	</div>
  	
  	<div class="row">
    <div class="col-25">
    <label>Balance:</label>
    </div>
    <div class="col-75">
    <label>${pay.balance}</label>
    </div>
  	</div>
  	
</div>
</div>

<div class="payCard" style="background-color:#FDE4FF; margin-right:30%; margin-left:10%; padding:20px; font-family:Arial; border-radius:30px;">

<h2 style="color:#611811; font-size:40px;">Edit Details</h2>

<a href="PaymentMethods.jsp" class="button1">View All Methods</a>

<br><br><br>
<form action="deletePaymentDetails" method="post">
<input type="hidden" name="pid" value="${pay.pID}">
<input type ="submit" value="Delete Method" class="DetailsBtn">
</form>

<form action="SendPaymentIDUpdate" method="post">
<input type="hidden" name="pid" value="${pay.pID}">
<input type ="submit" value="Update Method" class="DetailsBtn">
</form>

</div>

</c:forEach>
</div>

<footer id='footer1'>

<div class="foot">

<div class="socialmedia">
<a class="socialmedia1" href="https://www.facebook.com"><i class="fab fa-facebook-square fa-2x"></i></a>

<a class="socialmedia1" href="https://www.instagram.com"><i class="fab fa-instagram fa-2x"></i></a>
<a class="socialmedia1" href="https://twitter.com/login"><i class="fab fa-twitter-square fa-2x"></i></a>
<a class="socialmedia1" href="https://www.google.com/intl/si/gmail/about/#"><i class="fab fa-google-plus-square fa-2x"></i></a>
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