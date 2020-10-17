<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD ITEM</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>
/*----From-----*/
.row1
{
background-image: url(Pictures/services.jpg);
background-position: center;
background-repeat: repeat;
background-size: 200px 200px;
}

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
/*----End of From-----*/

/*End of Admin Add Item Page*/

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

<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>

<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><a class="nav" href="Item.jsp">ITEM</a></li>
<li class="list1"><div class="activeHome"><a class="nav" href="AddItem.jsp">ADD ITEM</a></div></li>
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


<!--From begin--->
<div class="row1">

<div class="form1">
    
    <div class="form2">

    <b><center><font size="10px">Add Item</font></center></b>

  <form method="POST" action="AddItem">
    

    <!--
    <font size="6px">Item ID </font><i class="fas fa-passport fa-2x"></i>
    <input type="text" name="id"  placeholder="id" required>
	--->
	
    <font size="6px">Item Name </font><i class="fas fa-file-signature fa-2x"></i>
    <input type="text" name="name" placeholder="name"required>

    <font size="6px">Item Price </font><i class="fas fa-dollar-sign fa-2x"></i></i>
    <input type="text" name="price" placeholder="price" required>

    <font size="6px">Item Quantity </font><i class="far fa-arrow-alt-circle-down fa-2x"></i>
    <input type="text" name="qty" placeholder="quantity" required>
     
    <font size="6px">Item Supplier </font><i class="fas fa-share-square fa-2x"></i>
    <input type="text" name="supplier" placeholder="Supplier" required>
    
  <font size="6px">Item Description </font><i class="fas fa-file-alt fa-2x"></i>
  <input type="text" name="des" placeholder="Description" required>
   
   <!--
  <b><center><font size="6px">Upload Item Image</font></center></b>
  <input type="file" name="image" class="button1" required>
    --->
    
  <input type="submit" name="upload" value="Add Item" class="button1">
    
  </form>

</div>
</div>

</div>

<!--Form ends--->


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
<li class="list2"><div class="activeHome"><a class="nav" href="AddItem.jsp">ADD ITEM</a></div></li>
<li class="list1"><a class="nav" href="DisplayItem.jsp">UPDATE ITEM</a></li>
</ul>

</div>

</footer>

<!--footer End--->

</body>

</html>

