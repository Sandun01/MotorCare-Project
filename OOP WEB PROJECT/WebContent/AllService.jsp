<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display all service</title>

<style>

/* start the table css*/
.table{
  border:10px;
  display: table;
  border-collapse: separate;
  border-spacing: 10px;
  border-color: #1A237E;
}
.row1{
background-color:#4FC3F7 ;
font-size:25px;
font-family:fantasy;

}
.row2{
background-color:#B3E5FC ;
font-size:20px;
font-family:Century Gothic;
}
/* End the table css*/
</style>
</head>

<body>
<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>

<!----------------------------------Start of menue bar--------------------------------->

 
<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><div class="activeHome"><a class="nav" href="AllService.jsp">SERVICES</a></div></li>
<li class="list1"><div class="nav"><a  class="nav" href="AddService.jsp">ADD SERVICES</a></div></li>
<li class="list1"><div class="nav"><a class="nav" href="DisplayService.jsp">SEARCH SERVICE</a></div></li>

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

<br><br>
<table border="1" class ="table">
	
	<tr class ="row1">
	<td> Service Number </td>
	<td> Service Name</td>
	<td> Service Description</td>
	<td> Service Amount </td>
	</tr>
	
	
	<%
	Connection conn =null;
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/motorcare","root","root");
	Statement state = null;
	ResultSet result =null;
	
	try{
		state = conn.createStatement();
		String strSql = "select * from service";
		result= state.executeQuery(strSql);
		
		while(result.next()){
			%>
			
							
				<tr class= "row2">
					<td><%= result.getString(1) %> </td>
					<td><%= result.getString(2) %> </td>
					<td><%= result.getString(3) %> </td>
					<td><%= result.getString(4) %> </td>
					
					
				</tr>
<%}}catch(Exception e){
	e.printStackTrace();
}%>
</table>
<br>
<br>

<!--footer begin--->

<footer id='footer1'>

<div class="foot">

<div class="socialmedia">
<a class="socialmedia1" href="https://www.facebook.com"><i class="fab fa-facebook-square fa-2x"></i></a>

<a class="socialmedia1" href="https://www.instagram.com"><i class="fab fa-instagram fa-2x"></i></a>
<a class="socialmedia1" href="https://twitter.com/login"><i class="fab fa-twitter-square fa-2x"></i></a>
<a class="socialmedia1" href="https://www.google.com/intl/si/gmail/about/#"><i class="fab fa-google-plus-square fa-2x"></i></a>
<a class="socialmedia1" href="https://www.whatsapp.com"><i class="fab fa-whatsapp-square fa-2x"></i></a>
</div>

<ul class="nav3">
<li class="list1"><div class="activeHome"><a class="nav" href="AllService.jsp">SERVICES</a></div></li>
<li class="list1"><div class="nav"><a  class="nav" href="AddService.jsp">ADD SERVICES</a></div></li>
<li class="list1"><div class="nav"><a class="nav" href="DisplayService.jsp">SEARCH SERVICE</a></div></li>

</ul>

</div>

</footer>

<!--footer End--->
</body>
</html>