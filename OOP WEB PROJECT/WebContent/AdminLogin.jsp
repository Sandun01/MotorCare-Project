<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Admin Login From</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>

body
{
  background-image: url('Pictures/AdminLogin.png');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}

/*------Back button text------------------*/
.Text1
{
color: #000;
font-size: 20px;
position: absolute;
top: 0;
right:10px;
background: #fff;

}

.Text1 .Text2:hover
{
background:#08FF77;
}

.Text2
{
display:block;
color: #000;
font-size:50px;
text-decoration: none;
background: #fff;

}

/*------End of Back button text------------------*/

h1{
	margin:10px;
	padding:0 0 20px;
	text-align:center;
	font-size:50px;
	font-family:cursive;
	
}

h2{
	margin:0px;
	padding:0px 0px 30px 0px;
	text-align:center;
	font-size:30px;
	font-family:cursive;
	color:#1EB863;
	
}

.login{
	width:320px;
	height:420px;
	background: #fff;
	color:#420342;
	top:100%;
	left:50%;
	box-sizing:border-box;
	padding:50px 30px;
	border:4px solid #420342;
}

.login p{
	
	margin:0;
	padding:5;
	font-weight:bold;
	font-size:20px;
	
}

.login input{
	width:100%;
	margin-bottom:20px;

}

.login input[type="text"], input[type="password"]
{
	border:none;
	border-bottom:1px solid #000;
	background:transparent;
	outline:none;
	height:40px;
	color:#002EC2;
	font-size:16px;
}

.login input[type ="submit"]
{
	border:none;
	outline:none;
	height:40px;
	background:#420342;
	color:#fff;
	font-size:18px;
	border-radius:20px;
}
.login input[type ="submit"]:hover
{
	cursor:pointer;
	background:#F15454;
	color:#000;
	
}

.login a{
	text-decoration:none;
	font-size:12px;
	line-height:20px;
	color:rgb(185, 13, 13);
}

.login a:hover
{
	color:rgb(245, 0, 0);
	
}

::placeholder
{
color: #002584;
}


</style>

</head>

<body>
<!---------------------------------Check message to display--------------------------------->
<% 

String Emsg = (String)request.getAttribute("Message");

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

<div class="Text1"><a class="Text2" href="Interface.jsp">Back <i class="fas fa-sign-out-alt"></i></a></div>

<div class="image">

<center>
<h1>Admin Login Form</h1>
</center>

<br>

<!--user login begins-->


<center>
<div class="login">

<h2>Login Here</h2>


<form method='POST' action='adminLogin'>

<p>User Name</p>
<input type = "text" name="username" placeholder="Enter Username" required>

<P>Password</p>
<input type = "password" name="password" placeholder="Enter Password" required>

<a href="forget">Forget Your Password?</a>

<br><br>

<input type="submit" name="" value="Login">
</form>

</div>
</center>

<!--user login ends-->
</div>


</body>
</html>