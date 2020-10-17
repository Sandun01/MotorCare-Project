<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">


<title>View Appointments</title>
</head>

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
float:right;
}

#logout:hover
{
background-color: #FF0000;
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

/*Table begin*/

body
{
  background-image: url('Pictures/interfaceBakcground.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}



#appointment
{
font-family:verdana;
font-size:24px;
width: 100%;
border-collapse: collapse;
}

#appointment, #appointment th
{
border: 3px solid #ddd;
padding: 10px;
}



#appointment th
{
padding-top: 15px;
padding-bottom : 15px;
text-align : Center;
background-color:#00BFFF;
color: black;
}

#appointment tr{
background-color:#F0FFF0;
}

.Submit
{
background-color:#DD3B3B;
border: none;
color: white;
padding: 5px 5px;
cursor:pointer;
margin: 4px 4px;
font-size:25px;
width:30%;
height:50px;
}

.Submit:hover
{
background-color:#D09EF6;
color:#000;
}

.EB
{
background-color:#778899;
border: none;
color: white;
padding: 5px 5px;
cursor:pointer;
margin: 4px 4px;
font-size:15px;
width:50%;
}

.DB
{
background-color:#F00;
border: none;
color: white;
padding: 5px 5px;
cursor:ponter;
margin: 4px 4px;
font-size:15px;
width:50%;
}

.EB:hover , .DB:hover{
  background-color: #87CEFA;
}

h3{
text-align:center;
font-size:40px;
}

/*End table*/

/*form begin*/


input[type=text], select, textarea {
  width: 90%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
  position:center;
  	
}

.container {
  border-radius: 20px;
  background-color: #B0E0E6;
  padding: 20px;
  width:700px;
  length:1000px;
  text-align:center;
  margin-left:400px;
}

label{

	text-aling:center;
	font-family:sans-serif;
	font-size:18px;
	font-style:italic;
	
}

/*End form*/


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
<img src="Pictures/profile.png" >
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


<a href="BookAppointment.jsp">BOOK A NEW APPOINTMENT</a>
<div class="activeHome">
<a href="Appointment.jsp">VEIW APPOINTMENTS</a></div>

</div>
</li>
</div>

<li class="list1"><a class="nav" href="AboutUs.jsp">ABOUT US</a></li>
<li class="list1"><a class="nav" href="ContactUs.jsp">CONTACT US</a></li>

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
<input type= "submit" value="LOGOUT" id="logout">
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


<%
Connection con =null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/motorcare","root","root");
Statement st1 = null;
ResultSet rs1 =null;
String a = request.getParameter("Hid");
try{
	st1 = con.createStatement();
	String strSql = "select * from appointment where id ='"+ a +"'";
	rs1= st1.executeQuery(strSql);
	while(rs1.next()){
		%>

<h3>If You Want You Can Update Your Appointment Form</h3>
	
<div class="container">	
<form action="upd" method="post">
	<input type = "hidden"name="id" value ='<%= rs1.getString(1) %>'/>
	<label for="fname">First Name</label>
	<input type = "text" name = "FName" value ='<%= rs1.getString(2) %>' readonly/ ><br/>
	<label for="lname">Last Name</label>
	<input type = "text" name = "LName"value ='<%= rs1.getString(3) %>'/> <br/>
	<label for="email">Email.....  </label>
	<input type = "text" name = "Email"value ='<%= rs1.getString(4) %>'/> <br/>
	<label for="phoneNumber">Phone Number</label>
	<input type = "text" name = "PhoneNumber"value ='<%= rs1.getString(5) %>'/> <br/>
	<label for="preferedDate">Prefered Date</label>
	<input type = "text" name = "PreferedDate" value ='<%= rs1.getString(6) %>'/> <br/>
	<label for="preferedLocation">Prefered Location</label>
	<input type = "text" value ='<%= rs1.getString(7) %>'/ disabled> <br/>
	<select id="PreferedLocation" name="PreferedLocation" id = "name" required><br><br>
				<option value="colombo">Colombo</option>
				<option value="galle">Galle</option>
				<option value="jaffna">Jaffna</option>
			</select>
	</br>
	<label for="VehicleNo">Vehicle Registration Number</label>
	<input type = "text" name = "VehicleNo"value ='<%= rs1.getString(8) %>'/> <br/>
	
	<input type="submit" value="Submit" class="Submit">
	</form>
</div>
	<%	}
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<center>
<h1> ~Update Your Appointment~</h1>
</form>

<br/>
<table id = "appointment">
<tr>
	<th>Id </th>
	<th>First Name</th>
	<th>Last Name</th>
	<th>Email  </th>
	<th>PhoneNumber </th>
	<th>PreferedDate </th>
	<th>PreferedLocation </th>
	<th>VehicleNo </th>
	<th>Update/Delete</th>
</tr>
	<%
	Connection conn =null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/motorcare","root","root");
	Statement st = null;
	ResultSet rs =null;
	
	try{
		st = conn.createStatement();
		String strSql = "select * from appointment";
		rs= st.executeQuery(strSql);
	
		while(rs.next()){
			%>
			
				<tr>
					<td><%= rs.getString(1) %> </td>
					<td><%= rs.getString(2) %> </td>
					<td><%= rs.getString(3) %> </td>
					<td><%= rs.getString(4) %> </td>
					<td><%= rs.getString(5) %> </td>
					<td><%= rs.getString(6) %> </td>
					<td><%= rs.getString(7) %> </td>
					<td><%= rs.getString(8) %> </td>
					
					<td>
					
					<center>
					<form action ="dlt" method ="post" >
						
						<input type="hidden" name="id" value=<%= rs.getString(1) %> >
						<input type="submit" class ="DB" value="Delete">
					 </form>
					<form action="upDetails" method ="post" >
						<input type="hidden" name="Hid" value=<%= rs.getString(1) %> >
						<input type="submit" class ="EB" value="Edit">
					 </form>
					</center>
					
					</td>
					
					
				</tr>
<%}}catch(Exception e){
	e.printStackTrace();
}%>
</table>
</center>

<br>

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