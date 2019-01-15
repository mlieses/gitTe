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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
</script>
<!--
image hover 확대 
<style type="text/css">
	.scale {
	  transform: scale(1);
	  -webkit-transform: scale(1);
	  -moz-transform: scale(1);
	  -ms-transform: scale(1);
	  -o-transform: scale(1);
	  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
	}
	.scale:hover {
	  transform: scale(1.2);
	  -webkit-transform: scale(1.2);
	  -moz-transform: scale(1.2);
	  -ms-transform: scale(1.2);
	  -o-transform: scale(1.2);
	}
	.img {width:325px; height:280px; overflow:hidden }
</style>
 -->
</head>
<body>

<jsp:include page="Top.jsp"/>

<!-- 
달력
Date: <div id="datepicker"></div> 
-->
<!--
<div class="img">
   <div class="scale"><img src="building_6_01.PNG"></div>
</div>
-->






</body>
</html>