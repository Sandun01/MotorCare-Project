<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Admin Profile</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

</head>

<style>

/*---remove border of pwd field----- */
#pwd
{
	border: 0px none;
}

.details
{
  	font-family: cursive;
  	padding: 8px;
  	width:60%;
  	margin-top: 30px;
  	margin-left: 250px;
  	margin-bottom: 40px;
  	background-color: #f2f4a2;
  	font-size: 25px;
}

.details input[type="password"], .details input[type="text"], .form input[type="password"], .form input[type="text"],.form input[type="email"],.form input[type="number"]
{ 
  	font-family: Arial;
  	font-size: 35px;
}


.form
{
  	font-family: Arial;
  	font-size: 35px;
	font-family: cursive;
  	width:100%%;
	margin-top: 30px;
  	margin-left: 10%;
  	margin-right: 10%;
  	margin-bottom: 40px;
	padding:5px 20px 15px 20px;
	background-color:rgb(168, 221, 228);
}

#submit
{
background-color:#B14C06;
color: white;
padding: 12px;
margin-left:40%;
border: none;
border-radius: 3px;
cursor: pointer;
font-size: 20px;
}

#submit:hover
{
background-color:#E70404;
}

</style>

<body>
<!----------------------------------Start of menue bar--------------------------------->

<!---------------------------------Check message to display--------------------------------->
<% 

String Emsg = (String)request.getAttribute("msg");

if(Emsg != null)
{	
%>	

<script type="text/javascript">
var message = "<%=Emsg%>";
alert(message);

</script>

<% 
} 

%>

<!---------------------------------End Check message to display--------------------------------->

<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>
  
<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><a class="nav" href="AdminHome.jsp">HOME</a></li>
<li class="list1"><a class="nav" href="AllService.jsp">SERVICES</a></li>
<li class="list1"><a class="nav" href="Item.jsp">ITEMS</a></li>
<li class="list1"><a class="nav" href="AdminComment.jsp">COMMENTS</a></li>

</ul>

<!---Sub Menue(Cart,Profile)--->
<div class="Text1">
<a class="Text2" href="AdminLogout">Log Out<i class="fas fa-sign-out-alt fa-2x"></i></a>
</div>

<div class="profile"><div class="activeHome">
<a class="profile1" href="AdminProfile.jsp">AdminProfile<i class="fas fa-user-circle fa-2x"></i></a></div>
</div>

</div>

</div>

</div>
<!--end of Sub Menue(Cart,Profile)-->

<!--end of menue bar-->

<div class="details">
<u><center><h1>Add New Admin</h1></center></u>

<div class = form>

<form action = "addNewAdmin" method = "Post">
<u><center><h3>Add New Admin Details</h3></center></u>

<table>
<tr>
<th>Username</th>
<th><input type="text" name ="un"  placeholder="Username" maxlenth="10" size="10" ><br></th>
</tr>
<tr>
<th>Password</th>
<th><input type="password" name ="pwd"  placeholder="Password" maxlenth="10" size="10" ><br></th>
</tr>
<tr>
<th>Name</th>
<th><input type="text" name ="name"  placeholder="Name" maxlenth="10" size="10" ><br></th>
</tr>
<tr>
<th>Email</th>
<th><input type="email" name ="email"  placeholder="Email" maxlenth="10" size="10" ><br></th>
</tr>
<tr>
<th>Phone</th>
<th><input type="number" name ="phone"  placeholder="Phone" maxlenth="10" size="10" ><br></th>
</tr>

</table>
<br>
<input type="submit" value="Add New Admin" id="submit">
</form>

</div>

</div>

<!--------------------Import footer------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminFooter.jsp"></jsp:include>


</body>
</html>