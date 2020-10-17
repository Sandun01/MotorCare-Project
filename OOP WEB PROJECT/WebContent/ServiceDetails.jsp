<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>
/* start Form css*/

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid white;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #3949AB ;
  color:white;
  padding: 10px 50px;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  float: center;
  font-family:Monospace;
  font-size:22px;
  margin: 10px 500px;
  
 
}

input[type=submit]:hover {
  background-color: #00aaff;
}

.container {
  border-radius: 100px;
  outline-color:blue;
  /*background-color:#4FC3F7 ;*/
  padding: 10px;
  margin: 10px 300px;
  width:75%;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
  color: blue;
  font-family:Monospace;
  font-size:20px;
  text-align:left;
}

.col-75 {
  float: left;
  width: 65%;
  margin-top: 10px;
  font-size:20px;
  color:#8181F7;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
.title{
color: White;
font-family:cursive;
font-size:30px;
text-align:70px;

}

.placeholder{
color: white;
font-family:cursive;
font-size:18px;
}

}
@media screen and (max-width: 100px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

.body{
background-image:url('Pictures/car1.jpg');
margin-top:10px;
margin-bottom:10px;
}
/* end Form css*/


</style>

</head>


<body>
<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>

<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><div class="nav"><a class="nav" href="AllService.jsp">SERVICES</a></div></li>
<li class="list1"><div class="nav"><a  class="nav" href="AddService.jsp">ADD SERVICES</a></div></li>
<li class="list1"><div class="activeHome"><a class="nav" href="DisplayService.jsp">SEARCH SERVICE</a></div></li>

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

<div class="body">
<br><br>

	<c:forEach var="service" items="${serviceDetails}">
	
	<c:set var="serviceNo" value = "${service.serviceNo}"/>
	<c:set var="serviceName" value = "${service.serviceName}"/>
	<c:set var="servicedescription" value = "${service.servicedescription}"/>
	<c:set var="serviceAmount" value = "${service.serviceAmount}"/>
		
	<div class="container">
  	<br>
  	<div class= "title">
	<h2>Display Service Details</h2>
	</div>
  	<br>

  	<div class="row">
    <div class="col-25">
    <label>Service Number</label>
    </div>
    <div class="col-75">
    <label>${service.serviceNo}</label>
    </div>
  	</div>
  	<br>

	<div class="row">
    <div class="col-25">
    <label>Service Name</label>
    </div>
    <div class="col-75">
    <label>${service.serviceName}</label>
    </div>
  	</div>
  	<br>
	
	<div class="row">
    <div class="col-25">
    <label>Service Description</label>
    </div>
    <div class="col-75">
    <label>${service.servicedescription}</label>
    </div>
  	</div>
  	<br>

	<div class="row">
    <div class="col-25">
    <label>Service Amount</label>
    </div>
    <div class="col-75">
    <label>${service.serviceAmount}</label>
    </div>
  	</div>
  	<br>
	</div>
	</c:forEach>

    <c:url  value="UpdateService.jsp" var = "sUpdate">
    
    	<c:param name = "serviceNo" value = "${serviceNo}"/>
    	<c:param name = "serviceName" value = "${serviceName}"/>
    	<c:param name = "servicedescription" value = "${servicedescription}"/>
    	<c:param name = "serviceAmount" value = "${serviceAmount}"/>
    	
    </c:url>
    
     <c:url  value="DeleteService.jsp" var = "sDelete">
    
    	<c:param name = "serviceNo" value = "${serviceNo}"/>
    	<c:param name = "serviceName" value = "${serviceName}"/>
    	<c:param name = "servicedescription" value = "${servicedescription}"/>
    	<c:param name = "serviceAmount" value = "${serviceAmount}"/>
    	
    </c:url>
<table>
<tr>
<td>
	<a href = "${sUpdate}">
	<input class="row1" type ="submit" name ="update" value="Update Service Details">
	</a>
	</td>
</tr>
<tr>
	<td>
	<a href = "${sDelete}">
	<input class="row1" type ="submit" name ="delete" value="Delete Service Details">
	</a>
	</td>
</tr>
</table>
	
</div>
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
<li class="list2"><a class="nav" href="AllService.jsp">SERVICES</a></li>
<li class="list2"><a class="nav" href="AddService.jsp">ADD SERVICES</a></li>
<li class="list1"><div class="activeHome"><a class="nav" href="DisplayService.jsp">SEARCH SERVICE</a></div></li>
</ul>

</div>

</footer>

<!--footer End--->
</div>
</body>

</html>