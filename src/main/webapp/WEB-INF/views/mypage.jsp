<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 마이페이지</title>

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
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("addr1").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("addr1").value = jibunAddr;
            }
        }
    }).open();
}

	//비밀번호 일치 여부 알림
	$(function(){ 
		$("#alert-success").hide(); 
		$("#alert-danger").hide(); 
		$("input").keyup(function(){ 
			var pwd=$("#pwd").val(); 
			var pwd2=$("#pwd2").val(); 
			if(pwd != "" || pwd2 != ""){ 
				if(pwd == pwd2){ $("#alert-success").show();
				$("#alert-danger").hide(); 
				$("#submit").removeAttr("disabled"); 
				$('.userPwd2').attr("check_result", "success");
				}else{ 
					$("#alert-success").hide(); 
					$("#alert-danger").show(); 
					$("#submit").attr("disabled", "disabled"); 
					$('.userPwd2').attr("check_result", "fail");
					} 
					}
			}); 
		});


	<%-- 비밀 번호 확인 스크립트 --%>
	function check_pw(){
		 
		 var pw = document.getElementById('pwd').value;
         var SC = ["!","@","#","$","%", "~", "^", "&", "*", ")", "(", "+", "|", ";", "/", "=", "-"];
         var check_SC = 0;

         if(pw.length < 6 || pw.length > 16){
             window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
             document.getElementById('pwd').value='';
             document.getElementById('pw_pro').value='0';
         }
         for(var i=0;i<SC.length;i++){
             if(pw.indexOf(SC[i]) != -1){
                 check_SC = 1;
	        }
	    }
	    if(check_SC == 0){
	        window.alert('특수문자를 하나 이상 포함시켜주세요.')
	        document.getElementById('pwd').value='';
	    }
	    if(pw.length < 6 || pw.length > 16){
	    	if(check_SC == 0){
	    		  document.getElementById('pw_pro').value='0';
	    	}
        }
	    else if(pw.length < 9 ){
	    	if(check_SC == 1) {
	    		document.getElementById('pw_pro').value='1';
	    	}
        }
        else if(pw.length < 12){
        	if(check_SC == 1) {
	    		document.getElementById('pw_pro').value='2';
	    	}
        }
        else if(pw.length < 16){
        	if(check_SC == 1) {
	    		document.getElementById('pw_pro').value='3';
	    	}
        }
     
	    if(document.getElementById('pwd').value !='' && document.getElementById('pwd2').value!=''){
	        if(document.getElementById('pwd').value==document.getElementById('pwd2').value){
	            document.getElementById('pwd_check').innerHTML='비밀번호가 일치합니다.'
	            document.getElementById('pwd_check').style.color='blue';
	        }
	        else{
	            document.getElementById('pwd_check').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('pwd_check').style.color='red';
	        }
	    }
	}
	
	function check_phone() {
		
		var phone = document.getElementById('user_phone');
		var phoneJ = /^(010)([0-9]{4})([0-9]{4})$/;
		var p = phone.value;
				
				if (!phoneJ.test(p)) {
					$('#phone_check').text('번호를 확인해주세요.');
					$('#phone_check').css('color', 'red');
					$('#phone_check2').text('Ex) 010xxxxxxxx');
					$('#phone_check2').css('color', 'green');
					 document.getElementById('user_phone').value='';
				}else {
					$('#phone_check').text('');
					$('#phone_check').css('color', 'blue');
					$('#phone_check2').text('');
					$('#phone_check2').css('color', 'green');
				}
		
	}
	
	
function check_email() {
		
		var email = document.getElementById('user_email');
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var e = email.value;
				
				if (!mailJ.test(e)) {
					$('#email_check').text('이메일을 확인해주세요');
					$('#email_check').css('color', 'red');
					 document.getElementById('user_email').value='';
				}else {
					$('#email_check').text('비밀번호 찾기에 사용될 이메일입니다.');
					$('#email_check').css('color', 'blue'); 
				}
		
	}
	
