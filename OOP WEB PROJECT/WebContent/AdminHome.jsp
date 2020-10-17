<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">

<style>

/*------------------Slide show-----------------------------*/
*{
box-sizing: border-box
}

.mySlides
{
display: none;
}

img {
vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
  max-width: 1600px;
  max-height:1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
/*-------------------End slide show-------------------*/

</style>

</head>
<body>

<!--------------------Import header------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminHeader.jsp"></jsp:include>
 
 <!----------------------------------Start of menue bar--------------------------------->

<!----------------------------------Main Menue bar--------------------------------------->
<div class="nav1">
<ul class="nav2">
<li class="list1"><div class="activeHome"><a class="nav" href="AdminHome.jsp">HOME</a></div></li>
<li class="list1"><a class="nav" href="AllService.jsp">SERVICES</a></li>
<li class="list1"><a class="nav" href="Item.jsp">ITEMS</a></li>
<li class="list1"><a class="nav" href="AdminComment.jsp">COMMENTS</a></li>

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
 
 
<!-- -Slide show begins -->
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 5</div>
  <img src="Pictures/report.png" style="width:100%" width="1200px" height="700">
  <div class="text">Image 1</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 5</div>
  <img src="Pictures/img.jpg" style="width:100%"  width="1200px" height="700">
  <div class="text">Image 2</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 5</div>
  <img src="Pictures/img3.jpg" style="width:100%"  width="1200px" height="700">
  <div class="text">Image 3</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 5</div>
  <img src="Pictures/img5.jpg" style="width:100%"  width="1200px" height="700">
  <div class="text">Image 4</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 5</div>
  <img src="Pictures/img4.jpg" style="width:100%"  width="1200px" height="700">
  <div class="text">Image 5</div>
</div>


<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
</div>

<!-- Slide show script -->
<script>
var slideIndex = 1;
var timer = null;
showSlides(slideIndex);

function plusSlides(n) {
  clearTimeout(timer);
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  clearTimeout(timer);
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n==undefined){n = ++slideIndex}
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  timer = setTimeout(showSlides, 3000);
} 
</script>
<!-- End of slide show script -->

<!-- --Slide show ends -->


<!--------------------Import footer------------------------------------------------------- -->
 <jsp:include page="/WEB-INF/views/AdminFooter.jsp"></jsp:include>

</body>

</html>