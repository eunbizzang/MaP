<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.background_modal { 
			width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
	}

.modal_contents {
            background: rgba( 69, 139, 220, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 40px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 800px;
            height: 550px;
            position: relative;
            top: 100px;
            padding: 10px;
            text-align: center;
        }
        
        .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        
        .b{
        	font-size: 40px;
        	font-family: 'Do Hyeon', sans-serif;
        }
        
        .searchPwd {
        	padding: 35px;
        	background: rgba( 79, 161, 94, 0.89 );
        	color: white;
        	cursor: pointer;
        	border: 1px solid green;
        	border-radius: 7px;
        	margin: 30px 0px 0px 0px;
        	font-size: 25px;
        }
        
        #id_value, #b {
        	font-size: 40px;
        	font-family: 'Do Hyeon', sans-serif;
        }
        
        .span {
        	font-size: 30px;
        }
</style>
</head>
<body>
<div id="background_modal" class="background_modal">
	<div class="modal_contents">
		<div class="close-area"><span class="span">X</span></div><br><br><br><br><br><br>
		<h2>
			<b class="b">회원님의 아이디는</b>
		</h2><br><br><br><br><br>
			<h2 id="id_value"></h2><span id="b">입니다.</span>
		
		<br><br><br><br><br>
		<input type="button" class="searchPwd" value="비밀번호 찾기" onclick="location.href='findPwd.do'">
				<br><br>
	</div>
</div>
</body>
</html>