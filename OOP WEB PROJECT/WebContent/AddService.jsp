<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Service</title>

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
  float:
  font-family:Monospace;
  font-size:22px;
  margin: 10px 600px;
  
 
}

input[type=submit]:hover {
  background-color: green;
}

.container {
  border-radius: 5px;
  background-color:#81F7F3;
  padding: 20px;
 /* margin: 10px 450px;*/
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
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
.title{
color: blue;
font-family:cursive;
font-size:20px;
text-align:center;

.placeholder{
color: #303F9F;
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
/* end Form css*/


</style>

</head>


<body>

<!----------------------------------Start of menu bar--------------------------------->
<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>


<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><div class="nav"><a class="nav" href="AllService.jsp">SERVICES</a></div></li>
<li class="list1"><div class="activeHome"><a  class="nav" href="AddService.jsp">ADD SERVICES</a></div></li>
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

<!-- start of the add service form -->

<div class="container">
  <form action="sInsert" method="post">
  <br>
  <div class= "title">
<h2>Add new service Form</h2>
</div>
  <br>
  <div class="row">
    <div class="col-25">
      <label for="fname">ServiceNo</label>
    </div>
    <div class="col-75">
      <input type="text" id="sNo" name="sNo" placeholder="S000" >
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="sName">Service Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="sName" name="sName" placeholder="service name..">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="sDec">Service Description</label>
    </div>
    <div class="col-75">
      <textarea id="sDec" name="sDec" placeholder="Write service description.." style="height:200px"></textarea>
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="sAmount">Service Amount</label>
    </div>
    <div class="col-75">
      <input type="text" id="sAmount" name="sAmount" placeholder="Service Amount">
    </div>
  </div>
  <br>
  <div class="row">
    <input type="submit" value="Add new Service">
  </div>
  <br>
  </form>
</div>
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
<li class="list1"><div class="nav"><a class="nav" href="AllService.jsp">SERVICES</a></div></li>
<li class="list1"><div class="activeHome"><a  class="nav" href="AddService.jsp">ADD SERVICES</a></div></li>
<li class="list1"><div class="nav"><a class="nav" href="DisplayService.jsp">SEARCH SERVICE</a></div></li>

</ul>

</div>

</footer>

<!--footer End--->

</body>

</html>