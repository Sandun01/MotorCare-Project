<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="com.model.Item" %>
<%@ page import ="com.service.ItemServiceImpl" %>
<%@ page import ="com.service.InterfaceItemService" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Home</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>

/*----------Cards----------------*/
*{
box-sizing: border-box;
}

.Column1
{
 float: left;
 width: 25%;
 padding:0 10px;
}

.row1
{
margin:10px 5px;
}

.row1:after
{
content: "";
display: table;
clear: both;
}

.card1
{
box-shadow:0 4px 8px 0 rgba(0,0,0,0.2);
padding: 10px;
text-align: center;
background-color: #f1f1f1;
}

.card2
{
box-shadow:0 4px 8px 0 rgba(0,0,0,0.2);
padding: 10px;
text-align: center;
background-color: #f1f1f1;
}

.Column2
{
 float: left;
 width: 50%;
 padding:0 10px;
}

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

.btnU
{
background-color:#2EA537;
border: none;
color: white;
padding: 12px 12px;
cursor:ponter;
margin: 4px 4px;
font-size:20px;
}

.btnU:hover
{
background-color:#17FF35;
padding: 18px 18px;
}

.btnD
{
background-color:#C40C0C;
border: none;
color: white;
padding: 12px 12px;
cursor:ponter;
margin: 4px 4px;
font-size:20px;
}

.btnD:hover
{
background-color:#FF0000;
padding: 18px 18px;
}

</style>

</head>

<body>

<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>


<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><div class="activeHome"><a class="nav" href="Item.jsp">ITEM</a></div></li>
<li class="list1"><a class="nav" href="AddItem.jsp">ADD ITEM</a></li>
<li class="list1"><a class="nav" href="DisplayItem.jsp">UPDATE ITEM</a></li>

</ul>

<!---Sub Menue(Cart,Profile)--->
<div class="Text1">
<a class="Text2" href="AdminLogout">Log Out<i class="fas fa-sign-out-alt fa-2x"></i></a>
</div>

<div class="Text1">
<a class="Text2" href="AdminHome.jsp">BACK TO HOME PAGE<i class="fas fa-sign-out-alt fa-2x"></i></a>
</div>

<div class="profile">
<a class="profile1" href="AdminProfile.jsp">AdminProfile<i class="fas fa-user-circle fa-2x"></i></a>
</div>

</div>

</div>

</div>
<!--end of Sub Menue(Cart,Profile)-->

<!--end of menue bar-->

<% 
	//declaring variables
	int count = 0, qty = 0;
	float price = 0, totalPrice = 0, totalItemPrice = 0;
		
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
	

	//get all item count
		count = Itemlist.size();
		for(Item item : Itemlist)
		{
		//calculate total price
			qty = item.getItemQuantity();
			price = item.getItemPrice();			
			totalItemPrice = price * qty;
			totalPrice = totalPrice + totalItemPrice;
		}
	
%>
<br>

<!-- cards -->

<div class="row1">
 
 <div class="Column1">
   <div class="card1">
	 <img src="Pictures/card3.jpg" width="200px" height="200px">
	 </br>
	 
	 <b>
	 <font size="4px" face="cursive">Total Products</font>
	 </br>
	 <font size="6px" face="Arial" color="#00066F"><%=count %></font>
	 </b>
	 
	</div>
 </div>
 
<div class="Column1">
   <div class="card1">
    <img src="Pictures/card2.png" width="200px" height="200px">
	 </br>
	 
	 <b>
	 <font size="4px" face="cursive">Total Product Value</font>
	 </br>
	 <font size="6px" face="Arial" color="#00066F">Rs. <%=totalPrice %></font>
	</b>
	
	</div>
 </div>
 
<div class="Column2">
   <div class="card2">
    <img src="Pictures/card1.jpg" width="520px" height="200px">
	 </br>
	 
	 <b>
	 <font size="4px" face="cursive">Theme</font>
	</b>
	
	</div>
 </div>
 
 </div>
 
 <!-- Cards end -->

<!--Item details Table-->
<center><h2>Item Table</h2></center>

<table id="item">

<tr>
<th>Item ID</th>
<th>Item Name</th>
<th>Item Price(Rs.)</th>
<th>Item Quantity</th>
<th>Supplier</th>
<th>Item Description</th>
</tr>

<%

//get item details from database
for(Item item : Itemlist)
{
	
%>

<tr>
<td><%=item.getItemId() %></td>
<td><%=item.getItemName() %></td>
<td><%=item.getItemPrice() %></td>
<td><%=item.getItemQuantity() %></td>
<td><%=item.getSupplier() %></td>
<td><%=item.getDescription() %></td>

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
<li class="list2"><div class="activeHome"><a class="nav" href="Item.jsp">ITEM</a></div></li>
<li class="list2"><a class="nav" href="AddService.jsp">ADD ITEM</a></li>
<li class="list1"><a class="nav" href="DisplayItem.jsp">UPDATE ITEM</a></li>
</ul>

</div>

</footer>

<!--footer End--->

</body>

</html>