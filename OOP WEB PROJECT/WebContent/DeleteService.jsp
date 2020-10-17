<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Service</title>

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
color:white;
}

.profile1:hover
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

input[type=submit] {
  background-color: #3949AB ;
  color:white;
  padding: 10px 50px;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  float:
  font-family:Monospace;
  font-size:22px;
  margin: 10px 350px;
  
 
}

input[type=submit]:hover {
  background-color: green;
}

.container {
  border-radius: 5px;
  background-color:#81F7F3;
  padding: 20px;
  margin: 10px 450px;
}

.col-25 {
  /*float: left;*/
  width: 25%;
  margin-top: 6px;
  color: blue;
  font-family:Monospace;
  font-size:20px;
  /*text-align:left;*/
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
color: blue;
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
.body{
background-image:url('Pictures/AdminLogin.jpg');
}
/* end Form css*/

</style>
</head>

<body>
<!-- Validate session------------------------------------------ -->
<%
//Prevent from back button redirect
//response.setHeader("Cache-Control", "no-cache, no-store");

//validate session
	if(session.getAttribute("username") == null)
	{
		//redirect to login page
		response.sendRedirect("AdminLogin.jsp");
	}

%>

<!----------------------------------Start of menu bar--------------------------------->

 <center><img src="Pictures/logo.jpg"  width="500px" height="300"></center>
  
<!----------------------------------Main Menu bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><div class="nav"><a class="nav" href="AllService.jsp">AllSERVICE</a></div></li>
<li class="list1"><div class="activeHome"><a  class="nav" href="#">ADD SERVICES</a></div></li>
<li class="list1"><div class="nav"><a class="nav" href="DisplayService.jsp">SEARCH SERVICE</a></div></li>



</ul>

<!---Sub Menu(Cart,Profile)--->
<div class="Text1">
<a class="Text2" href="Lsogout.jsp">Log Out<i class="fas fa-sign-out-alt fa-2x"></i></a>
</div>

<div class="Text1">
<a class="Text2" href="Admin.jsp">BACK TO HOME PAGE<i class="fas fa-sign-out-alt fa-2x"></i></a>
</div>

<div class="profile">
<a class="profile1" href="Admin.jsp"><i class="fas fa-user-circle fa-2x"></i></a>
</div>
</div>


<!--end of Sub Menu(Cart,Profile)-->

<!--end of menu bar-->
<div class="body">
<br><br>

<br><br>
<div class="container">
<form action="sDelete" method="post">
<% 
	String serviceNo = request.getParameter("serviceNo");
	String serviceName = request.getParameter("serviceName");
	String servicedescription = request.getParameter("servicedescription");
	String serviceAmount = request.getParameter("serviceAmount");
%>  
   <div class="row">
    <div class="col-25">
      <label for="sDeletes">Are you want delete Service?</label>
    </div>
  </div>
  <br>
  <div class="row">
    <input type="hidden" name="sNo" value=<%= serviceNo %> >
    <input type="submit" value="Yes,Delete Service">
  </div>
  <br>
  </form>
</div>
<br>
<br>

</div>
<!--footer begin--->

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
<li class="list1"><div class="nav"><a class="nav" href="AllService.jsp">AllSERVICE</a></div></li>
<li class="list1"><div class="activeHome"><a  class="nav" href="#">ADD SERVICES</a></div></li>
<li class="list1"><div class="nav"><a class="nav" href="DisplayService.jsp">SEARCH SERVICE</a></div></li>

</ul>

</div>


</footer>

<!--footer End--->

</body>

</html>