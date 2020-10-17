
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import ="java.util.ArrayList"%>
 <%@page import ="com.service.AdminServiceImpl"%>
 <%@page import ="com.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Admin details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

</head>

<style>

/*---remove border of pwd field----- */
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

/*----admin Details Table-----*/

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
<u><center><h1>View All Admin</h1></center></u>

<a href="AddNewAdmin.jsp" class="addBTN">Add New Sub Admin</a>

<br><br>
<%
//declare arry list object
	ArrayList<Admin> li = AdminServiceImpl.getAllSubAdmin();

	//assign values to variables
	if(li.size() > 0)
	{

%>
<table id="item">

<tr>
<th>Admin Uername</th>
<th>Admin Name</th>
<th>Admin Email</th>
<th>Admin Phone</th>
<th>Edit Admin</th>

</tr>

<%

for(Admin a : li)
{	
	String post = a.getPost();
	
	if(post.equals("main") == false)
	{
%>


<tr>
<td><%=a.getUsername() %></td>
<td><%=a.getName() %></td>
<td><%=a.getEmail() %></td>
<td><%=a.getPhone() %></td>

<td> 
<!-- button for update item -->


<form method = "POST" action="adminDeleteSubAdmin">
<input type="hidden" name="un" value="<%=a.getUsername() %>">
<input type="submit" class="btnD" value="Delete Sub Admin">
</form>

</td>

</tr>

<% }
   }
}
   %>

</table>


<!--------------------Import footer------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminFooter.jsp"></jsp:include>


</body>
</html>