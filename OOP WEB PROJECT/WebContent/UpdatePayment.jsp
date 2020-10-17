<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.model.Payment" %>
<%@page import="com.util.PaymentDBUtil" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Payment Form</title>
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
  padding: 12px;
  border: 1px solid white;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

.submitButton {
  background-color: #550080 ;
  color:white;
  padding: 30px 70px;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  font-family:Monospace;
  font-size:22px;
  margin: 10px 800px;
  width:40%;
  height:70px;
 
}

.submitButton:hover {
  background-color: #e6b3ff;
}

.container {
  border-radius: 5px;
  background-color:#FFEBA0;
  padding: 20px;
 /* margin: 10px 450px;*/
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
  color:#7700b3;
  font-family:Monospace;
  font-size:20px;
  text-align:left;
}

.col-75 {
  float: left;
  width: 65%;
  margin-top: 10px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
.title{
color: #550080;
font-family:cursive;
font-size:20px;
text-align:center;

.placeholder{
color: #303F9F;
font-family:cursive;
font-size:18px;
}

}
@media screen and (max-width: 100px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
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

<br><br>

<br><br>

<!-- start of the add payment form -->

<%
int Pid = (Integer)request.getAttribute("pid");

ArrayList<Payment> list = PaymentDBUtil.getRelPayementDetails(Pid);

for(Payment p:list)
{
%>

<div class="container">
<form action="UpdatePaymentDetails" method="post">
  	<div class= "title">
	<h2>Payment Details</h2>
	</div>
 	<br>
  	<div class="row">
    <div class="col-25">
    <label for="fname">Full Name</label>
    </div>
    <div class="col-75">
    <input type="text" id="fname" name="fName" value="<%=p.getfName() %>" >
    </div>
   	<div class="col-75">
    <input type="text" id="lname" name="lName" value="<%=p.getlName() %>" >
    </div>
    </div>
  	<div class="row">
    <div class="col-25">
    <label for="email">Email</label>
    </div>
    <div class="col-75">
    <input type="text" id="email" name="email" value="<%=p.getEmail() %>" >
    </div>
  	</div>
  	<div class="row">
    <div class="col-25">
    <label for="PNO">Contact Number</label>
    </div>
    <div class="col-75">
	<input type="text" id="pNo" name="pNo" value="<%=p.getPhoneNo() %>" >
    </div>
  	</div>
  	<div class="row">
    <div class="col-25">
    <label for="">Card Number</label>
    </div>
    <div class="col-75">
    <input type="text" id="cardNo" name="cardNo" value="<%=p.getCardNo() %>" >
    </div>
  	</div>
    <div class="row">
    <div class="col-25">
    <label for="ExDate">Expire Date</label>
    </div>
    <div class="col-75">
      <input type="text" value="<%=p.getYear() %>" disabled>
      <select id="Year" name = "year" required>
  		<option value="2020">2020</option>
  		<option value="2021">2021</option>
  		<option value="2022">2022</option>
  		<option value="2023">2023</option>
  		<option value="2024">2024</option>
  		<option value="2025">2025</option>
  		<option value="2026">2026</option>
  		<option value="2027">2027</option>
  		<option value="2028">2028</option>
  		<option value="2029">2029</option>
  		<option value="2030">2030</option>
		</select>
    	</div>

       	<div class="col-75">
       	<input type="text" value="<%=p.getMonth() %>" disabled>
		<select id="Month" name ="month" required>
  		<option value="January">January</option>
  		<option value="February">February</option>
  		<option value="March">March</option>
  		<option value="April">April</option>
  		<option value="May">May</option>
  		<option value="June">June</option>
  		<option value="July">July</option>
  		<option value="August">August</option>
  		<option value="September">September</option>
  		<option value="October">October</option>
  		<option value="November">November</option>
  		<option value="Dec">December</option>
		</select>
    	</div>
      	</div>
  		<div class="row">
    	<div class="col-25">
      	<label for="Cvv">CVV</label>
    	</div>
    	<div class="col-75">
      	<input type="text" id="Cvv" name="Cvv" value="<%=p.getCvv()%>" >
    	</div>
  		</div>
  		<div class="row">
    	<div class="col-25">
      	<label for="Country">Country</label>
    	</div>
    	<div class="col-75">
      	<input type="text" id="Country" name="Country" value="<%=p.getCountry() %>" >
    	</div>
  		</div>
  		<div class="row">
    	<div class="col-25">
     	<label for="Add1">Address1</label>
    	</div>
    	<div class="col-75">
      	<input type="text" id="Add1" name="Add1" value="<%=p.getAddress1() %>" >
    	</div>
  		</div>
  		<br>
    	<div class="row">
    	<div class="col-25">
      	<label for="Add2">Address2</label>
    	</div>
    	<div class="col-75">
      	<input type="text" id="Add2" name="Add2" value="<%=p.getAddress2() %>">
    	</div>
  		</div>
    	<div class="row">
    	<div class="col-25">
      	<label for="City">City</label>
    	</div>
    	<div class="col-75">
      	<input type="text" id="city" name="city" value="<%=p.getCity() %>">
    	</div>
  		</div>
  		<div class="row">
  		<input type="hidden" value="<%=p.getpID() %>" name="pid" >
    	<input type="submit" value="Update" class="submitButton">
  		</div>
  		<br>
</form>
</div>
<br>
<br>

<%
}
%>

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