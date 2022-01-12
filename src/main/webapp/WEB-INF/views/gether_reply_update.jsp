<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP</title>
<meta name="author" content="TEAM3">
<meta name="description" content="MaP is community for Map-gu people">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minomum-scale=1">


<%-- 여기는 모든 페이지 적용해야할 것 --%>
<%--기존 css 초기화(https://cdnjs.com/libraries/meyer-reset)--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">

<%--파비콘 이미지--%>
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/img/main/favicon.png">

<%--폰트 적용 --%>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/header.css">

<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/footer.css">

<style type="text/css">

body {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

input {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	height: 34px;
}

textarea {
	width: 100%;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
	margin-bottom: 20px;
}

th {
	vertical-align: top;
	font-weight: bold;
}

.btn_left {
	margin-left: 92px;
}

.form-select {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

.board_title_font {
	font-size: 30px;
	margin-top: 70px;
}

input {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	height: 34px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp"/>
	<div align="center">
	
		<br><br>
			<h3 class="board_title_font">댓글 수정</h3>
		<br><br>
	
		<form method ="post" action="<%=request.getContextPath() %>/gether_reply_update_ok.do?page=${page}">
			<c:set value="${dto }" var="dto" />
			<table width="700">				     		
				<tr>
				  	<input type="hidden" name="rno" value="${dto.getRno() }"/>				             	
				   	<input type="hidden" name="mno" value="${dto.getMno() }"/>				             	
				   	<input type="hidden" name="rwriter" value="${dto.getRwriter() }"/>
				   	<th class="form-control">작성자</th>
				   	<td > 
				  		${dto.getRwriter() }
				   	</td>
				</tr>
				<tr>
					<th class="form-control">수정할 내용</th>
				   	<td> 
				  		<textarea rows="4" cols="50" name="rcont" class="form-control">${dto.getRcont() }</textarea>				               		
				   	</td>
				</tr>
				<tr>				
				   	<td colspan="2"> 
				   		<input type ="submit" value = "수정" class="btn btn-outline-dark">
				   		<input type ="button" value = "돌아가기" onclick="location.href='gether_board_content.do?bno=${dto.getMno()}&page=${page }'">
				   	</td>
				</tr>
			</table>
        </form>
     </div>
     <jsp:include page="/resources/include/footer.jsp"/> 
</body>
</html>