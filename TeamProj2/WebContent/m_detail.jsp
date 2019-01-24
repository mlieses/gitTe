<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공간 세부 사항</title>
<!-- w3.css -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- google icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- css -->
<link rel="stylesheet" href="css/m_detail.css">
<!-- jqeury -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- JQuery UI Datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">


<!-- 카카오 맵 script -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=030fe73ff2f443d44661c605e8a0667f"></script>
<!-- jstl -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix='fn' %>
</head>
<body>
<c:set var="hosting" value="${list['0']}"></c:set>
<c:set var="address" value="${list['1']}"></c:set>
<c:set var="bill" value="${list['2']}"></c:set>
<c:set var="option" value="${list['3']}"></c:set>
<c:set var="pic" value="${list['4']}"></c:set>
<c:set var="host" value="${list['5']}"></c:set>
<c:set var="lat" value="${address.a_wdo}"></c:set>
<c:set var="lng" value="${address.a_kdo}"></c:set>
<c:set var="noList" value="${noList}"></c:set>

<jsp:include page="Top.jsp"/>


	<div class="w3-container main-container" style="padding:0;">
		<div class="w3-row row-container">
			<div class="w3-col m6 w3-center img" id="img_div1">
				<div class="scale" id="img_div1-1">
					<img alt="" src="img/c1.PNG" id="img1" onclick="big(1)">
				</div>
			</div>
			<div class="w3-col m6 w3-center" id="img_div2">
				<div class="w3-row row-container" id="row-container2">
					<div class="w3-col m6 w3-center hidden" >
						<div class="scale" id="img_div2-1">
							<img alt="" src="img/c2.PNG" id="img2" onclick="big(2)">
						</div>
					</div>
					<div class="w3-col m6 w3-center hidden">
						<div class="scale" id="img_div2-2">
							<img alt="" src="img/c3.PNG" id="img3" onclick="big(3)">
						</div>
					</div>

					<div class="w3-col m6 w3-center hidden">
						<div class="scale" id="img_div2-3">
							<img alt="" src="img/c4.PNG" id="img4" onclick="big(4)">
						</div>
					</div>
					<div class="w3-col m6 w3-center hidden">
						<div class="scale" id="img_div2-4">
							<img alt="" src="img/d1.PNG" id="img5" onclick="big(5)">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- img modal------------------------------------------------- -->	
	<div id="modal01" class="w3-modal" onclick="this.style.display='none'">
	    <span class="w3-button w3-hover-red w3-xlarge w3-display-topright">&times;</span>
	    <div class="w3-modal-content w3-animate-zoom">
	      <img src="img_snowtops.jpg" id="modalImg" style="width:1000px;height:500px">
	    </div>
	</div>
<!-- img modal------------------------------------------------- -->	
	
<!-- 캐러셀 시작------------------------------------------------- -->
	<div class="w3-container main-slide" style="padding:0;">
		<div class="w3-content w3-display-container" style="width: 100%;height:100%;">
			<img class="mySlides" src="img/c1.PNG" style="width: 100%;height:100%;">
			<img class="mySlides" src="img/c2.PNG" style="width: 100%;height:100%;">
			<img class="mySlides" src="img/c3.PNG" style="width: 100%;height:100%;">
			<img class="mySlides" src="img/c4.PNG" style="width: 100%;height:100%;">
			<img class="mySlides" src="img/d1.PNG" style="width: 100%;height:100%;">
			<div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width: 100%">
				<div class="w3-display-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
				<div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white"	onclick="currentDiv(1)"></span>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white"	onclick="currentDiv(2)"></span>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white"	onclick="currentDiv(3)"></span>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white"	onclick="currentDiv(4)"></span>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white"	onclick="currentDiv(5)"></span>
			</div>
		</div>
	</div>
	<!-- 캐러셀 끝------------------------------------------------- -->
	
	
	<div class="w3-content content-center">
		<div class="w3-content content-header">
			<div class="w3-row" style="height:100%;">
				<div class="w3-threequarter w3-content" style="height:100%;">
					<div class="w3-content header-small">
						<h4>${hosting.room}</h4>
					</div>
					<div class="w3-content header-subject">
						${hosting.subject}
					</div>
					<div class="w3-content header-small">
						${address.a_address}
					</div>
				</div>
				<div class="w3-quarter w3-container">
					<!-- click 이벤트 추가 하기 -->
					<div class="w3-container host-profile">
						<img src="img/profile.jpg" class="w3-circle" alt="Car" style="width: 100px">
						<h2>${host.host_nic}</h2>
					</div>
				</div>
			</div>
		</div>
		
<!-- time content ------------------------------------------------->
		<div class="w3-content content-time">
			<div class="w3-content time-subject">
			<h3>예약 가능 여부</h3>
			</div>
			<div class="w3-row time-date">
				<div class="w3-half w3-container date1">
					<div id="datepicker1"></div>
					
				</div>
				<div class="w3-half w3-container map">
					<div id="map"></div>
					<input type="hidden" id="lat" value="${lat}">
					<input type="hidden" id="lng" value="${lng}">
				</div>
			</div>
			<div class="w3-content time w3-center">
				<button class="w3-button w3-white w3-border t_btn" id="1">10:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="2">11:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="3">12:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="4">13:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="5">14:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="6">15:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="7">16:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="8">17:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="9">18:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="10">19:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="11">20:00</button>
				<button class="w3-button w3-white w3-border t_btn" id="12">21:00</button>
			</div>
		</div>
<!-- time content ------------------------------------------------->
		
