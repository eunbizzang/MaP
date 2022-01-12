<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 자유 글쓰기</title>

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

#body-wrapper {
	min-height: 100%;
	position: relative;
}

#body-content {
	margin-top: 0px;
	padding-bottom: 170px; /* footer의 높이 */
}

div .notice {
	width: 900px;
	height: 30px;
	font-size: 25px;
	font-weight: bold;
	text-align: left;
	margin-top: 50px;
	margin-bottom: 20px;
}

tr {
	height: 80px;
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
}

th {
	vertical-align: top;
	display: table-cell;
	font-weight: bold;
}

.th_margin {
	margin-top: 20px;
	display: block;
}

.btn_left {
	margin-left: 189px;
}

.form-select {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

.board_tilte {
	font-size: 30px;
	font-weight: bold;
}
</style>
</head>

<body>
<jsp:include page="/resources/include/header.jsp"/>

	<div id="body-wrapper">
	<div id="body-content">
<div align="center">

		<br><br>
	      <h2 class="board_tilte">글쓰기</h2>
	   <br><br>
	   
	   <hr color="#000000" width="900" size="3">
	   
	   <form method="post"
	      enctype="multipart/form-data"
         action="<%=request.getContextPath()%>/free_board_write_ok.do">
	   

	      <table border="0" cellspacing="0" width="900">
	      
	        <colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>

	         <tr>
	         	<th  class="th_margin" scope="row">카테고리</th>
	         	<td>
		         	<select class="form-select" aria-label="Default select example" name="bcode">
		         	<option>[잡담]</option>
		         	<option>[질문]</option>
		         	<option>[이슈]</option>
		         	<option>[정보]</option>
		         	<option>[기타]</option>
	         		</select>
	         	</td>
	         </tr>
	         
	         <tr>
	            <th class="th_margin">작성자</th>
	            <td> <input  class="form-control" name="bwriter" value="${id}" readonly> </td>
	         </tr>
	         
	         <tr>
	            <th class="th_margin">글제목</th>
	            <td> <input  class="form-control" name="btitle"> </td>
	         </tr>
	         
	         <tr>
	            <th>글내용</th>
	            <td>
	               <textarea class="form-control" id="exampleFormControlTextarea1" rows="25" name="bcont"></textarea>
	            </td>
	         </tr>
	         
	         <tr >
	            <th class="th_margin">첨부 파일</th>
	            <td> <input class="form-control form-control-sm" id="formFileSm" type="file" name="file1"> </td>
	         </tr>
	        
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="button" value="취소" class="btn btn_left" onclick="location.href='free_board_list.do?page=1'">&nbsp;&nbsp;&nbsp;
	               <input type="submit" value="글쓰기" class="btn">&nbsp;&nbsp;&nbsp;
	            </td>
	         </tr>
	      
	      </table>
	   </form>
	</div>
</div>
</div>
<jsp:include page="/resources/include/footer.jsp"/> 
</body>
</html>