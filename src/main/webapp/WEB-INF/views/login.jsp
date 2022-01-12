<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 로그인</title>

<meta name="author" content="TEAM3">
<meta name="description" content="MaP is community for Map-gu people">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minomum-scale=1">

<%--파비콘 이미지--%>
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/img/main/favicon.png">

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/header.css"/>
	
<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/footer.css"/>
	
<%--기존 css 초기화(https://cdnjs.com/libraries/meyer-reset)--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">   	
    
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
Kakao.init('8890a67c089173194979845f9389950d'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
  
$(function() {
    
    fnInit();
  
});

function frm_check(){
  saveid();
}

function fnInit(){
 var cookieid = getCookie("saveid");
 console.log(cookieid);
 if(cookieid !=""){
     $("input:checkbox[id='saveId']").prop("checked", true);
     $('#logId').val(cookieid);
 }
 
}    

function setCookie(name, value, expiredays) {
 var todayDate = new Date();
 todayDate.setTime(todayDate.getTime() + 0);
 if(todayDate > expiredays){
     document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
 }else if(todayDate < expiredays){
     todayDate.setDate(todayDate.getDate() + expiredays);
     document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
 }
 
 
 console.log(document.cookie);
}

function getCookie(Name) {
 var search = Name + "=";
 console.log("search : " + search);
 
 if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
     offset = document.cookie.indexOf(search);
     console.log("offset : " + offset);
     if (offset != -1) { // 쿠키가 존재하면 
         offset += search.length;
         // set index of beginning of value
         end = document.cookie.indexOf(";", offset);
         console.log("end : " + end);
         // 쿠키 값의 마지막 위치 인덱스 번호 설정 
         if (end == -1)
             end = document.cookie.length;
         console.log("end위치  : " + end);
         
         return unescape(document.cookie.substring(offset, end));
     }
 }
 return "";
}

function saveid() {
 var expdate = new Date();
 if ($("#saveId").is(":checked")){
     expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
     setCookie("saveid", $("#logId").val(), expdate);
     }else{
    expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
     setCookie("saveid", $("#logId").val(), expdate);
      
 }
}

</script>
<style type="text/css">
.userid, .userpwd {
	margin: 10px 10px 15px 10px;
	padding: 30px 240px 30px 40px;
	border: 1px solid lightgrey;
	font-size: 22px;
	text-align: left;
	border-radius: 5px;
}

.findid, .findpwd {
	font-size: 19px;
	color: black;
	text-decoration: none;
}

.login {
	width: 29%;
	font-size: 22px;
	padding: 20px;
	color: white;
	background-color: #8bdeff;
	border: 1px solid #8bdeff;
	border-radius: 5px;
}

.signup {
	width: 29%;
	font-size: 22px;
	padding: 20px;
	background-color: white;
	border: 1px solid #8bdeff;
	color: #8bdeff;
	border-radius: 5px;
}

.kakao {
	cursor: pointer;
	width: 29%;
	font-size: 22px;
	padding: 20px;
	background-color: #ffd400;
	border: 1px solid yellow;
	color: black;
	border-radius: 5px;
	font-weight: bold;
}

input::placeholder {
	color: lightgrey;
}

.checkbox {
	width: 23px;
	height: 23px;
}

.label {
	font-size: 20px;
}

.h1 {
	font-size: 35px;
	font-weight: bold;
}

/* 2022-01-12	 */
body {
	font-family: 'Do Hyeon', sans-serif;
}

input {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
 <jsp:include page="/resources/include/header.jsp"/> 
 <br><br> <br>  <br><br>  
	<div align="center">
		<h1 class="h1">로그인</h1>
		<br> <br>
	<form method="post" action="<%=request.getContextPath() %>/user_login.do" onsubmit="return frm_check();">	
	<input name="id" class="userid" id="logId" placeholder="아이디를 입력해주세요"> <br>
	<input type="password" name="pwd" class="userpwd" placeholder="비밀번호를 입력해주세요"> <br> 
	<input type="checkbox" class="checkbox" id="saveId" name="checkId"> <label class="label" for="saveId">아이디 기억하기</label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="<%=request.getContextPath() %>/findId.do" class="findid">아이디 찾기</a>
	<b class="b">|</b>
	<a href="<%=request.getContextPath() %>/findPwd.do" class="findpwd">비밀번호 찾기</a>
	<br> <br> <br>
	
	<input type="submit" value="로그인" class="login"  style="cursor: pointer">
	</form>
	<br>
	
	<input type="button" value="카카오 로그인" class="kakao"
		onclick="kakaoLogin();">
	<br> <br>
	

	<input type="button" value="회원가입" class="signup"  style="cursor: pointer"
		onclick="location.href='user_signup.do'">
	</div>
    <br><br> <br> <br><br> <br> <br><br>
 <jsp:include page="/resources/include/footer.jsp"/> 
	
</body>
</html>