<%@ page import ="com.service.CartServiceImpl" %>
<%@ page import ="com.model.Cart" %>
<%@ page import ="com.model.Item" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="com.service.ItemServiceImpl" %>
<%@ page import ="com.service.InterfaceItemService" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>

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

.card
{
background-color:#BEFFF0; 
margin-left:15%; 
width:60%;
border-radius:20px; 
padding:10px; 
margin-bottom:50px;
font-size:20px;
font-family: Arial;
}

#qtyConfirm
{
background-color:#052271; 
padding:10px; 
font-weight: bold;
font-family: arial;
}

#qtyConfirm:hover
{
background-color:#D41D1D; 
}

.confirmPay
{
text-decoration:none;
font-size:30px;
background-color:#E72323;
height:50%;
width:30%;
padding:20px;
margin-left: 100px;
margin-top: 20px;
margin-bottom: 20px;
color:#fff;
font-weight:bold;
}

.confirmPay:hover
{
background-color:#F5F412;
color:#000;
}

</style>

</head>


<body>
<!---------------------------------Check message to display--------------------------------->
<% 

String Emsg = (String)request.getAttribute("EMessage");

if(Emsg != null)
{	
%>	

<script type="text/javascript">
var message = "<%=Emsg%>";
alert(message);

</script>

<% 
} 
else
{
}

%>

<!---------------------------------End Check message to display--------------------------------->


<!----------------------------------Start of menue bar--------------------------------->

<!-- Validate session------------------------------------------ -->
<%
//variables
String un = null;

//validate session
if(session.getAttribute("un") == null)
{	
	response.sendRedirect("LogIn.jsp");
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
<h1>SIGN IN AS:<%=un %></h1>

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
//validate session
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

</div>

<!--end of Sub Menue(Cart,Profile)-->

<!--end of menue bar-->

<br><br>

<h1 style="font-family:arial; font-size:50px; color:#C11510; text-align:center;">Cart Details</h1>

<% 
float total = 0;

ArrayList<Cart> li = CartServiceImpl.getItemInCart(un);

InterfaceItemService Iservice = new ItemServiceImpl();

if(li.size() > 0)
{
	
for(Cart c : li)
{
	ArrayList<Item> itm = Iservice.getItems(c.getItemId());

	for(Item i: itm)
	{
%>

<div class="card" >

<h2 style="font-family:cursive; margin-left:10%;">Item Name:<%=i.getItemName() %></h2>
<h2 style="font-family:cursive;; margin-left:10%;">Item Description:<%=i.getDescription() %></h2>

<% 
}
%>

<form action="updateCart" method="post">

<input type="hidden" name="un" value="<%=un%>">
<input type="hidden" name="Itmid" value="<%=c.getItemId()%>">
<input type="hidden" name="price" value="<%=c.getPrice()%>">

<font style="color:#1B8315; margin-left:10%; font-size:30px; font-weight:bold;">Item Price <%=c.getPrice()%></font>
<font style="color:#1B8315; margin-left:10%; font-size:30px; font-weight:bold;">Item Quantity</font>

<input type="number" name="qty" value="<%=c.getQuantity() %>" style="border:none; width:200px; height:30px; text-align:center; font-size:25px; font-weight:bold;">

<input type="submit" value="Change Quantity" id="qtyConfirm">
<br>
</form>

<h2 style="color:#DB2823; margin-left:10%; ">Total Amount:Rs.<%=c.getTotal() %></h2>

<form action = "removeFromCart" method ="post">
<input type="hidden" name="un" value="<%=c.getUsername() %>">
<input type="hidden" name="Itmid" value="<%=c.getItemId() %>">
<input type="submit" value="Remove Item" id="deleteItem" style="margin-left:20%; font-size:25px; font-weight:bold; font-family:Arial;">
</form>

</div>

<%
//calculate total
total = total + c.getTotal();
}
%>

<div class="bill" style="display: flex; 1: column; font-family:arial; font-size:30px; background-color:#FAC9C9;" >
<h1>Total Bill:Rs.<%=total %></h1>
<a href="SelectPaymentMethod.jsp" class="confirmPay">CONFIRM ITEMS & BUY</a>
</div>

<% 
}
else
{
%>

<h1 style="color:red;">NO Items in Cart</h1>

<a href="Services.jsp" style="font-size:30px;">Click here to add items.</a>

<%
}
%>

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