<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>나눔 공간</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 복사 1 font -->
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>

<!-- 복사2 google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

<!-- 위치 받아오기 -->
<script type="text/javascript">
function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      var latitude = position.coords.latitude;
	      var longitude = position.coords.longitude;
	      var geocode = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+latitude+","+longitude+"&sensor=false&key=AIzaSyD_0NjxlJgulWcZxrKIbqEtYQYTSYbZnX0";

	      jQuery.ajax({
	        url: geocode,
	        type: 'POST',
	           success: function(myJSONResult){
	                    if(myJSONResult.status == 'OK') {
	                        var tag = myJSONResult.results[0].formatted_address;
// 	                        alert(tag);
							
							/*나라 이름 빼기*/
							var index = tag.indexOf(" ");
                       		tag = tag.substr(index);
	                        document.getElementById("my_location").innerHTML = tag;
	                    }
	            }
	    });
	      
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } 
	}
	
	
	getLocation();

//hihi

</script>

<style>
/**복사3*/
.w3-bar-item{
 letter-spacing: 1px;
 font-family: "Nanum Barun Gothic" !important; 
 color: #666666;
 font-style: bold;
}/**자를 부분*/

/* body{ */
/*  letter-spacing: 2px; */
/*  font-family: "Nanum Barun Gothic" !important;  */
/*  color: #666666; */
/* } */

</style>



<body>
<!-- Navbar 복사4-->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="#home" class="w3-bar-item w3-button"><b>SS</b> share space</a>
<!--     <a href="#home" class="w3-bar-item w3-button">내 주변</a> -->
<!--     <a href="#home" class="w3-bar-item w3-button">지역</a> -->
<!--     <a href="#home" class="w3-bar-item w3-button">장소검색</a> -->
<!--     <a href="#home" class="w3-bar-item w3-button">기획전</a> -->
<!--     <a href="#home" class="w3-bar-item w3-button">공간 올리기</a> -->
    
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="#about" class="w3-bar-item w3-button"><i class="material-icons">stars</i></a>
      <a href="#about" class="w3-bar-item w3-button">마이페이지</a>
      <a href="#contact" class="w3-bar-item w3-button">회원가입</a>
      <a href="#home" class="w3-bar-item w3-button">로그인</a><!-- 로그아웃 -->
      
    </div>
  </div>
</div>
<!-- 복사4종료  -->

<!-- Header -->
<header class="w3-display-container w3-content w3-wide" style="max-width:1500px; max-height:800px" id="home">

  <img class="w3-image" src="img/main02.jpg" alt="Architecture" width="1500" height="800">
  <div class="w3-display-middle w3-margin-top w3-center">
<!--     <h1 class="w3-xxlarge w3-text-white"><span class="w3-padding w3-black w3-opacity-min"><b>BR</b></span> <span class="w3-hide-small w3-text-light-grey">Architects</span></h1> -->
    <!-- 검색창 -->
    <div class="w3-container w3-black w3-padding-16 w3-opacity-min">
      <h3>Share Space</h3>
      <div class="w3-row-padding" style="margin:0 -16px;">
        <div class="w3-col m3">
          <label>공간유형</label>
          <input class="w3-input w3-border" type="text" placeholder="Departing from">
        </div>
        <div class="w3-col l3">
          <label >지역</label>
          <input class="w3-input w3-border" type="text" placeholder="Arriving at">
        </div>
        <div class="w3-col l3">
          <label>날짜</label>
          <input class="w3-input w3-border" type="text" placeholder="Arriving at">
        </div>
        <div class="w3-col l1">
          <label>인원</label>
          <input class="w3-input w3-border" type="text" placeholder="Arriving at">
        </div>
        <div class="w3-col l2">
          <label>검색</label>
          <input class="w3-input w3-border" type="text" placeholder="Arriving at">
        </div>
      </div>
      <p><button class="w3-button w3-dark-grey">Search and find dates</button></p>
    </div><!-- 검색 창 -->   
  </div>
  
<!--   <div class="w3-display-bottomleft w3-container w3-amber" -->
<!--    		style="bottom:5%;opacity:0.7;width:100%"> -->
<!--    <h2><b>예약카드4 Good Reasons<br>For travelling with us</b></h2> -->
<!--    <br> -->
<!--   </div> -->

</header>

<!-- 페이지 center-->
<div class="w3-content w3-padding" style="max-width:1564px">
<!--  <div class="w3-content w3-padding" style="max-width:85%">  -->
  
  <!--내 위치-->
  <div class="w3-container w3-padding-16 w3-margin-bottom"  align="center">
    <i class="material-icons" style="color:rgb(255,52,120);">near_me</i>
    <span id="my_location" style="font-size:20px;">내 위치</span>
  </div>
  
  
  
  <!-- 버튼(일반회원) -->
  <div class="w3-container w3-padding-16 w3-content" style="max-width:45%">
  	
  	<div class="w3-quarter w3-center">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">loyalty</i>
  	<p style="margin:2px;">쿠폰/이벤트</p>
  	</a>
  	</div>

  	<div class="w3-quarter w3-center">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">search</i>  	
  	<p style="margin:2px;">공간찾기</p>
  	</a>
  	</div>
  	
  	<div class="w3-quarter w3-center">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">event</i>
  	<p style="margin:2px;">예약내역</p>
  	</a>
  	</div>
  	
  	<div class="w3-quarter w3-center">
  	<a href="#" style="text-decoration: none;">
  	<i class="material-icons" style="font-size:80px;color:#333;">stars</i>
  	<p style="margin:2px;">호스트되기</p>
  	</a>
  	</div>    
  </div>
  
    <!-- 버튼(호스트회원) -->
