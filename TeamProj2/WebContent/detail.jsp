<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E="
  crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style type="text/css">
*{
	box-sizing: border-box;
}

body{
margin: 0px;
padding: 0px;

}

.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

</style>

<script type="text/javascript">

$(document).ready(function() {
	
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
	
	$('#a1').click(function() {		
		$('#I1').html("카페");		
		$('#Demo').removeClass("w3-show");
	});
	$('#a2').click(function() {		
		$('#I1').html("강의실");		
		$('#Demo').removeClass("w3-show");

	});
	$('#a3').click(function() {		
		$('#I1').html("룸");		
		$('#Demo').removeClass("w3-show");

	});
	
	$('#b1').click(function() {		
		$('#I2').html("부산");		
		$('#Demo1').removeClass("w3-show");
	});
	$('#b2').click(function() {		
		$('#I2').html("서울");		
		$('#Demo1').removeClass("w3-show");

	});
	$('#b3').click(function() {		
		$('#I2').html("대구");		
		$('#Demo1').removeClass("w3-show");

	});
	
	$('#c1').click(function() {		
		$('#I3').html("1시간");		
		$('#Demo2').removeClass("w3-show");
	});
	$('#c2').click(function() {		
		$('#I3').html("2시간");		
		$('#Demo2').removeClass("w3-show");

	});
	$('#c3').click(function() {		
		$('#I3').html("3시간");		
		$('#Demo2').removeClass("w3-show");

	});
	
	
});

function myFunction() {
	  var x = document.getElementById("Demo");
	  if (x.className.indexOf("w3-show") == -1) {  
	    x.className += " w3-show";
	  } else { 
	    x.className = x.className.replace(" w3-show", "");
	  }
	}
	
function myFunction1() {
	  var y = document.getElementById("Demo1");
	  if (y.className.indexOf("w3-show") == -1) {  
	    y.className += " w3-show";
	  } else { 
	    y.className = y.className.replace(" w3-show", "");
	  }
	}
	
function myFunction2() {
	  var z = document.getElementById("Demo2");
	  if (z.className.indexOf("w3-show") == -1) {  
	    z.className += " w3-show";
	  } else { 
	    z.className = z.className.replace(" w3-show", "");
	  }
	}

</script>

