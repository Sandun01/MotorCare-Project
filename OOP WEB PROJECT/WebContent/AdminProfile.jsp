<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import ="java.util.ArrayList"%>
 <%@page import ="com.service.AdminServiceImpl"%>
 <%@page import ="com.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile</title>
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

.details input[type="password"], .details input[type="text"], .form input[type="password"], .form input[type="text"]
{ 
  	font-family: Arial;
  	font-size: 35px;
}

input.checkbox, #Chpwd1, #Chpwd2, #Chpwd3
{
	width: 40px;
	height: 40px;
}

.form
{
  	font-family: Arial;
  	font-size: 35px;
	font-family: cursive;
  	width:60%;
	margin-top: 30px;
  	margin-left: 250px;
  	margin-bottom: 40px;
	padding:5px 20px 15px 20px;
	background-color:rgb(168, 221, 228);
}

#submit
{
background-color:#B14C06;
color: white;
padding: 12px;
margin: 10px 250px;
border: none;
border-radius: 3px;
cursor: pointer;
font-size: 20px;
}

#submit:hover
{
background-color:#E70404;
}

.addBTN
{
background-color:#DB1212;
color:#000;
text-align:center;
font-size:25px;
padding:13px 16px;
text-decoration: none;
}

.ViewBTN
{
background-color:#29A61C;
color:#000;
text-align:center;
font-size:25px;
padding:13px 16px;
text-decoration: none;
}

.ViewBTN:hover
{
background-color:#BADDF5;
}
.addBTN:hover
{
background-color:#DEBAF5;
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

<%
//declaring variables
	String post = null,Pwd = null,name = null,email = null,phone = null;
	String un = null;
	un =(String)session.getAttribute("username");

//declare arry list object
	ArrayList<Admin> list = AdminServiceImpl.getReleventAdmin(un);

	//assign values to variables
	for(Admin admin : list)
	{
		Pwd= admin.getPassword();
		post = admin.getPost();
		name = admin.getName();
		email = admin.getEmail();
		phone = admin.getPhone();
	}

%>

<%
if(post.equals("main")) 
{
%>

<div class="details">
<u><center><h1>Main Admin Profile</h1></center></u>

<a href="AddNewAdmin.jsp" class="addBTN">Add New Sub Admin</a>
<a href="viewAllAdmin.jsp" class="ViewBTN">View All Sub Admins</a>

<h2>Username : <%=un %> </h2>
<h2>Password: 

<input type="password" id="pwd" value= "<%=Pwd %>" maxlenth="10" size="4">
<input type="checkbox" onclick="Showfunction('pwd')" class="checkbox"> Show Password <i class="fas fa-eye-slash"></i>
</h2>

</div>

<script>
function Showfunction(id)
{
	var x = document.getElementById(id);

	if(x.type == "password")
	{
		x.type = "text";
	}
	else
	{
		x.type = "password";
	}

}

</script>

<div class = "form" >

<form action = "mainAdminUpdate" method = "Post">
<u><center><h3>Change Password</h3></center></u>

<table>
<tr>
<th>Current Password</th>
<th><input type="password" id="pwd1" value ="<%=Pwd %>" maxlenth="10" size="10" disabled><br></th>
<th><input type="checkbox" onclick="Showfunction('pwd1')" id="Chpwd1"><i class="fas fa-eye-slash"></i></th>
</tr>

<tr>
<th>New Password</th>
<th><input type="password" id="pwd2" name = "NPwd1" maxlenth="10" size="10" required></th>
<th><input type="checkbox" onclick="Showfunction('pwd2')" id="Chpwd2"><i class="fas fa-eye-slash"></i></th>
</tr>

<tr>
<th>Re-Enter New Password</th>
<th><input type="password" id="pwd3" name = "NPwd2" maxlenth="10" size="10" required></th>
<th><input type="checkbox" onclick="Showfunction('pwd3')" id="Chpwd3"><i class="fas fa-eye-slash"></i></th>
</tr>

<input type="hidden" name="CPwd" value="<%=Pwd %>">
<input type="hidden" name="un" value="<%=un %>">

</table>
<br>
<input type="submit" value="Change Password" id="submit">
</form>

</div>

<%
}

else
{
%>

<script>
function Showfunction(id)
{
	var x = document.getElementById(id);

	if(x.type == "password")
	{
		x.type = "text";
	}
	else
	{
		x.type = "password";
	}

}

</script>

<div class="details">
<div class="det1" style="margin-left:30px;">
<u><center><h1>Update Admin Profile</h1></center></u>
<h2>Username : <%=name %> </h2>
<h2>Name: <%=name %> </h2>
<h2>Email: <%=email %> </h2>
<h2>Phone: <%=phone %> </h2>

<h2>Password: 
<input type="password" id="pwd" value= "<%=Pwd %>" maxlenth="10" size="10" disabled>
<input type="checkbox" onclick="Showfunction('pwd')" class="checkbox"> Show Password <i class="fas fa-eye-slash"></i>
</h2>

<br>
<br>
<a href="UpdateSubAdmin.jsp" class="ViewBTN">Update Admin Details</a>
<br>
<br>

<form action="deleteSubAmin" method="post">
<input type="hidden" name="un" value="<%=un %>">
<input type="submit" value="Delete Admin" id="submit" style="margin-left:30px;">
</form>

<br>
<br>
</div>
</div>


<%
}
%>

<!--------------------Import footer------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminFooter.jsp"></jsp:include>


</body>
</html>