function modify() {
		
		var nowpwd = $("#now_pwd").val();
	    var userpwd = $("#pwd").val();
	    var userpwd2 = $("#pwd2").val();
	    var userphone = $("#user_phone").val();
	    var email = $("#user_email").val();
	    var zipcode = $("#zipcode").val();
	    var addr1 = $("#addr1").val();
	    var addr2 = $("#addr2").val();
	    
	  
	    if(nowpwd.length == 0){
	        alert("현재 비밀번호를 입력해 주세요"); 
	        $("#now_pwd").focus();
	        return false;
	    }
	   
	    if(userpwd.length == 0){
	        alert("수정할 비밀번호를 입력해 주세요"); 
	        $("#pwd").focus();
	        return false;
	    }
	 
	    if(userpwd != userpwd2){
	        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
	        $("#pwd2").focus();
	        return false; 
	    }
	    
	    if(userphone.length == 0){
	        alert("번호를 입력해주세요");
	        $("#user_phone").focus();
	        return false;
	    }
	    
	    if(email.length == 0){
	        alert("이메일을 입력해주세요");
	        $("#user_email").focus();
	        return false;
	    }
	    
	    if(zipcode.length == 0 || addr1.length == 0 || addr2.length == 0 ){
	        alert("주소를 입력해주세요");
	        $("#addr2").focus();
	        return false;
	    }
	    
	    if(confirm("회원정보수정 하시겠습니까?")){
	        return true;
	    }
		
	}
	
</script>
<style type="text/css">
.main {
	margin: 2vw 5vw;
	width: 60%;
	display: table;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	align-content: center;
}

.a {
	color: gray;
	margin: 0px 130px 0px 0px;
}

.p {
	font-size: 17px;
	padding: 0px;
}

.border {
	border: 1px solid black;
	margin: 0;
	padding: 20px 30px;
}

#pwd, #pwd2, #now_pwd {
	padding: 10px 50px 10px 7px;
	border: 1px solid gray;
	border-radius: 7px;
}

.th {
	padding: 15px 30px 15px 30px;
	font-size: 17px;
	text-align: left;
	border-top: 1px solid lightgrey;
	border-right: 1px solid lightgrey;
	width: 20%;
	margin: 40px;
}

.td {
	padding: 15px 30px 15px 30px;
	border-top: 1px solid lightgrey;
	margin: 40px;
}

.th1 {
	font-size: 17px;
	text-align: left;
	border-right: 1px solid lightgrey;
	border-top: 1px solid lightgrey;
	border-bottom: 1px solid lightgrey;
	width: 15%;
	padding: 15px 30px 15px 30px;
	margin: 40px;
}

.td1 {
	border-top: 1px solid lightgrey;
	border-bottom: 1px solid lightgrey;
	padding: 15px 30px 15px 30px;
	margin: 40px;
}

.table {
	font-size: 17px;
	color: gray;
}

.text0 {
	padding: 10px 5px 10px 5px;
	font-size: 17px;
	border: 1px solid gray;
	border-radius: 7px;
}

.deleteMember {
	width: 160px;
	height: 50px;
	font-size: 19px;
	background-color: #424242;
	color: white;
	border: medium;
	float: right;
	cursor: pointer;
	margin: 20px 100px 0px 0px;
}

.deleteMember:hover, .btn_submit:hover, .btn_cancel:hover {
	opacity: 0.8;
}

.btn_submit {
	cursor: pointer;
	background-color: #8bdeff;
	color: white;
	border: medium;
	width: 160px;
	height: 50px;
}

.btn_cancel {
	cursor: pointer;
	width: 160px;
	height: 50px;
	background-color: lightgray;
	border: medium;
}

#req {
	color: #E37E68;
}

#alert-success, #alert_Avail, #idcheck_avail {
	color: blue;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
}

#alert-danger, #alert_Length, #idcheck_inavail {
	color: red;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
}

.search {
	padding: 5px 12px 10px 12px;
	margin: 0px 0px 0px 5px;
	background-color: #4aa8d8;
	border: 1px solid #8bdeff;
	color: white;
	border-radius: 7px;
	cursor: pointer;
	text-align: center;
	font-size: 17px;
}

/* 2022-01-12*/
ul {
	list-style: none;
}

font {
	display: inline-block;
	margin-left: 10px;
}

input {
	font-family: 'Do Hyeon', sans-serif;
}

body {
	font-family: 'Do Hyeon', sans-serif;
}

h1 {
	font-size: 35px;
}

h4 {
    margin-bottom: 20px;
}

</style>
</head>
<body>

	<jsp:include page="/resources/include/header.jsp"/> 