</head>
<body>
		
	<div style="width:100%;">		
			
			
			<!-- 팀장님 부탁 Navbar -->
				<div class="w3-bar w3-green" style="width: 100%; position: fixed; z-index: 9999; height:50px">
				  <div class="w3-bar-item">London</div>
				  <div class="w3-bar-item">Paris</div>
				  <div class="w3-bar-item">Tokyo</div>
				</div>	
				
			<!-- 좌측 영역  -->
			<div style="float: left; width: 50%; margin-top: 50px">
				<!-- Search 영역  -->
				<div style="width: 100%;">

					<div class="w3-dropdown-click" style="float: left; width: 25%; border: 1px solid #1e90ff;">
					  <button id="I1" onclick="myFunction()" class="w3-button w3-black" style="width: 100%">공간유형</button>
					  <div id="Demo" class="w3-dropdown-content w3-bar-block w3-border">
					     <span class="w3-bar-item w3-button" id="a1">카페</span>
					     <span class="w3-bar-item w3-button" id="a2">강의실</span>
					     <span class="w3-bar-item w3-button" id="a3">룸</span>
					  </div>
					</div>
					
					<div class="w3-dropdown-click" style="float: left; width: 25%">
					  <button id="I2" onclick="myFunction1()" class="w3-button w3-black" style="width: 100%; border: 1px solid #1e90ff; ">지역</button>
					  <div id="Demo1" class="w3-dropdown-content w3-bar-block w3-border">
					     <span class="w3-bar-item w3-button" id="b1">부산</span>
					     <span class="w3-bar-item w3-button" id="b2">서울</span>
					     <span class="w3-bar-item w3-button" id="b3">대구</span>
					  </div>
					</div>
					
					<div class="w3-dropdown-click" style="float: left; width: 25%">
					  <button  id="I3" onclick="myFunction2()" class="w3-button w3-black" style="width: 100%; border: 1px solid #1e90ff;">이용시간</button>
					  <div id="Demo2" class="w3-dropdown-content w3-bar-block w3-border">
					     <span class="w3-bar-item w3-button" id="c1">1시간</span>
					     <span class="w3-bar-item w3-button" id="c2">2시간</span>
					     <span class="w3-bar-item w3-button" id="c3">3시간</span>
					  </div>
					</div>
					
					<div style="width: 25%; display: inline-block;">
  						<button class="w3-button w3-black" style="width: 100%; border: 1px solid #1e90ff;" type="submit"><b>찾기</b></button>
					</div>				
				</div>
			<!-- Search 영역 끝 -->	
			
			<!-- 왼쪽 영역 , 오른쪽 영역 시작 -->
				<table width="100%">
					<tr align="center" height="300px;">
						<td width="40%"><div style="width: 90%"><img src="building_6_01.PNG" width="100%"></div></td>
						<td width="50%" style="text-align:left; position: relative;">
							<div style="position: absolute; top: 0px;">
								<h1 style="margin-bottom: -3px;">삼성 디 에이스</h1>
								<div class="starRev">
								  <span class="starR1 on">별1_왼쪽</span>
								  <span class="starR2">별1_오른쪽</span>
								  <span class="starR1">별2_왼쪽</span>
								  <span class="starR2">별2_오른쪽</span>
								  <span class="starR1">별3_왼쪽</span>
								  <span class="starR2">별3_오른쪽</span>
								  <span class="starR1">별4_왼쪽</span>
								  <span class="starR2">별4_오른쪽</span>
								  <span class="starR1">별5_왼쪽</span>
								  <span class="starR2">별5_오른쪽</span>
								  <p style="font-size: 24px; color: gray; display: inline;">&nbsp;&nbsp; 후기 : 1636개</p>
								</div>
							</div>
							<div style="margin-top: 50px;">
								<p style="margin-bottom: 0px"><b>대실</b>&nbsp;&nbsp; 최대 6시간 &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"> 25,000원</span></p>
								<p style="margin-top: 0px"><b>숙박</b>&nbsp;&nbsp; 최대 6시간 &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"> 25,000원</span></p>
							</div>
							<div>
								<p><b>참고사항</b></p>
							</div>
							
						</td>
						<td width="10%" align="right"></td>
					</tr>	
					<tr align="center" height="300px;">
						<td width="40%"><div style="width: 90%"><img src="building_6_02.PNG" width="100%"></div></td>
						<td width="50%" style="text-align:left; position: relative;">
							<div style="position: absolute; top: 0px;">
								<h1 style="margin-bottom: -3px;">삼성 디 에이스</h1>
								<div class="starRev">
								  <span class="starR1 on">별1_왼쪽</span>
								  <span class="starR2">별1_오른쪽</span>
								  <span class="starR1">별2_왼쪽</span>
								  <span class="starR2">별2_오른쪽</span>
								  <span class="starR1">별3_왼쪽</span>
								  <span class="starR2">별3_오른쪽</span>
								  <span class="starR1">별4_왼쪽</span>
								  <span class="starR2">별4_오른쪽</span>
								  <span class="starR1">별5_왼쪽</span>
								  <span class="starR2">별5_오른쪽</span>
								  <p style="font-size: 24px; color: gray; display: inline;">&nbsp;&nbsp; 후기 : 1636개</p>
								</div>
							</div>
							<div style="margin-top: 50px;">
								<p style="margin-bottom: 0px"><b>대실</b>&nbsp;&nbsp; 최대 6시간 &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"> 25,000원</span></p>
								<p style="margin-top: 0px"><b>숙박</b>&nbsp;&nbsp; 최대 6시간 &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"> 25,000원</span></p>
							</div>
							<div>
								<p><b>참고사항</b></p>
							</div>
							
						</td>
						<td width="10%" align="right"></td>
					</tr>	
					<tr align="center" height="300px;">
						<td width="40%"><div style="width: 90%"><img src="building_6_03.PNG" width="100%"></div></td>
						<td width="50%" style="text-align:left; position: relative;">
							<div style="position: absolute; top: 0px;">
								<h1 style="margin-bottom: -3px;">삼성 디 에이스</h1>
								<div class="starRev">
								  <span class="starR1 on">별1_왼쪽</span>
								  <span class="starR2">별1_오른쪽</span>
								  <span class="starR1">별2_왼쪽</span>
								  <span class="starR2">별2_오른쪽</span>
								  <span class="starR1">별3_왼쪽</span>
								  <span class="starR2">별3_오른쪽</span>
								  <span class="starR1">별4_왼쪽</span>
								  <span class="starR2">별4_오른쪽</span>
								  <span class="starR1">별5_왼쪽</span>
								  <span class="starR2">별5_오른쪽</span>
								  <p style="font-size: 24px; color: gray; display: inline;">&nbsp;&nbsp; 후기 : 1636개</p>
								</div>
							</div>
							<div style="margin-top: 50px;">
								<p style="margin-bottom: 0px"><b>대실</b>&nbsp;&nbsp; 최대 6시간 &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"> 25,000원</span></p>
								<p style="margin-top: 0px"><b>숙박</b>&nbsp;&nbsp; 최대 6시간 &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"> 25,000원</span></p>
							</div>
							<div>
								<p><b>참고사항</b></p>
							</div>
							
						</td>
						<td width="10%" align="right"></td>
					</tr>	
					<tr align="center" height="300px;">
						<td width="40%"><div style="width: 90%"><img src="building_6_04.PNG" width="100%"></div></td>
						<td width="50%" style="text-align:left; position: relative;">
							<div style="position: absolute; top: 0px;">
								<h1 style="margin-bottom: -3px;">삼성 디 에이스</h1>
								<div class="starRev">
								  <span class="starR1 on">별1_왼쪽</span>
								  <span class="starR2">별1_오른쪽</span>
								  <span class="starR1">별2_왼쪽</span>
								  <span class="starR2">별2_오른쪽</span>
								  <span class="starR1">별3_왼쪽</span>
								  <span class="starR2">별3_오른쪽</span>
								  <span class="starR1">별4_왼쪽</span>
								  <span class="starR2">별4_오른쪽</span>
								  <span class="starR1">별5_왼쪽</span>
								  <span class="starR2">별5_오른쪽</span>
								  <p style="font-size: 24px; color: gray; display: inline;">&nbsp;&nbsp; 후기 : 1636개</p>
								</div>
							</div>
							<div style="margin-top: 50px;">
								<p style="margin-bottom: 0px"><b>대실</b>&nbsp;&nbsp; 최대 6시간 &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"> 25,000원</span></p>
								<p style="margin-top: 0px"><b>숙박</b>&nbsp;&nbsp; 최대 6시간 &nbsp;&nbsp; <img alt="예약가" src="re.JPG">&nbsp;&nbsp; <span style="font-size: 28px;"> 25,000원</span></p>
							</div>
							<div>
								<p><b>참고사항</b></p>
							</div>
							
						</td>
						<td width="10%" align="right"></td>
					</tr>	
					
				</table>
			
			</div>
			
			<div style="width: 50%; position: fixed; right: 0; margin-top: 50px; height:100%">
					
					<div id="map" style="width:100%; height:100%;"></div>
							
			</div>	
			
				
		</div>
		
		
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=030fe73ff2f443d44661c605e8a0667f&libraries=clusterer"></script>
	<script>
		var map_json;
	 	var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
	        level : 14 // 지도의 확대 레벨 
	    });
		
		// 마커 클러스터러를 생성합니다 
	    var clusterer = new daum.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 7 // 클러스터 할 최소 지도 레벨 
	    })
		
		$.ajax({
	
	        type : "POST",
	
	        dataType : "json",
	
	        url : "detailTestController.do",
	        	
	        success : function(data) {
// 	        	
	        	map_json=data;
	        	// 데이터에서 좌표 값을 가지고 마커를 표시합니다
	            // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	            var markers = $(data.positions).map(function(i, position) {
	            	
	                return new daum.maps.Marker({
	                    position : new daum.maps.LatLng(position.lat, position.lng)
	                });
	        	});
	        	// 클러스터러에 마커들을 추가합니다
	            clusterer.addMarkers(markers);
	        	
	        }
		});

	    daum.maps.event.addListener(map, 'dragend', function() {
	    	// 지도의 현재 영역을 얻어옵니다 
	        var bounds = map.getBounds();
	        
	        // 영역의 남서쪽 좌표를 얻어옵니다 
	        var swLatLng = bounds.getSouthWest(); 
	        var swLat = swLatLng.getLat();
// 	        alert(typeof(swLat));
	        var swLng = swLatLng.getLng();
	        // 영역의 북동쪽 좌표를 얻어옵니다 
	        var neLatLng = bounds.getNorthEast(); 
	        var neLat = neLatLng.getLat();
	        var neLng = neLatLng.getLng();
	        
	        var array = new Array();
	        
	        var location = map_json.positions;
	        
	        for(var i in location){
	        	if(location[i].lat>swLat && location[i].lat<neLat){
	        		if(location[i].lng>swLng && location[i].lng<neLng){
	        			array.push(location[i].id);
	        		}
	        	}
	        }
	       	
	        for(var i in array){
	        	alert(array[i]);
	        }

	    });

	
	
	</script>
	<script type="text/javascript" src="js/auto.js"></script>
</body>
</html>