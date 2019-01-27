<%@page import="java.util.ArrayList"%>
<%@page import="space.CommentDTO"%>
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
<style type="text/css">
.w3-ul li{
	padding:0;
}
</style>

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
<c:set var="commentList" value="${commentList}"></c:set>
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
					<input type="hidden" id="lat" value="${address.a_wdo}">
					<input type="hidden" id="lng" value="${address.a_kdo}">
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
<!-- comment시작 ---------------------------------------------------->
		<div class="w3-content content-comment">
			<ul class="w3-ul w3-card-4">
				<li class="w3-bar w3-light-grey">
					<div class="w3-bar-item item-img-div">
						<img src="img/c1.PNG" class="w3-circle w3-hide-small c-profile-img">
					</div>
					<div class="w3-bar-item item-div">
						<span>Mike</span><br> <span>(Web Designer)</span>
					</div>
					<div class="item-input">
			        	<input type="text" class="w3-input" id="c_content" style="width:590px; display:inline-block;" />
			        	<button class="w3-button w3-grey" id="insert_btn">등록</button>
			      	</div>
				</li>
				<!-- session 으로 email을 들고와서 비교 
 						<c:if test="${comment.email eq sessionEmail }" ></c:if>
 						 --> 
				<c:forEach var="comment" items="${commentList}">
					
					<li class="w3-bar">
						
						<button class="w3-right w3-white w3-border-0 c-btn${comment.comment_no}" id="${comment.comment_no }">x</button>
						<button class="w3-white w3-right w3-border-0 u_btn" id="${comment.comment_no}">
							<img src="https://img.icons8.com/metro/26/000000/edit.png">
						</button>
						<div class="w3-bar-item item-img-div">
							<img src="img/c1.PNG" class="w3-circle w3-hide-small c-profile-img">
						</div>
						<div class="w3-bar-item item-div">
							<span>${comment.nick_name}</span><br> <span>(${comment.email})</span>
						</div>
						<div class="item-content">
							<span>${comment.com_content}</span>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		
		
	</div>
	
<!-- option content ------------------------------------------------->	

<!-- footer include -->

<!-- footer content ------------------------------------------------->	
	
	<footer class="w3-container w3-dark-gray foot">
		<div class="w3-content foot-content" >
			<div class="w3-row foot-row">
				<div class="w3-col m10 foot-price">
					<div class="price-div">
						<div class="price">
							
						</div>
					</div>
				</div>
				<div class="w3-col m2 reservation-req">
					<div class="w3-container">
						<button class="w3-button w3-white w3-center w3-border w3-xlarge" id="req-btn" ><b>예약하기</b></button>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<form action="#" method="post">
		<input type="hidden" id="roomNo" value="${hosting.room_no}">
		<input type="hidden" id="selectDate" value="">
		<input type="hidden" id="time" value="">
		<input type="hidden" id="allPrice" value=""> 
	</form>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/m_detail_slide.js"></script>
