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
<!-- JQuery UI Datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="css/m_detail.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

</head>
<body>
  <!--
달력
Date: <div id="datepicker"></div>
-->
<!--
<div class="img">
   <div class="scale"><img src="building_6_01.PNG"></div>
</div>
-->
<jsp:include page="Top.jsp"/>

	<div class="w3-container main-container" style="padding:0;">
		<div class="w3-row row-container">
			<div class="w3-col l6 w3-center img" id="img_div1">
				<div class="scale" id="img_div1-1">
					<img alt="" src="img/c1.PNG">
				</div>
			</div>
			<div class="w3-col l6 w3-center" id="img_div2">
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
	<div class="container">
		<div class="container-header">
			<div class="spaceType-a"><h4><a href="#">공간타입</a></h4></div>
		
		</div>
	
	</div>

<script src="js/m_detail_slide.js"></script>

</body>
</html>