<!--   <div class="w3-container w3-padding-16 w3-content" style="max-width:45%"> -->
  	
<!--   	<div class="w3-col w3-center" style="width:20%;"> -->
<!--   	<a href="#" style="text-decoration: none;"> -->
<!--   	<i class="material-icons" style="font-size:80px;color:#333;">loyalty</i> -->
<!--   	<p style="margin:2px;">쿠폰/이벤트</p> -->
<!--   	</a> -->
<!--   	</div> -->
  	
<!--   	<div class="w3-col w3-center" style="width:20%;"> -->
<!--   	<a href="#" style="text-decoration: none;"> -->
<!--   	<i class="material-icons" style="font-size:80px;color:#333;">search</i>  	 -->
<!--   	<p style="margin:2px;">공간찾기</p> -->
<!--   	</a> -->
<!--   	</div> -->
  	
<!--   	<div class="w3-col w3-center" style="width:20%;"> -->
<!--   	<a href="#" style="text-decoration: none;"> -->
<!--   	<i class="material-icons" style="font-size:80px;color:#333;">weekend</i> -->
<!--   	<p style="margin:2px;">공간등록</p> -->
<!--   	</a> -->
<!--   	</div> -->
  	
<!--   	<div class="w3-col w3-center" style="width:20%;"> -->
<!--   	<a href="#" style="text-decoration: none;"> -->
<!--   	<i class="material-icons" style="font-size:80px;color:#333;">event_note</i> -->
<!--   	<p style="margin:2px;">공간관리</p> -->
<!--   	</a> -->
<!--   	</div>    -->
  	
<!--   	<div class="w3-col w3-center" style="width:20%;"> -->
<!--   	<a href="#" style="text-decoration: none;"> -->
<!--   	<i class="material-icons" style="font-size:80px;color:#333;">event</i> -->
<!--   	<p style="margin:2px;">예약내역</p> -->
<!--   	</a> -->
<!--   	</div> -->
  	
  	 
<!--   </div> -->


  <!-- Project Section 추천공간-->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">추천 공간</h3>
  </div>

  <div class="w3-row-padding">
    <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		     <div class="w3-display-topleft w3-black w3-padding">Summer House</div>
		     <img src="img/room01.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
    <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-black w3-padding">Brick House</div>
		    <img src="img/room02.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
    <div class="w3-col l4 w3-margin-bottom">
      <a href="#" class="w3-btn" style="padding: 0px">
	      <div class="w3-display-container">
		    <div class="w3-display-topleft w3-black w3-padding">Renovated</div>
		    <img src="img/room03.jpg" alt="House" style="width:100%">
	      </div>
      </a>
    </div>
    
<!--     <div class="w3-col l3 w3-margin-bottom"> -->
<!--       <a href="#" class="w3-btn" style="padding: 0px"> -->
<!-- 	      <div class="w3-display-container"> -->
<!-- 		     <div class="w3-display-topleft w3-black w3-padding">Barn House</div> -->
<!-- 		     <img src="img/room04.jpg" alt="House" style="width:100%">  -->
<!-- 	      </div> -->
<!--       </a> -->
<!--     </div> -->
  </div>




 <!-- Slideshow -->
 <hr/>
  <div class="w3-container">
    <div class="w3-display-container mySlides">
      <img src="img/event02.jpg" style="width:100%; height:30%;">
      <div class="w3-display-topleft w3-container w3-padding-32">
        <span class="w3-white w3-padding-large w3-animate-bottom">Lorem ipsum</span>
      </div>
    </div>
    <div class="w3-display-container mySlides">
      <img src="img/event02.jpg" style="width:100%; height:30%;">
      <div class="w3-display-middle w3-container w3-padding-32">
        <span class="w3-white w3-padding-large w3-animate-bottom">Klorim tipsum</span>
      </div>
    </div>
    <div class="w3-display-container mySlides">
      <img src="img/event02.jpgg" style="width:100%; height:30%;">
      <div class="w3-display-topright w3-container w3-padding-32">
        <span class="w3-white w3-padding-large w3-animate-bottom">Blorum pipsum</span>
      </div>
    </div>

    <!-- Slideshow next/previous buttons -->
    <div class="w3-container w3-dark-grey w3-padding w3-xlarge">
      <div class="w3-left" onclick="plusDivs(-1)"><i class="fa fa-arrow-circle-left w3-hover-text-teal"></i></div>
      <div class="w3-right" onclick="plusDivs(1)"><i class="fa fa-arrow-circle-right w3-hover-text-teal"></i></div>
    
      <div class="w3-center">
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
      </div>
    </div>
  </div>
  <hr/>
  


<!-- End page content -->
</div>


<!-- Footer -->
<footer class="w3-center w3-white w3-padding-50">
  <p><a href="#" title="W3.CSS" target="_blank" class="w3-hover-text-green">Share Space</a></p>
</footer>


<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demodots");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>
</body>

</html>
