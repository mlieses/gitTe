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
<!-- css -->
<link rel="stylesheet" href="css/m_detail.css">
<!-- JQuery UI Datepicker -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
$( function() {
    $("#datepicker1").datepicker();
    $("#datepicker2").datepicker();
});
</script>
</head>
<body>


<%-- <jsp:include page="Top.jsp"/> --%>

	<div class="w3-container main-container" style="padding:0;">
		<div class="w3-row row-container">
			<div class="w3-col m6 w3-center img" id="img_div1">
				<div class="scale" id="img_div1-1">
					<img alt="" src="img/c1.PNG">
				</div>
			</div>
			<div class="w3-col m6 w3-center" id="img_div2">
				<div class="w3-row row-container" id="row-container2">
					<div class="w3-col m6 w3-center hidden" >
						<div class="scale" id="img_div2-1">
							<img alt="" src="img/c2.PNG">
						</div>
					</div>
					<div class="w3-col m6 w3-center hidden">
						<div class="scale" id="img_div2-2">
							<img alt="" src="img/c3.PNG">
						</div>
					</div>

					<div class="w3-col m6 w3-center hidden">
						<div class="scale" id="img_div2-3">
							<img alt="" src="img/c4.PNG">
						</div>
					</div>
					<div class="w3-col m6 w3-center hidden">
						<div class="scale" id="img_div2-4">
							<img alt="" src="img/d1.PNG">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="w3-container main-slide" style="padding:0;">
		<div class="w3-content w3-display-container" style="width: 100%;height:100%;">
			<img class="mySlides" src="img/c1.PNG" style="width: 100%;height:100%;">
			<img class="mySlides" src="img/c2.PNG" style="width: 100%;height:100%;">
			<img class="mySlides" src="img/c3.PNG" style="width: 100%;height:100%;">
			<div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle" style="width: 100%">
				<div class="w3-display-left w3-hover-text-khaki" onclick="plusDivs(-1)">&#10094;</div>
				<div class="w3-right w3-hover-text-khaki" onclick="plusDivs(1)">&#10095;</div>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white"	onclick="currentDiv(1)"></span>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white"	onclick="currentDiv(2)"></span>
				<span class="w3-badge demo w3-border w3-transparent w3-hover-white"	onclick="currentDiv(3)"></span>
			</div>
		</div>
	</div>
	
	<div class="w3-content content-center">
		<div class="w3-content content-header">
			<div class="w3-row" style="height:100%;">
				<div class="w3-threequarter w3-content" style="height:100%;">
					<div class="w3-content header-small">
						<h4>공간타입</h4>
					</div>
					<div class="w3-content header-subject">
						삼성빌딩에 위치한 000 스터디룸
					</div>
					<div class="w3-content header-small">
						00구
					</div>
				</div>
				<div class="w3-quarter w3-container">
					<!-- click 이벤트 추가 하기 -->
					<div class="w3-container host-profile">
						<img src="img/profile.jpg" class="w3-circle" alt="Car" style="width: 100px">
						<h2>nick name</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="w3-content content-time">
			<div class="w3-content time-subject">
			<h3>예약 가능 여부</h3>
			</div>
			<div class="w3-row time-date">
				<div class="w3-half w3-container date1">
					<div id="datepicker1"></div>
					
				</div>
				<div class="w3-half w3-container date2">
					<div id="datepicker2"></div>
				</div>
			</div>
			<div class="w3-content time w3-center">
				<button class="w3-button w3-white w3-border">10:00</button>
				<button class="w3-button w3-white w3-border">11:00</button>
				<button class="w3-button w3-white w3-border">12:00</button>
				<button class="w3-button w3-white w3-border">13:00</button>
				<button class="w3-button w3-white w3-border">14:00</button>
				<button class="w3-button w3-white w3-border">15:00</button>
				<button class="w3-button w3-white w3-border">16:00</button>
				<button class="w3-button w3-white w3-border">17:00</button>
				<button class="w3-button w3-white w3-border">18:00</button>
				<button class="w3-button w3-white w3-border">19:00</button>
				<button class="w3-button w3-white w3-border">20:00</button>
				<button class="w3-button w3-white w3-border">21:00</button>
			</div>
		</div>
		<div class="w3-content content-option">
			<div class="w3-content option">
				옵션
			</div>
			<div class="w3-content option-list">
				
			</div>
			<div class="w3-content option-content">
			</div>
			<div class="w3-content option-textarea">
			</div>
		</div>
	</div>
	
	


<script src="js/m_detail_slide.js"></script>

</body>
</html>