<!-- option content ------------------------------------------------->		
		<div class="w3-content content-option">
			<div class="w3-content option">
				<div>
					<i class="material-icons">group</i>
				</div>
				<div style="margin-right:20px;">
					&nbsp;<b>${hosting.people}명</b>
				</div>
				<div>	
					<i class="material-icons">local_drink</i>
				</div>
				<div style="width:140px;">
					&nbsp;<b>기본음료 제공<c:if test="${hosting.drink eq 0}"> : X</c:if>
									  <c:if test="${hosting.drink eq 1}"> : 0</c:if>
						</b>
				</div>
			</div>
			<div class="w3-content option-amenities">
				<div>
					<b>편의시설</b>
				</div><br>
				<div class="amenities">
					<div id="elevator">
						<img src="https://img.icons8.com/metro/50/000000/elevator.png">
						엘리베이터
					</div>
					<div id="socket">
						<img src="https://img.icons8.com/metro/26/000000/wall-socket.png">
						콘센트
					</div>
					<div id="airconditioner">
						<img src="https://img.icons8.com/metro/26/000000/air-conditioner.png">
						에어컨
					</div>
					<div id="heating">
						<img src="https://img.icons8.com/metro/26/000000/heating.png">
						난방
					</div>
					<div id="toilet">
						<img src="https://img.icons8.com/metro/26/000000/toilet.png">
						화장실
					</div>
				</div>
			</div>
			<div class="w3-content option-charge">
				<div>
					<b>유료옵션</b>
				</div><br>
				<div class="charge">
					<div id="wifi">
						<img src="https://img.icons8.com/metro/26/000000/wifi.png">
						무선인터넷
					</div>
					<div id="projector">
						<img src="https://img.icons8.com/metro/26/000000/video-projector.png">
						프로젝터 빔
					</div>
					<div id="laptop">
						<img src="https://img.icons8.com/metro/26/000000/laptop.png">
						노트북 대여
					</div>
					<div id="cabinet">
						<img src="https://img.icons8.com/metro/26/000000/filing-cabinet.png">
						사물함
					</div>
					<div id="parking">
						<img src="https://img.icons8.com/metro/26/000000/parking.png">
						주차
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- option content ------------------------------------------------->	
<!-- footer content ------------------------------------------------->	
	
	<footer class="w3-container w3-dark-gray foot">
		<div class="w3-content foot-content" >
			<div class="w3-row foot-row">
				<div class="w3-col m10 foot-price">
					hi
				</div>
				<div class="w3-col m2 reservation-req">
					<div class="w3-container">
						<button class="w3-button w3-white w3-center w3-border w3-xlarge" id="req-btn" ><b>예약</b></button>
					</div>
				</div>
			</div>
		</div>
	</footer>

	


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/m_detail_slide.js"></script>
<script type="text/javascript">
	var num = '${hosting.room_no}';
	var disabledDays = [];
	var i =0;
	<c:forEach items="${noList}" var="item1">
		disabledDays[i] = "${item1}";
	</c:forEach>
	
	
	var list = new Array();
	var s_date;
	
	optionDisplay();
// 	var disabledDays = ["2019-1-24","2019-1-25"];
	
	function disableAllTheseDays(date) {
	    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
	    for (i = 0; i < disabledDays.length; i++) {
	        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
	            return [false];
	        }
	    }
	    return [true];
	}
	
	$("#datepicker1").datepicker({
		minDate: 0,
		maxDate: 7,
		dateFormat: 'yy-mm-dd',
		beforeShowDay: disableAllTheseDays,
		onSelect: function(date) {
			s_date=date;
			nonBtn(date)
// 	         alert(date);
	    }   

	});
	
	 function nonBtn(date){
		 $.ajax({
	        url:'TimeSpaceController',
	        type:'post',
	        data:{"date":date, "room_no":num},
	        success : function(data){
	        
	        	var json = JSON.parse(data);
	        	
	        	$(".t_btn").attr("disabled",false);
	        	for(var i=1;i<13;i++){
	        		if(json[i]==1){
	        			$(".t_btn").eq(i).attr("disabled",true);
	        		}
	        	}
	        }
	     }); 
	 }
	 
	 /*시간 버튼 클릭 했을때 값 추출*/
	 $(".t_btn").on("click", function(event){
		
		 var target = $(event.target);
		 if(target.hasClass("w3-grey")){
			 var num = list.indexOf(target.attr("id"));
			 list.pop(num);
			target.removeClass("w3-grey");
		 }else{
		 	target.addClass("w3-grey");
		 	list.push(target.attr("id"));
		 }
		 list.forEach(function(element) {
			  console.log(element);
			});
	 })
	 
/* option 표시 */
//  	alert(typeof(${hosting.elevator})); //number
	function optionDisplay(){
		//무료
		if(${hosting.elevator}==0){
			$("#elevator").css("display", "none")
		}
		if(${hosting.toilet}==0){
			$("#toilet").css("display", "none")
		}
		if(${hosting.airconditioner}==0){
			$("#airconditioner").css("display", "none")
		}
		if(${hosting.socket}==0){
			$("#socket").css("display", "none")
		}
		//유료옵션
		if(${option.parking}==0){
			$("#parking").css("display", "none")
		}
		if(${option.wifi}==0){
			$("#wifi").css("display", "none")
		}
		if(${option.projector}==0){
			$("#projector").css("display", "none")
		}
		if(${option.laptop}==0){
			$("#laptop").css("display", "none")
		}
		if(${option.cabinet}==0){
			$("#cabinet").css("display", "none")
		}
	}
</script>
</body>
</html>
