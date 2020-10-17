<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.service.CustomerService" %>
<%@ page import ="com.model.Comment" %>
<%@ page import ="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>

<title>Contact US</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>

/*-------------------------------------*/
.contactUsForm input[type=text],textarea, .contactUsForm input[type=email]
{
font-size: 20px;
padding: 12px;
width:100%;
margin-top: 6px;
margin-bottom: 16px;
border: 1 px solid #AA2697;
}

.contactUsForm  input[type=submit]
{
background-color: #E12F23;
color: white;
padding:12px 20px;
border: none;
cursor: pointer;
font-size: 20px;
}
.contactUsForm  input[type=submit]:hover
{
background-color: #7D110B;
}
.contactUsForm
{
font-family:Arial;
border-radius: 5px;
background-color: #F1F1AC; 
padding: 10px;
}

.contactUsCol
{
padding: 20px;
float: left;
margin-top: 6px;
width: 45%;
font-size: 25px;
}

.contactUsRow:after
{
content:"";
display: table;
clear: both;
}

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

/* end of foooter*/

.form input[type=submit]
{
background-color:#B14C06;
color: white;
padding: 20px;
border: none;
border-radius: 3px;
cursor: pointer;
font-family: Arial;
font-size: 25px;
}

.form input[type=submit]:hover
{
background-color:#F42D2D;
}

.delete
{
background-color: #9D2929;
color: white;
padding:15px;
border: none;
border-radius: 3px;
cursor: pointer;
font-size: 25px;
font-family: timesNewRoman;
}

.delete:hover
{
background-color: #FF0000;
}

</style>

</head>


<body>
<!----------------------------------Start of menue bar--------------------------------->

<!-- Validate session------------------------------------------ -->
<%
//variables
boolean chk = false;
String un = null;

//validate session
if(session.getAttribute("un") != null)
{	
chk = true;
%>
<div class="all" style="display:flex">
<img src="Pictures/logo.jpg"  width="500px" height="300" style="flex: 0.75; margin-left:30%;">
<div class="par" style="background-color:#FFFBCB; flex: 0.5; padding:20px; margin-left:10%; font-family:verdana;">
<img src="Pictures/profile.png" >
<h1>SIGN IN AS:<%=session.getAttribute("un") %></h1>

</div></div>
<% 
} 
else
{
%>

<center><img src="Pictures/logo.jpg"  width="500px" height="300"></center>

<%} %>  

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
<li class="list1"><div class="activeHome"><a class="nav" href="ContactUs.jsp">CONTACT US</a></div></li>

</ul>


<!---Sub Menue(Cart,Profile)--->

<%

if(chk == true)
{
	//get user's username by session
	un = (String)session.getAttribute("un");

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

<a href="Registration.jsp">Sign Up</a>
<a href="CustomerLogin.jsp">Sign In</a>
</div>

</div>

</div>

<% } %>

</div>

<!--end of Sub Menue(Cart,Profile)-->

<!--end of menue bar-->
<br>


<!-----------begin contact us form------------------>

<div class="contactUsForm">
	
  <div class="contactUsRow">
	
   <div class="contactUsCol">
   <font size="40px"><i class="fas fa-phone-volume fa-2x"></i>Contact US<br>Any Questions About Servie?<br>Any Suggestions?</font>
	
	<br><br>		
   <i class="fas fa-phone fa-2x"></i>
   
   <font face="cursive">
   <b>Corporate Office</b></font><br>
   <font face="arial">
	No.123,Temple Road,Colombo11,Sri Lanka.<br>
	Call:+(94)112 222 486<br>
	Hotline:+(94)778 081 081<br>
    Fax:+(94)112 222 487<br>
	info@momschoise.lk
   
   <br>
   <i class="fas fa-phone fa-2x"></i>
   
   <b>Online Store</b></font><br>
   <font face="arial">
	Hotline:+(94)771 181 181<br>
	online@momschoise.lk
   </font>
   
	</div>
	
	<% 
	if(chk == true)
	{
	%>
	
	<div class="contactUsCol">
	
	<form method="POST" action="AddComment">
		<b>Username</b>
		<input Type="text" value="<%=un %>" disabled>
		<input Type="hidden" name="name" value="<%=un %>" >
		
		<b>Email</b>
		<input Type="email" name="email" placeholder="Email" required>
		<b>Comment</b>
		<textarea name="des" placeholder="Comment" required style="height:170px"></textarea>
	<input type="submit" value="Submit" class="form">
	</form>
	
	<%
	} 
	else
	{
	%>
		<font size="15px" color="red">Login to submit comment.</font>
	<% 
	}
	%>
	
	</div>
	
   </div>
   
  </div>

<!---------------end of contact us form-------------------->



<br>
<font size="30px">Comments<i class="far fa-comments"></i></font>
<br>
<br>

<table border = '0' width = '90%' style="text-align : left; font-size: 25px;">
<%
//get details from database
ArrayList<Comment> li = CustomerService.DisplayComments();

if(li.size() > 0 )
{
	for(Comment c : li)
	{
	
		String Uname = c.getUsername();

	%>
	<tr>
	<td style="background-color:#D0F6F5; font-size: 25px; padding:15px; font-family:verdana; border-radius: 25px; width:30%;">Customer:<%=c.getUsername() %>
	
	<br><u><font color="#C9332F">Email:<%=c.getEmail() %></font></u> </td>
	
	<td style="font-size: 20px; padding:15px; font-family:verdana; border-radius: 25px; background-color:#F4E2F8; width:60%;">Comment:<%=c.getComment() %></td>

	<!-- button for delete comment -->
	
	<% 

	if(chk == true) 
	{

		if(Uname.equals(un))
		{
		%>
		<td style="font-size: 20px; padding:15px; font-family:verdana; border-radius: 25px; background-color:#F4E2F8; width:10%;">
		<form method = "POST" action="DeleteComment">
		<input type="hidden" name="name" value="<%=c.getUsername() %>">
		<input type="hidden" name="id" value="<%=c.getCommentId() %>">
	
		<input type="submit" value="Delete My Comment" class="delete">
		</form></td>
		
		<%
		}
	}
	%>
	</tr>

<%
//end of if
	}
//end of for loop
	}

%>	

</table>


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
<li class="list2"><div class="activeHome"><a class="nav" href="ContactUs.jsp">CONTACT US</a></div></li>
</ul>

</div>

</footer>

<!--footer End--->

</body>

</html>
