<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import ="com.model.Item" %>
<%@ page import ="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UPDATE ITEM</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<link rel="stylesheet" type="text/css" href="CSS/AdminStyles.css"> 

<style>

/*top menue, nav bar*/

.form1
{
    font-family: cursive;
    padding: 8px;
    width:60%;
    margin-top: 30px;
    margin-left: 250px;
    margin-bottom: 40px
}

.form2
{
margin-top: 25px;
background-color:rgb(168, 221, 228);
padding:5px 20px 15px 20px;
border:1px solid rgb(106, 196, 248);
border-radius: 20px;

}

.form1 input[type=text]
{
width: 100%;
padding: 5px 10px 15px 15px;
border:1px solid #AA5A9E;
border-radius: 5px;
font-size: 20px;
}

.button1
{
background-color: rgb(177, 21, 21);
color: white;
padding: 12px;
margin: 10px 250px;
border: none;
border-radius: 3px;
cursor: pointer;
font-size: 20px;
}


.button1:hover
{
background-color: rgb(255, 143, 68);
}

*{
    box-sizing: border-box;
}
</style>

</head>


<body>
<!----------------------------------Start of menue bar--------------------------------->

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

<br><br>

<!--From begin--->
<div class="row1">

<div class="form1">
    
    <div class="form2">

    <b><center><font size="10px">Update Item</font></center></b>
    
    <!-- Get Item Details To an array-->
    <%
	ArrayList<Item> ItmList = new ArrayList();
	ItmList = (ArrayList)request.getAttribute("ItemDetails") ;

	//print Item detalis
	for(Item itm : ItmList)
	{
    %>

  <form method="POST" action="UpdateItem">
    
    <font size="6px">Item ID </font><i class="fas fa-passport fa-2x"></i>
    <input type="text" name="id"  value="<%=itm.getItemId()%>" disabled>

    <font size="6px">Item Name </font><i class="fas fa-file-signature fa-2x"></i>
    <input type="text" name="name" value="<%=itm.getItemName()%>"required>

    <font size="6px">Item Price </font><i class="fas fa-dollar-sign fa-2x"></i></i>
    <input type="text" name="price" value="<%=itm.getItemPrice()%>" required>

    <font size="6px">Item Quantity </font><i class="far fa-arrow-alt-circle-down fa-2x"></i>
    <input type="text" name="qty" value= "<%=itm.getItemQuantity()%>" required>
     
    <font size="6px">Item Supplier </font><i class="fas fa-share-square fa-2x"></i>
    <input type="text" name="supplier" value="<%=itm.getSupplier()%>" required>
    
  <font size="6px">Item Description </font><i class="fas fa-file-alt fa-2x"></i>
  <input type="text" name="des" value="<%=itm.getDescription()%>" required>  
  
   <input type="hidden" name="HiddenId" value="<%=itm.getItemId()%>" >
   <!--
  <b><center><font size="6px">Upload Item Image</font></center></b>
  <input type="file" name="image" class="button1" required>
    --->
    
  <input type="submit" name="upload" value="Update Details" class="button1">
    
  </form>
  
    <% 
	}
	%>

</div>
</div>

</div>

<!--Form ends--->

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
<li class="list2"><a class="nav" href="Item.jsp">ITEM</a></li>
<li class="list2"><a class="nav" href="AddService.jsp">ADD SERVICE</a></li>
<li class="list1"><div class="activeHome"><a class="nav" href="DisplayItem.jsp">UPDATE ITEM</a></div></li>
</ul>

</div>

</footer>

<!--footer End--->

</body>

</html>

