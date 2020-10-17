<%@ page import ="com.model.Item" %>
<%@ page import ="com.model.Service" %>
<%@ page import ="com.service.AdminDBUtil" %>
<%@ page import ="com.service.ItemServiceImpl" %>
<%@ page import ="com.service.InterfaceItemService" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items & Services</title>

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

/*----Item Details Table-----*/

#item
{
font-family: "Calibri";
font-size: 25px;
width: 100%;
border-collapse: collapse;
}

#item td, #item th
{
border: 1px solid #ddd;
padding: 15px;
}

#item tr:hover
{
background-color: #FDFFC3;
}

#item th
{
padding-top: 15px;
padding-bottom : 15px;
text-align : Center;
background-color: #011175;
color: white;
}

#addCart
{
background-color:#24881E;
}

#addCart:hover
{
background-color: #F69E2F;
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
boolean ChkUn = false;

//validate session
if(session.getAttribute("un") != null)
{	
//assign check value
ChkUn = true;

//assign username
un = (String)session.getAttribute("un");

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
<li class="list1"><div class="activeHome"><a class="nav" href="Services.jsp">SERVICES & ITEMS</a></div></li>

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
//validate session
if(ChkUn == true)
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

<!--Item details Table-->
<center><h1 style="font-size:35px; font-family:verdana;">Item Store</h1></center>

<table id="item">

<tr>
<th>Item ID</th>
<th>Item Name</th>
<th>Item Price(Rs.)</th>
<th>Item Description</th>

<%
if(ChkUn == true)
{ 
%>
<th>Buy Item</th>
<%
}
%>

</tr>

<%
//check for the database
	InterfaceItemService Iservice = new ItemServiceImpl();
	ArrayList<Item> Itemlist = Iservice.getItems("");
	
	//check array list is empty
	if(Itemlist.size() == 0)
	{
	%>
	<br>
	<b><center><font size="10px" color="#C94300">Item table is Empty.</font></center></b>
	 <center><img src="Pictures/noResult.jpg"  width="600px" height="600"></center>
	<%
	}
	else
	{

		//get item details from database
		for(Item item : Itemlist)
		{
	
		%>

		<tr>
		<td><%=item.getItemId() %></td>
		<td><%=item.getItemName() %></td>
		<td><%=item.getItemPrice() %></td>
		<td><%=item.getDescription() %></td>


		<%
		//check user logged in
		if(ChkUn == true)
		{ 
		%>
		<td>
		
		<form action="AddToCart" method="post">
		
		<input type="hidden" value="<%=un%>" name="un">
		<input type="hidden" value="<%=item.getItemId()%>" name="ItmId">
		<input type="hidden" value="<%=item.getItemPrice()%>" name="price">
		
		<%
			if(item.getItemQuantity() > 0)
			{
		%>
		<input type="submit" value="Add To Cart" id="addCart">
		
		<%
			}
			else
			{
		%>
			
			<h3 style="color:#f00">Out Of Stock</h3>
		<%	} %>
		
		</form>
		
		</td>
		
		<% } %>
		
		</tr>

		<% 
		//end of for loop
			}

		//end of else
		   }
 		  %>

</table>

<!--service details Table-->
<center><h1 style="font-size:35px; font-family:verdana;">All Services And Details</h1></center>

<table id="item">

<tr>
<th>Service Name</th>
<th>Service Description</th>
<th>Service Estimated Price(Rs.)</th>

</tr>

<%
//check for the database
	ArrayList<Service> list = AdminDBUtil.getAllServices();
	
	//check array list is empty
	if(list.size() != 0)
	{

		for(Service s : list)
		{
		%>

		<tr>
		<td><%=s.getServiceName() %></td>
		<td><%=s.getServicedescription() %></td>
		<td><%=s.getServiceAmount() %></td>

		</tr>

		<% 
		//end of for loop
			}

	//end of else
	 }
  %>

</table>

<!--end of Table-->

<br><br>

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
<li class="list2"><div class="activeHome"><a class="nav" href="Services.jsp">SERVICES & ITEMS</a></div></li>
<li class="list2"><a class="nav" href="AboutUs.jsp">ABOUT US</a></li>
<li class="list2"><a class="nav" href="ContactUs.jsp">CONTACT US</a></li>
</ul>

</div>

</footer>

<!--footer End--->

</body>

</html>