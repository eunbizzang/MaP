<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>MaP - 회원가입</title>
<meta charset="UTF-8">

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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

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


	function id_check() {
		
	var user_id = document.getElementById('id');
	var idJ = /^[a-z0-9]{4,12}$/;
	var i = user_id.value;
			
			if (!idJ.test(i)) {
				$('#id_check').text('아이디를 확인해주세요. 4자 ~ 12자');
				$('#id_check').css('color', 'red');
				 document.getElementById('id').value='';
			}else {
				$('#id_check').text('');
				$('#id_check').css('color', 'blue'); 
			}
	}
	

	
	$(function(){
		$('#id').attr("check_result", "notChecked");
	});
	
	function check(){
		
		var user_id = document.getElementById('id');
		var idJ = /^[a-z0-9]{4,12}$/;
		var i = user_id.value;
		
	
		id = $("#id").val();
		
		if (!idJ.test(i)) {
			$('#id_check').text('아이디를 확인해주세요. 4자 ~ 12자');
			$('#id_check').css('color', 'red');
			 document.getElementById('id').value='';
		}else {
			$.ajax({
				url: 'Check.do',	// 요청할 URL
				type: 'POST',		// 메소드 방식
				dataType: 'text',	// 받는 데이터 타입
				contentType : 'text/plain; charset=UTF-8;',	// 보내는 데이터 타입
				data: id,	// 전송할 데이터
				
				success: function(data){	// 성공 시 실행할 함수
					if(data == 0){
						console.log("아이디 없음");
						$('#id_check').text('사용가능한 아이디입니다. :)');
						$('#id_check').css('color', 'blue');
						alert("사용하실 수 있는 아이디입니다.");
						$('#id').attr("check_result", "success");
					}else {
						console.log("아이디 있음");
						$("#id_check").text("등록된 아이디입니다. ");
						$("#id_check").css("color", "red");
						alert("중복된 아이디가 존재합니다.");
						$('#id').attr("check_result", "fail");
					}
				},
				error: function() {	//실패 시 실행할 함수
					실패
				}
				
			});
		}
	}

	
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



	function check_name() {
		
		var name = document.getElementById('user_name');
		var nameJ = /^[가-힣]{2,6}$/;
		var v = name.value;
				
				if (!nameJ.test(v)) {
					$('#name_check').text('이름을 확인해주세요');
					$('#name_check').css('color', 'red');
					 document.getElementById('user_name').value='';
				}else {
					$('#name_check').text('');
					$('#name_check').css('color', 'blue'); 
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
		

	function signup() {
		
		var userid = $("#id").val();
	    var userpwd = $("#pwd").val();
	    var userpwd2 = $("#pwd2").val();
	    var username = $("#user_name").val();
	    var userphone = $("#user_phone").val();
	    var email = $("#user_email").val();
	    var zipcode = $("#zipcode").val();
	    var addr1 = $("#addr1").val();
	    var addr2 = $("#addr2").val();
	    
	    if(userid.length == 0){
	        alert("아이디를 입력해 주세요"); 
	        $("#id").focus();
	        return false;
	    }
	    
	    if ($('#id').attr("check_result") == "notChecked"){
		    alert("중복확인버튼을 눌러주세요.");
		    $('#id').focus();
		    return false;
		  }
	    
	    if ($('#id').attr("check_result") == "fail"){
		    alert("아이디를 확인하고 중복확인버튼을 눌러주세요.");
		    $('#id').focus();
		    return false;
		  }
	    if(userpwd.length == 0){
	        alert("비밀번호를 입력해 주세요"); 
	        $("#pwd").focus();
	        return false;
	    }
	 
	    if(userpwd != userpwd2){
	        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
	        $("#pwd2").focus();
	        return false; 
	    }
	 
	    if(username.length == 0){
	        alert("이름을 입력해주세요");
	        $("#user_name").focus();
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
	    
	    if ($("#checkAll").is(':checked')) {
		    $("input[type=checkbox]").prop("checked", true);
		} else {
		    $("input[type=checkbox]").prop("checked", false);
		}
	    
	    if(confirm("회원가입 하시겠습니까?")){
	        return true;
	    }
		
	}


</script>
<style type="text/css">
.input {
	margin: 5px 10px 25px 130px;
	padding: 15px 300px 15px 20px;
	border: 1px solid lightgrey;
	font-size: 22px;
	text-align: left;
	border-radius: 5px;
}

.input1 {
	margin: 5px 10px 0px 130px;
	padding: 15px 300px 15px 20px;
	border: 1px solid lightgrey;
	font-size: 22px;
	text-align: left;
	border-radius: 5px;
}

.id_input {
	margin: 5px 10px 3px 130px;
	padding: 15px 300px 15px 20px;
	border: 1px solid lightgrey;
	font-size: 22px;
	text-align: left;
	border-radius: 5px;
}

.input2 {
	margin: 5px 10px 5px 130px;
	width: 555px;
	padding: 16px;
	border: 1px solid lightgrey;
	font-size: 22px;
	text-align: left;
	border-radius: 5px;
}

.th1 {
	text-align: left;
	padding: 0px 0px 0px 130px;
	font-size: 18px;
}

.zipcode {
	margin: 5px 17px 5px 130px;
	padding: 15px 137px 15px 20px;
	border: 1px solid lightgrey;
	font-size: 22px;
	text-align: left;
	border-radius: 5px;
}

.search {
	padding: 14px 25px 14px 25px;
	background-color: white;
	border: 1px solid #8bdeff;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	font-size: 20px;
}

.confirm {
	padding: 13px 25px 14px 25px;
	background-color: white;
	border: 1px solid #8bdeff;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	font-size: 20px;
	margin: 2px 0px 0px 0px;
}

.signup {
	margin: 5px 10px 25px 130px;
	padding: 20px 251px 20px 251px;
	border: 1px solid lightgrey;
	font-size: 22px;
	text-align: center;
	border-radius: 5px;
	background-color: #8bdeff;
	color: white;
	cursor: pointer;
}

.b {
	color: red;
	font-size: 20px;
}

input::placeholder {
	color: lightgrey;
}

.check_font {
	font-size: 20px;
	padding: 0px 0px 0px 135px;
	font-weight: bold;
}

#pw_pro {
	width: 135px;
	margin: 0px 0px 20px 0px;
	padding: 20px;
}

.ta {
	margin: 0px 0px 0px 130px;
}

.ta1 {
	margin: 0px 0px 0px 125px;
}

.ta2 {
	margin: 5px 3px 0px 130px;
	width: 18px;
	height: 18px;
}

.s {
	font-size: 16px;
	margin: 0px 150px 0px 0px;
}

.a {
	color: #DAD5D4;
}

body {
	font-family: 'Do Hyeon', sans-serif;
}

input {
	font-family: 'Do Hyeon', sans-serif;
}

ul {
	list-style: none;
}

textarea {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
 <jsp:include page="/resources/include/header.jsp"/> 
<br> <br>

	<div align="center">
		<h1>회원가입</h1>	
		<br> <br> <br>
		
		<form method="post" action="user_signup_ok.do" onsubmit="return signup()">
		<table>
			
	
			<tr>
				<th class="th1">아이디<a class="b">*</a></th>
			</tr>
			
			<tr>
				<td> <input name="id" class="id_input" id="id" placeholder="4 ~ 12자, 소문자 or 숫자" onchange="id_check()"></td>
				<td>
					<input type="button" value="중복확인" class="confirm" onclick="check()">
				</td>
			</tr>
		
			<tr>
				<td colspan="2">
					<div class="check_font" id="id_check"></div><br>
				</td>
			</tr>
			
			<tr>
				<th class="th1">비밀번호<a class="b">*</a></th>
			</tr>
			
			<tr>
				<td> <input type="password" name="pwd" id="pwd" class="input" placeholder="6 ~ 16자, 특수문자 포함" onchange="check_pw()"></td>
				<td> <progress id="pw_pro" value="0" max="3" class="bar"></progress></td>
			</tr>
		
			<tr>
				<th class="th1">비밀번호 확인<b class="b">*</b></th>
			</tr>
			
			<tr>
				<td> <input type="password" name="pwd2" id="pwd2" class="input1" placeholder="비밀번호 재입력" onchange="check_pw()"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div class="check_font" id="pwd_check"></div><br>
				</td>
			</tr>
			
			
			<tr>
				<th class="th1">이름<b class="b">*</b></th>
			</tr>
			
			<tr>
				<td> <input name="name" id="user_name" class="input1" placeholder="이름을 입력해주세요" onchange="check_name()"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div class="check_font" id="name_check"></div><br>
				</td>
			</tr>
			
			<tr>
				<th class="th1">휴대전화<b class="b">*</b></th>
			</tr>
			
			<tr>
				<td> <input name="phone" id="user_phone" class="input1" placeholder="- 제외 숫자만 입력해주세요" onchange="check_phone()"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div class="check_font" id="phone_check"></div><div class="check_font" id="phone_check2"></div><br>
				</td>
				
			</tr>
			
			<tr>
				<th class="th1">이메일<b class="b">*</b></th>
			</tr>
			
			<tr>
				<td> <input name="email" class="input1" id="user_email" placeholder="이메일을 입력해주세요" onchange="check_email()"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div class="check_font" id="email_check"></div><br>
				</td>
			</tr>
			
			<tr>
				<th class="th1">주소<b class="b">*</b></th>
			</tr>
			
			<tr>
				<td colspan="2"> <input name="zipcode" id="zipcode" class="zipcode" placeholder="우편번호" readonly>
					<input type="button" value="주소 검색" class="search" onclick="findAddr()">
				</td>
			</tr>
			
			<tr>
				<td> <input name="addr1" id="addr1" class="input2" placeholder="도로명주소" readonly></td>
			</tr>
			
			<tr>
				<td> <input name="addr2" id="addr2" class="input" placeholder="상세주소"><br> <br></td>
			</tr>
			
			<tr>
				<th class="th1"><a class="a">( 필수 )</a> 이용약관 동의<b class="b">*</b></th>
			</tr>
			
			<tr>
			<td>
			<textarea rows="10" cols="80" class="ta"><jsp:include page="agreement1.jsp"/></textarea>
			<br>
			<input type="checkbox" id="c1" class="ta2" required="required"><label for="c1"><small class="s">이용약관에 동의하십니까?</small></label>
			</td>
			</tr>
			
			<tr>
				<td>
					<br><hr style="border: solid 0.5px #DAD5D4" class="ta1"><br>
				</td>
			</tr>
			
			<tr>
				<th class="th1"><a class="a">( 필수 )</a> 개인정보 수집 · 이용 동의<b class="b">*</b></th>
			</tr>
			
			<tr>
				<td>
				<textarea rows="10" cols="80" class="ta"><jsp:include page="agreement2.jsp"/></textarea>
				<br>
				<input type="checkbox" id="c2" class="ta2" required="required"><label for="c2"><small class="s">개인정보 수집 및 이용에 동의하십니까?</small></label>
				</td>
			</tr>
			
			<tr>
				<td>
					<br> <input type="submit" value="가입하기" class="signup">
				</td>
			</tr>
		</table>
		</form>
		
		
	</div>
	<br><br>
	 <jsp:include page="/resources/include/footer.jsp"/> 
</body>
</html>