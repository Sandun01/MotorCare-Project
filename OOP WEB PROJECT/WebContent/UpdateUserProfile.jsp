<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.UserProfileServiceImpl"%>
<%@page import="com.service.InterfaceUserProfileService"%>
<%@page import ="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head><title>MotorCare - Update User Profile</title> 
<meta name="viewpoint" content="width=device-width", initial-scale=1>

<link rel="StyleSheet" href ="css/userprofile.css">
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
.logout
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

.logout:hover
{
background-color: #FF0000;
}

.logout
{
float:right;
}

</style>

</head>

<body>
<!----------------------------------Start of menue bar--------------------------------->

<!-- Validate session------------------------------------------ -->
<%
//validate session
if(session.getAttribute("un") == null)
{	
	response.sendRedirect("CustomerLogin.jsp");
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
<!-- Validate session------------------------------------------ -->
<%
int count = 0;
//validate session
if(session.getAttribute("un") != null)
{
	count = (Integer)session.getAttribute("CartCount");
}
%>

<!-- Cart -->
<div class="cart"><div class="activeHome">
<a class="cart1" href="cart.jsp">Cart <font style="color:red; background-color:#FFF829;"><%=count %></font><i class="fas fa-shopping-cart fa-2x"></i></div>
</a>
</div>

<!-- profile -->

<div class="Text1"><div class="activeHome">
<a class="Text2" href="UserProfile.jsp">User Profile<i class="fas fa-user-circle fa-2x"></i></a></div>
</div>

<form method="post" action="CustomLogOut">
<input type= "submit" value="LOGOUT" class="logout">
</form>


</div>

<!--end of Sub Menue(Cart,Profile)-->

<!--end of menue bar-->

<br><br>
<br><br>
<%
Customer customer = new Customer();
customer = (Customer) request.getAttribute("CustomerDetails");
System.out.println(customer.getFirstName());

	
%>
<form  method="POST" action = "UpdateCustomerDetails" class="inf" width = "130%">
<input type="hidden" name="un" value="<%=session.getAttribute("un") %>">

<h1>Update Your Own Account</h1>

<table width =100%>
<col width ="130">
<col width = "130">
<col width = "130">

<tr>
	<td width = 200%><font ="10px">FirstName</font><td><input type="text" size="20"name="firstname"  value ="<%=customer.getFirstName()%>"></td>
	
</tr>
<tr></tr>
<tr>
	<td>LastName</td>
	<td><input type="text" name="lastname" value = "<%=customer.getLastName()%>"></td>
</tr>
<tr></tr>
<tr>
	<td>Gender</td>
	<td><input type="radio" name="gender" value="male">Male</td>
	<td><input type="radio" name="gender" value="female">Female</td>
</tr>
<tr></tr>
<tr>
	<td>Email</td>
	<td><input type="email" name="email" value="<%=customer.getEmail() %>" ></td>
</tr>
<tr></tr>



</table>
<br/><br/><br/>

<center>
<button type="submit" class="subbtn" id="subbtn" name="sub" >Update</button>
</center>


</form>
<form action = "DeleteCustomer" method = "Post">
<input type="hidden" name="un" value="<%=session.getAttribute("un") %>">
<button type="submit" class="subbtn" id="subbtn" name="sub" >Delete</button>
</form>
</div>
<!footer begin>

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
<li class="list2"><div class="nav"><a class="nav" href="Home.jsp">HOME</a></div></li>
<li class="list2"><a class="nav" href="Services.jsp">SERVICES & ITEMS</a></li>
<li class="list2"><a class="nav" href="AboutUs.jsp">ABOUT US</a></li>
<li class="list2"><a class="nav" href="ContactUs.jsp">CONTACT US</a></li>
</ul>

</div>

</footer>

<!--footer End--->
</body>


</html>


