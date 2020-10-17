<%@ page import ="java.util.ArrayList" %>
<%@ page import ="com.model.Service" %>
<%@ page import ="com.service.AdminDBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

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

/*------------------Slide show-----------------------------*/
*{
box-sizing: border-box
}

.mySlides
{
display: none;
}

img {
vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
  max-width: 1600px;
  max-height:1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
/*-------------------End slide show-------------------*/

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
<li class="list1"><div class="activeHome"><a class="nav" href="Home.jsp">HOME</a></div></li>
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

<%
if(session.getAttribute("un") == null)
{
%>	
<li class="list1"><a class="nav" href="Interface.jsp">IFACE</a></li>
<%
}
%>

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

<!-- -Slide show begins -->
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 5</div>
  <img src="Pictures/car1.jpg" style="width:100%" width="1200px" height="700">
  <div class="text">Image 1</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 5</div>
  <img src="Pictures/img.jpg" style="width:100%"  width="1200px" height="700">
  <div class="text">Image 2</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 5</div>
  <img src="Pictures/img3.jpg" style="width:100%"  width="1200px" height="700">
  <div class="text">Image 3</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 5</div>
  <img src="Pictures/img5.jpg" style="width:100%"  width="1200px" height="700">
  <div class="text">Image 4</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 5</div>
  <img src="Pictures/img4.jpg" style="width:100%"  width="1200px" height="700">
  <div class="text">Image 5</div>
</div>


<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>

<!-- Slide show script -->
<script>
var slideIndex = 1;
var timer = null;
showSlides(slideIndex);

function plusSlides(n) {
  clearTimeout(timer);
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  clearTimeout(timer);
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n==undefined){n = ++slideIndex}
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  timer = setTimeout(showSlides, 3000);
} 
</script>
<!-- End of slide show script -->

<!-- --Slide show ends -->

<br><br>

<p style="font-size:25px;">
Motorcare, the official GYEON distributer, offers a range of premium quality products that have been extensive tested 
to satisfy the needs of all car detailing enthusiasts. At Motorcare we have spared no expense to provide you with the most innovative solutions, 
always producing exceptional results and satisfaction from the Gyeon Quartz product range.
<br>
We value your time, which is why you can always rely on our consistent, high quality products as well as
our expertise gained through years of development and improvement. We offer you complete solutions, hence 
our market leading coatings come with all the necessary accessories and illustrated instructions so that you
can easily achieve the best results. Our range is offered in superior, custom designed packaging to provide 
clear information and a consistent brand image. Protection based on silicon dioxide (SiO2) is the most sophisticated
car protection technology which has been developed to date. Previously exploited by the most demanding consumers in
the electronics industry or used to protect railway rolling stock from vandalism, this formulation is now being introduced
in its unique form to the automotive business by the GYEON brand. The crucial properties of the quartz coating are its ability
to increase the overall hardness of the paint up to the level of 9H (hardness of the coating determined by pencil hardness scale)
as well as its measurable thickness, reaching up to 1 micron. The most critical thing, however, is the structural integrity that 
the layer displays. After vaporizing all the solvents contained in the product, where 90 % evaporates within the first 24 hours 
and a total of 100% vaporization might be accomplished after 14 days, the layer becomes solid, very hard and highly durable. Owing 
to the quartz coatings thickness, all scratching and fading which may appear during washing or as a result of extensive exposure
to caustic substances e.g. bird droppings, do not reach the paint, leaving its surface intact. Moreover, it is entirely resistant 
to chemical substances with a pH of between 2 and 11, which makes it incredibly durable and resistant to frequent washing. The
only way to remove the coating is through the application of professional, intensive abrasives.
</p>

<h1 style="color:#A30A0A;">MOTORCARE NOW AVAILABLE SERVICES</h1>

<%
	ArrayList<Service> list = AdminDBUtil.getAllServices();
	
	//check array list is empty
	if(list.size() != 0)
	{

		for(Service s : list)
		{
		%>
		<h2 style="font-family:verdana; font-size:30px;"><i class="fas fa-cogs" style="color:#f00;"></i> <%=s.getServiceName() %></h2>
		
	<%  }
	}
	%>

<br>

<h1 style="color:#213D99;">MOTORCARE MECHANICAL WORKSHOP SERVICES</h1>

<p style="font-size:25px;">
Motorcare ultra-modern automobile workshops manned by experienced professionals, 
provide an extensive range of auto repair and replacement service from Automotive Diagnostics to complete Engine overhaul.
</p>

<div class="headers" style="font-size:20px;">
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Mechanical Repair, Maintenance and Spare Part Replacement</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Automotive Diagnostic / Scanning  12v, 24v (19) (Check Engine Con)</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Automotive Electric Work Including ECU Repairs Air-Conditioning, Heating And Climate Control Systems</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Brake Systems Repairs  ABS / EDB Suspension Repairs And Upgrades Including ESC (Electronic Stability Control)</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Emission Control And Engine Tune-Ups</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Radiator And Cooling System Repairs</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Ignition Repairs And Timing Corrections</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> 2WD, 4WD Drive Shaft Repairs</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Steering Repairs And Maintenance Work</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Complete Engine Overhaul</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Decarbonizing</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> DPF (Diesel Particulate Filter)</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Auto / Manual Transmission Repairs</h2>
<h2 style="font-family:verdana;"><i class="fas fa-cogs" style="color:#10DA40;"></i> Vehicle Performance Upgrades  (Racing, Rally Or Off Road)</h2>

</div>

<br>
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
<li class="list2"><div class="activeHome"><a class="nav" href="Home.jsp">HOME</a></div></li>
<li class="list2"><a class="nav" href="Services.jsp">SERVICES & ITEMS</a></li>
<li class="list2"><a class="nav" href="AboutUs.jsp">ABOUT US</a></li>
<li class="list2"><a class="nav" href="ContactUs.jsp">CONTACT US</a></li>
</ul>

</div>

</footer>

<!--footer End--->
 
</body>

</html>