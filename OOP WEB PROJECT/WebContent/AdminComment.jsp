<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.service.CustomerService" %>
<%@ page import ="com.model.Comment" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Comments</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>

/*-----------Table--------------*/
#com
{
font-family: "Calibri";
font-size: 25px;
width: 100%;
border-collapse: collapse;
}

#com td, #com th
{
border: 1px solid #ddd;
padding: 15px;
}

#com tr:hover
{
background-color: #FDFFC3;
}

#com th
{
padding-top: 15px;
padding-bottom : 15px;
text-align : Center;
background-color:#5F0088;
color: white;
}

input[type=submit]
{
background-color:#E13E3E;
color: white;
padding:12px 20px;
border: none;
cursor: pointer;
font-size: 20px;
}

input[type=submit]:hover
{
background-color:#F18C8C;
}

</style>

</head>

<body>
<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>
 
  <!----------------------------------Start of menue bar--------------------------------->

<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><a class="nav" href="AdminHome.jsp">HOME</a></li>
<li class="list1"><a class="nav" href="AllService.jsp">SERVICES</a></li>
<li class="list1"><a class="nav" href="Item.jsp">ITEMS</a></li>
<li class="list1"><div class="activeHome"><a class="nav" href="AdminComment.jsp">COMMENTS</a></div></li>

</ul>

<!---Sub Menue(Cart,Profile)--->
<div class="Text1">
<a class="Text2" href="AdminLogout">Log Out<i class="fas fa-sign-out-alt fa-2x"></i></a>
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

<table id="com">

<tr>
 <th>Customer</th>
 <th>Email</th>
 <th>Comment</th> 
 <th>Delete</th> 
</tr>

<%
ArrayList<Comment> li = CustomerService.DisplayComments();

if(li.size() > 0 )
{
	for(Comment c1: li)
	{
	%>
	<tr><td><%=c1.getUsername() %></td>
	<td><%=c1.getEmail() %></td>
	<td><%=c1.getComment() %></td>
	
<td>
	<!-- button for delete item -->
<form method = "POST" action="DeleteComment">
<input type="hidden" name="name" value="<%=c1.getUsername() %>">
<input type="submit" class="btnD" value="Delete Comment">
</form>

</td></tr>

<%
	}
	}
%>	

</table>

<br>

<!--------------------Import footer------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminFooter.jsp"></jsp:include>
 
 
</body>

</html>