<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 비밀번호 찾기</title>

<meta name="author" content="TEAM3">
<meta name="description" content="MaP is community for Map-gu people">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minomum-scale=1">

<%--파비콘 이미지--%>
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/img/main/favicon.png">

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/header.css" />
<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/footer.css" />

<%--기존 css 초기화(https://cdnjs.com/libraries/meyer-reset)--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}





function idSearch_click() {
	
	
	$.ajax({
		
		url:"${pageContext.request.contextPath}/searchId.do?name="+$('#name').val()
				+"&phone="+$('#phone').val(),	// 요청할 URL
		type: 'POST',		// 메소드 방식
		success: function(data){	// 성공 시 실행할 함수
			if(data == 0){
				
			}else {
				$('#id_value').text(data);
				$(document).ready(function() {
					/////////모///달///기///능///////////
					// 1. 모달창 히든 불러오기
						$('#background_modal').show();
						$('#background_modal').css('display', 'flex');
					
					// 2. 모달창 닫기 버튼
					$('.close-area').on('click', function() {
						$('#background_modal').hide();
					});
					// 3. 모달창 위도우 클릭 시 닫기
					$(window).on('click', function() {
						if (event.target == $('#background_modal').get(0)) {
				            $('#background_modal').hide();
				         }
					});
				});
			}
		},
		error: function() {	//실패 시 실행할 함수
			alert("회원 정보를 확인해주세요.");
			
		}
		
	});
	
}

</script>
<style type="text/css">
.userName, .userPhone, .userEmail, .userId {
	margin: 10px 10px 15px 10px;
	padding: 20px 20px 20px 20px;
	width: 500px;
	border: 1px solid lightgrey;
	font-size: 22px;
	text-align: left;
	border-radius: 10px;
}

.findid, .findpwd {
	font-size: 19px;
	color: black;
	text-decoration: none;
}

.findId, .findPwd {
	width: 29%;
	font-size: 22px;
	padding: 20px;
	color: white;
	background-color: #4aa8d8;
	border: 1px solid #8bdeff;
	border-radius: 5px;
}

.cancel {
	width: 29%;
	font-size: 22px;
	padding: 20px;
	background-color: #c4302b;
	border: 1px solid #8bdeff;
	color: #8bdeff;
	border-radius: 5px;
}

.checkbox {
	width: 23px;
	height: 23px;
}

.label {
	font-size: 23px;
}

.target {
	display: inline-block;
	width: 200px;
}

/* 2022-01-12*/
body {
	font-family: 'Do Hyeon', sans-serif;
}

input {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>

<body>
<%@ include file="/WEB-INF/views/userIdSearchModal.jsp" %>
	
	<jsp:include page="/resources/include/header.jsp"/> 
 <br><br> <br><br> <br><br>
	<div align="center">
		<h1>아이디/비밀번호 찾기</h1>
		<br>
			<hr width="29%" color="gray">
		 <br> <br>
		<div style="margin-bottom: 10px;" class="target">
				<input type="radio" class="checkbox" id="search_1" name="search_total" onclick="search_check(1)">
				<label class="label"	for="search_1">아이디 찾기</label>
		</div>
		<div class="target">
				<input type="radio" class="checkbox" id="search_2" name="search_total" onclick="search_check(2)" checked="checked"> 
				<label class="label" for="search_2">비밀번호 찾기</label>
		</div>
		
		<div id="searchI" style="display: none;">
			<form method="post">	
				<input name="name" class="userName" id="name" placeholder="이름을 입력해주세요."> <br>
				<input name="phone" id="phone" class="userPhone" placeholder="핸드폰 번호를 입력해주세요."> <br> 
				
				<br>
				<input type="button" value="아이디 찾기" class="findId" id="searchBtn" style="cursor: pointer" onclick="idSearch_click()"> <br> <br>
				<input type="button" value="취소" class="cancel"  style="cursor: pointer"
					onclick="location.href='user_loginPage.do'">
			</form>
			<br>
		</div>
	
	
	<div id="searchP">
		<form method="post" action="user_findPwd.do" onsubmit="return frm_check();">	
			<input name="id" class="userId" id="logId" placeholder="아이디를 입력해주세요"> <br>
			<input name="email" class="userEmail" placeholder="이메일을 입력해주세요"> <br> 
			
			<br>
			<input type="submit" value="비밀번호 찾기" class="findPwd"  style="cursor: pointer"> <br> <br>
			<input type="button" value="취소" class="cancel"  style="cursor: pointer"
				onclick="location.href='user_loginPage.do'">
		</form>
	<br>
	</div>
     <br><br> <br><br><br> <br><br> <br>
    </div>
 <jsp:include page="/resources/include/footer.jsp"/> 
	
	
</body>
</html>