
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>

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
margin-top: 0px;
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

<li class="list1"><div class="activeHome"><a class="nav" href="AboutUs.jsp">ABOUT US</a></div></li>
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

<div class="all" style="display:flex">
    
<div class="par" style="background-color:#FFFBCB; flex: 1; padding:10px">

<h1 style="color:#032977; ">INSIDE MOTOCARE</h1>

<p style="font-size:20px; font-family:verdana">
We are the exclusive dealer / distributor for the TOYOTA and HINO brands in Sri Lanka and a fully owned subsidiary 
of Toyota Tsusho Corporation (TTC), Japan. Hence, we are a global member company of the prestigious Toyota Group, Japan.
</p>

<p style="font-size:20px; font-family:verdana">
Embracing the traditions and passing it on to future generations, while reaching global destinations, Toyota Lanka is the 
only automobile company in the country to be 100% owned by its true Japanese parent company, the Toyota Group. This global
 backing makes Toyota Lanka a truly global corporate entity, contributing to its customers, corporates, society and country.
</p>

<p style="font-size:20px; font-family:verdana;">
Established in 1995, we pioneered the automobile integrator concept and the pursuit of bringing in automobile sales, servicing 
and spare-parts all under one-roof, introducing the first ever one-stop-shop auto business model in the country.
</p>

<p style="font-size:20px; font-family:verdana;">
Today, Toyota Lanka continues to expand and grow, reaching customers across diverse boundaries and limits. Since 1995, Toyota 
Lanka has brought about total mobility solutions in Passenger Cars, Commercial Vehicles, Trucks and the Sports Utility Vehicles 
segments and the Industrial Equipment sector.
</p>

<p style="font-size:20px; font-family:verdana;">
In doing so, Toyota Lanka always strives to bring total customer delight experiences, above & beyond the conventional customer
 service, taking it to a whole new level. With high quality products, localized and country suited automobiles, combined with 
 the high standards in customer delight services, which have raised our customer-centric offerings at each customer touch point, 
 enabling us to provide total transport mobility solutions, to both the corporate and individual customers of this country.
</p>

<p style="font-size:20px; font-family:verdana">
Currently, the company is on a continuous and ambitious growth plan, with a rapid expansion strategy in our business verticals.
 Over the years and since its establishment in 1995, Toyota Lanka has established its presence in all major cities across the island, 
 with key branches in Ratmalana, Maharagama, Negombo and Kurunegala.
</p>

<p style="font-size:20px; font-family:verdana">
To cater to all spare-parts, lubricants and car-care requirements, the branch network and service centres also span far and wide, 
with operations in Panchikawatte, Kandy, Galle, Kalutara, Ampara, Nugegoda, Gampaha, Kalutara, Anuradhapura and Negombo, along with 
the Toyota Lanka Authorized Service Stations (TLASS), island wide. This enables us to provide effective breakdown services to our 
customers  no matter where they are and at anytime.
</p>

</div>

<div class="visionMission" style="background-color:#CDFFC4; flex: 1; padding:10px">
<h1 style="color:#C52610;">OUR VISION</h1>
<p style="font-size:25px; font-family:verdana">To become the obvious choice!</p>


<h1 style="color:#C52610;">OUR MISSION</h1>
<p style="font-size:25px; font-family:verdana">
To achieve unparalleled recognition as the premium auto care service provider by objectifying trust, 
convenience and uniqueness; guiding our work force as a team striving to become the obvious choice.
</p>

<h1>LOCATION</h1>
<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d31686.486438497435!2d79.981643!3d6.913211!3
m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x2c63e344ab9a7536!2sSri%20Lanka%20Institute%20of%20Information%20Technology!
5e0!3m2!1sen!2slk!4v1588760384383!5m2!1sen!2slk"  frameborder="0" style="border:0;" allowfullscreen="" 
aria-hidden="false" tabindex="0" width=100%  height=50% ></iframe>


</div>

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
<li class="list2"><a class="nav" href="Home.jsp">HOME</a></li>
<li class="list2"><a class="nav" href="Services.jsp">SERVICES & ITEMS</a></li>
<li class="list2"><div class="activeHome"><a class="nav" href="AboutUs.jsp">ABOUT US</a></div></li>
<li class="list2"><a class="nav" href="ContactUs.jsp">CONTACT US</a></li>
</ul>

</div>

</footer>

<!--footer End--->

</body>

</html>