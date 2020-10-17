<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="com.model.Item" %>
<%@ page import ="com.service.ItemServiceImpl" %>
<%@ page import ="com.service.InterfaceItemService" %>
<%@ page import ="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD ITEM</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>

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

/*----End of Table-----*/

/*End of Admin Item Page*/

</style>

</head>

<!---------------------------------HTML BODY--------------------------------->

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

<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>

<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><a class="nav" href="Item.jsp">ITEM</a></li>
<li class="list1"><a class="nav" href="AddItem.jsp">ADD ITEM</a></li>
<li class="list1"><div class="activeHome"><a class="nav" href="DisplayItem.jsp">UPDATE ITEM</a></div></li>
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
	//check for the database
	InterfaceItemService Iservice = new ItemServiceImpl();
	ArrayList<Item> Itemlist = Iservice.getItems("");
	
	//check array list is empty
	if(Itemlist.size() == 0)
	{
	%>
	<br>
	<b><center><font size="10px" color="#C94300">Item data not found.Item table is Empty.</font></center></b>
	 <center><img src="Pictures/EmptyDB.jpg"  width="600px" height="600"></center>
	<%
	}
	else
	{
	
%>
<br>
<!--Item details Table-->
<center><h2>Item Details</h2></center>

<table id="item">

<tr>
<th>Item ID</th>
<th>Item Name</th>
<th>Item Price(Rs.)</th>
<th>Item Quantity</th>
<th>Supplier</th>
<th>Item Description</th>
<th>Update/Delete</th>
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

<td> 
<!-- button for update item -->
<form method = "POST" action="getItem">
<input type="hidden" name="HiddenItemID" value="<%=item.getItemId() %>">
<input type="submit" class="btnU" value="Update Item">
</form>

<!-- button for delete item -->
<form method = "POST" action="DeleteItem">
<input type="hidden" name="HiddenItemId" value="<%=item.getItemId() %>">
<input type="submit" class="btnD" value="Delete Item">
</form>

</td>

</tr>

<% }
   }
   %>

</table>

<!--end of Table-->
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
<li class="list2"><a class="nav" href="Item.jsp">ITEM</a></li>
<li class="list2"><a class="nav" href="AddItem.jsp">ADD ITEM</a></li>
<li class="list1"><div class="activeHome"><a class="nav" href="DisplayItem.jsp">UPDATE ITEM</a></div></li>
</ul>

</div>

</footer>

<!--footer End--->

</body>

</html>

