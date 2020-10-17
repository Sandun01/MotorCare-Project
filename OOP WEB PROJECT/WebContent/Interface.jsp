<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main Interface</title>

<link rel="icon" href="pictures/logo.jpg">

<style>

*{
box-sizing: border-box;
}

body
{
  background-image: url('Pictures/interfaceBakcground.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}

.Column1
{
 float: left;
 width: 50%;
 padding:50px 30px;
}

.row1
{
margin:10px 130px;
}

.card1,.card2
{
cursor: pointer;
box-shadow:0 4px 8px 0;
padding: 16px;
text-align: center;
background-color:none;
}

/*--------------------------*/

.card1,.card2
{
  max-width: 500px;
  max-height:400px;
  min-width: 500px;
  min-height:400px;
  position: relative;
  margin: auto;
}

.card1:hover
{
background-color:#0BE473;
}

.card2:hover
{
background-color:#FF7700;
}

</style>

<script>
function linkpages1()
{
	location.href="Home.jsp";
}

function linkpages2()
{
	location.href="AdminLogin.jsp";
}
</script>

</head>

<center><img src="Pictures/logo.jpg"  width="300px" height="150"></center>

<center><font size="30px" face="Cursive">Main User Interface</font></center>

<div class="row1">
 
 <div class="Column1">
 
   <div class="card1" onclick="linkpages1()">
   
    <b>
	 <font size="8px" face="cursive">View Web Page</font></b>
	
	 <img src="Pictures/cart.png" width="300px" height="300px">
	 </br>

	</div>
	
 </div>
 
<div class="Column1">

   <div class="card2" onclick="linkpages2()">
   
    <b>
	 <font size="8px" face="cursive">Administration</font>
	 </b>
    <img src="Pictures/admin1.png" width="300px" height="300px">
	 </br>
	
	</div>
	
 </div>
 
 </div>

</body>
</html>