<div class="main">
	<c:set var="dto" value="${dto }" />
	<br>
	<h1 align="center" style="color: black" "font-size="35px";>회원 정보 수정</h1>
	 
	<p align="right" class="p"> <a href="<%=request.getContextPath() %>/main.do" class="a">home</a>
	<br> <br>
	<h4>기본정보</h4>
	
	<div align="center">
		<form name="newMem" method="post" action="<%=request.getContextPath() %>/modifyOk.do?id=${dto.getId() }" onsubmit="return modify()">
		<table cellspacing="0" width="85%" class="table">
			<tr>
				<th class="th">아이디<span id="req">＊</span>  </th>
				<td class="td"><input type="text" name="userId" value="${dto.getId() }" readonly class="text0" ></td>
			</tr>
			
			<tr>
				<th class="th">현재 비밀번호<span id="req">＊</span> </th>
				<td class="td"><input type="password" name="now_pwd" id="now_pwd"></td>
			</tr>
			
			<tr>
				<th class="th">변경 비밀번호<span id="req">＊</span> </th>
				<td class="td"><input type="password" name="pwd" id="pwd" onchange="check_pw()" >&nbsp;(특수문자 포함, 6~16자)</td>
			</tr>
			
			
			<tr>
				<th class="th">변경 비밀번호 확인<span id="req">＊</span></th>
				<td class="td"><input type="password" name="pwd2" id="pwd2" class="userPwd2" class="text0" onchange="check_pw()">
					<span class="alert-success" id="alert-success">비밀번호가 일치합니다.</span>
	    			<span class="alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</span>
	    		</td>
			</tr>
			
			<tr>
				<th class="th">이름<span id="req">＊</span> </th>
				<td class="td"><input type="text" name="name" value="${dto.getName() }" readonly class="text0"> </td>
			</tr>
			
			<tr>
				<th class="th">휴대전화<span id="req">＊</span></th>
				<td class="td"><input type="text" name="phone"  value="${dto.getPhone() }" class="text0"
									id="user_phone" placeholder="- 제외 숫자만 입력해주세요" onchange="check_phone()">
					<div class="check_font" id="phone_check"></div><div class="check_font" id="phone_check2"></div>					
				 </td>	
			</tr>
			
			<tr>
				<th class="th">SMS 수신여부<span id="req">＊</span></th>
				<td class="td"><input type="radio" name="sms" /><label for="is_sms0" >수신함</label>
								<input type="radio"   checked="checked" name="sms" /><label for="is_sms1" >수신안함</label>
								<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
				 </td>
			</tr>
			
			<tr>
				<th class="th">이메일<span id="req">＊</span></th>
				<td class="td"><input type="text" name="email" value="${dto.getEmail() }" class="text0"
									id="user_email" placeholder="이메일을 입력해주세요" onchange="check_email()">
							<div class="check_font" id="email_check"></div>
				</td>
			</tr>
			
			<tr>
				<th class="th">이메일 수신여부<span id="req">＊</span></th>
				<td class="td">	<input type="radio" name="email" /><label for="is_news_mail0" >수신함</label>
								<input type="radio" name="email" checked="checked"  /><label for="is_news_mail1" >수신안함</label>
								<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
 				</td>
			</tr>
				
				
				
			<tr>
				<th class="th1">주소<span id="req">＊</span></th>
				<td class="td1"><input type="text" name="zipcode" id="zipcode" size="7" value="${dto.getZipcode() }" readonly class="text0">
				       <input type="button" class="search" value="주소 검색" onclick="findAddr()"><br><br>
	                   <input type="text" name="addr1" id="addr1" value="${dto.getAddr1() }" size="60" placeholder="도로명주소" readonly class="text0"><br><br>
					   <input type="text" name="addr2" id="addr2" value="${dto.getAddr2() }" size="60" placeholder="상세주소" class="text0"><font size =2>(상세주소입력)</font>
				</td>
			</tr>
		
			
			
			
		</table>
		
			<br>
		
				<input class="btn sign-in" type="submit" value="회원정보수정">
				<input class="btn btn--primary sign-up" type="button" value="취소" onclick="location.href='user_mypage.do?id=${dto.getId() }'">
				
		</form>
		
		

	
	
	</div>
		<form method="post" action="<%=request.getContextPath() %>/delete.do?id=${dto.getId() }" 
					onsubmit="return confirm('정말 탈퇴 하시겠습니까?')">
			<input type="submit" value="회원탈퇴" class="deleteMember">
			
		</form>
		
	<br> <br> <br> 
</div>
	<jsp:include page="/resources/include/footer.jsp"/> 
</body>
</html>