<script type="text/javascript">
	var num = '${hosting.room_no}';
	var disabledDays = [];
	var i =0;
	<c:forEach items="${noList}" var="item1">
		disabledDays[i] = "${item1}";
	</c:forEach>
	
	var list;
	var s_date="";
	var a_price = 0;
	
	$(".t_btn").attr("disabled",true);	//날짜를 선택하기전 시간 버튼 disabled
	$(".price").html(a_price);			//처음부터 아무것도 선택되지 않을때 0표시
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
		dateFormat: 'yy-mm-dd D',
		beforeShowDay: disableAllTheseDays,
		onSelect: function(date) {
			
			s_date=date;

			nonBtn(date)
// 	         alert(date);
	    }   

	});
	
	 function nonBtn(date){
		 $(".t_btn").attr("disabled",false);	
		 $(".t_btn").removeClass("w3-grey");	//시간버튼 클릭시 변경되는 색상 모두 제거
		 	list = new Array();
		 $.ajax({
	        url:'TimeSpaceController',
	        type:'post',
	        data:{"date":date, "room_no":num},
	        success : function(data){
	        
	        	var json = JSON.parse(data);
	        	
// 	        	$(".t_btn").attr("disabled",false);
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
		var f_date = [];
		f_date = s_date.split(" ");
// 		alert(f_date[1]);
		var d_str = f_date[1];
		var target = $(event.target);
		
		var test = 1;
		
		if(target.hasClass("w3-grey")){
			var num = list.indexOf(target.attr("id"));
			list.pop(num);
			target.removeClass("w3-grey");
		}else{
			target.addClass("w3-grey");
		 	list.push(target.attr("id"));
		}
		
		if(d_str=="Sat" || d_str=="Sun"){
			var price = parseInt(${bill.room_sum});
			var timeNum = list.length;
			a_price = String(price*timeNum);
		}else{
			var price = parseInt(${bill.room_day});
			var timeNum = list.length;
			a_price = String(price*timeNum);
		}
		$(".price").html(a_price);
		console.log("start");
// 		 console.log(list.length);
		
		list.forEach(function(element) {
			console.log(element);
		});
	})
	
	
	$("#req-btn").on("click", function(){
		$("#selectDate").attr("value", s_date);
		$("#time").attr("value",list);
		$("#allPrice").attr("value",a_price);
		$("form").submit();
	});
	
	
	 
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
	//comment 등록버튼
	$("#insert_btn").on("click",function(event){
		var content = $("#c_content").val();
  
		$.ajax({
	        url:'CommentInsertController',
	        type:'post',
	        //session의 email받아서 넣어야함
	        data:{"content":content, "room_no":num},
	        success : function(data){
	        	if(parseInt(data)==1){
	        		$(".content-comment ul li:first-child").after(function(){
	        			$(".content-comment ul li:first-child").after(function(){
	        				return 	 '<li class="w3-bar">'
	        						+'	<button class="w3-right w3-white w3-border-0 c-btn" id="${comment_no }">x</button>'
	        						+'	<button class="w3-white w3-right w3-border-0 u_btn" id="${comment.comment_no}">'
	        						+'		<img src="https://img.icons8.com/metro/26/000000/edit.png">'
	        						+'	</button>'
	        						+'	<div class="w3-bar-item item-img-div">'
	        						+'		<img src="img/c1.PNG" class="w3-circle w3-hide-small c-profile-img">'
	        						+'	</div>'
	        						+'	<div class="w3-bar-item item-div">'
	        						+'		<span>ddd</span><br> <span>(ddd@)</span>'
	        						+'	</div>'
	        						+'	<div class="item-content">'
	        						+'		<span>'+content+'</span>'
	        						+'	</div>'
	        						+'</li>';
	        			});
	        			//동적 버튼 이벤트 추가해야함
	        		});	
	        	}
	        }
		}); 
	});
	//comment 삭제버튼
	$(".c_btn").on("click", function(event){
		var here = $(event.target);
		
		here.parent().css("display","none");
		var commentNo = here.attr("id");
		$.ajax({
	        url:'CommentDeleteController',
	        type:'post',
	        data:{"comment_no":commentNo},
	        success : function(data){
	        	console.log(parseInt(data));
	        }
		});
	});
	
	//comment 수정버튼
	$(".u_btn").on("click", function(event){
		var here = $(event.target);
		var id = here.attr("id");
		var content = $(".item-content span").text(); 
		console.log(content);
		$(".item-content").remove();
		
		
		here.parent().append("<div class='item-input'><input type='text' "
		+"class='w3-input' name='c_content' style='width:590px; display:inline-block;' /> "
        +"<button class='w3-button w3-grey'>등록</button></div>");
		here.prev().remove();
		here.remove();
		
		/* var commentNo = here.attr("id");
		$.ajax({
	        url:'CommentDeleteController',
	        type:'post',
	        data:{"comment_no":commentNo},
	        success : function(data){
	        	console.log(parseInt(data));
	        }
		}); */
	});
	
</script>

</body>
</html>
