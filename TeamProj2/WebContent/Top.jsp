<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/* <jsp:include page="../Top.jsp" flush="false"/>
		동적 페이지 폴더 변경 */
	String servlet = request.getServletPath();
	String path = "../";
	String path1 = ".";
	String path2 = "../user/";
	if(servlet.equals("/home.jsp") || servlet.equals("/Top.jsp")){
		path="";
		path1="";
		path2 = "user/";
	}
	request.setAttribute("path", path);
	request.setAttribute("path1", path1);
	request.setAttribute("path2", path2);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- 복사 1 font -->
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>

<!-- 복사2 google icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {	  

	$("#google-sign").click(function(){	
		var popUrl ="https://accounts.google.com/o/oauth2/v2/auth?"
			+"redirect_uri=http://localhost:8181/TeamProj/google&"
			+"response_type=code&"			
			+"client_id=463533794318-unijrkh4odbf94n2pms494toetghdgir.apps.googleusercontent.com&"
			+"scope=openid%20email&"
			+"access_type=offline";	
			//팝업창에 출력될 페이지 URL
	
	var popOption = "width=400, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	
	var win = window.open(popUrl,"",popOption);		
		
   });
	
	$("#kakao-sign").click(function(){	
		var popUrl ="https://kauth.kakao.com/oauth/authorize?client_id=7bed2c2cc35da2f635429b5665085d84"
			+"&redirect_uri=http://localhost:8181/TeamProj/kakao&response_type=code";	
			//팝업창에 출력될 페이지 URL
	
	var popOption = "width=400, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	
	var win = window.open(popUrl,"",popOption);		
		
   });	
	
});
</script>
<style type="text/css">
 .w3-bar-item{
  letter-spacing: 1px;
  font-family: "Nanum Barun Gothic" !important; 
  color: #666666;
  font-style: bold;
}
</style>
</head>
<body>
<!-- Navbar 복사4-->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="${path}home.jsp" class="w3-bar-item w3-button"><b>SS</b> share space</a>
<!--     <a href="#home" class="w3-bar-item w3-button">내 주변</a> -->
<!--     <a href="#home" class="w3-bar-item w3-button">지역</a> -->
<!--     <a href="#home" class="w3-bar-item w3-button">장소검색</a> -->
<!--     <a href="#home" class="w3-bar-item w3-button">기획전</a> -->
<!--     <a href="#home" class="w3-bar-item w3-button">공간 올리기</a> -->
    <%-- <%=servlet %>  : ${path2} --%>
   <%--  ${sessionScope.udto.name } --%>
    <!-- Float links to the right. Hide them on small screens -->
    <c:set var="email" value="${sessionScope.udto.email }"/>
    <div class="w3-right w3-hide-small">     
      <a href="#about" class="w3-bar-item w3-button"><i class="material-icons">stars</i></a>
      <a href="#about" class="w3-bar-item w3-button">마이페이지</a>
      <c:choose>
      	<c:when test="${email eq null }">
      		<a href="${path2}userSingUp_auth.jsp" class="w3-bar-item w3-button">회원가입</a>
      		<a href="#home" class="w3-bar-item w3-button" onclick="document.getElementById('id01').style.display='block'">로그인</a><!-- 로그아웃 -->
      	</c:when>
      	<c:otherwise>
      		<a href="${path1}./UserLogoutController.do" class="w3-bar-item w3-button">로그아웃</a>      	
      	</c:otherwise>	
      </c:choose>      
    </div>
  </div>
</div>
<!-- 복사4종료  -->
<!-- 모달창 시작 -->
<div class="w3-container">  
  <div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">	
	  <header class="w3-container w3-teal w3-center"> 
	    <span onclick="document.getElementById('id01').style.display='none'" 
	          class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
	    <h2>회원 로그인</h2>
	  </header>
      <form class="w3-container" action="${path1}./UserLoginController.do" method="post">
        <div class="w3-section">        
          <label><b>이메일</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="이메일" name="email" required>
          <label><b>비밀번호</b></label>
          <input class="w3-input w3-border" type="password" placeholder="비밀번호" name="pass" required>
          <input class="w3-check w3-margin-top" type="checkbox"> 호스트 로그인
          <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">로그인</button>
       	  <span class="w3-right w3-padding w3-hide-small">비밀번호를 잊으셨거나 변경이 필요하신가요? <a href="#">비밀번호 재설정</a></span>
        </div>
      </form>
      	<hr>
      	<div class="w3-container w3-center">또는</div>
      <div class="w3-container w3-center w3-margin-bottom"><br>
      	<img src="${path}img/btn_google_signin_dark_normal_web@2x.png" height="60px" width="50%" id="google-sign"
      	onmouseover="this.src='${path}img/btn_google_signin_dark_focus_web@2x.png';" onmouseout="this.src='${path}img/btn_google_signin_dark_normal_web@2x.png';">        
        <img src="${path}img/kakao_account_login_btn_medium_narrow.png" height="55px" width="48%" id="kakao-sign"
        onmouseover="this.src='${path}img/kakao_account_login_btn_medium_narrow_ov.png';" onmouseout="this.src='${path}img/kakao_account_login_btn_medium_narrow.png';">       
      
      </div>      	
      <div class="w3-container w3-border-top w3-padding-16 w3-teal">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        <span class="w3-right w3-padding w3-hide-small">share space의 회원이 아니신가요? <a href="#">회원 가입</a></span>
      </div>

    </div>
  </div>
</div>

<!-- 모달창 종료 -->


</body>
</html>