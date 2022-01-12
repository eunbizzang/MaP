<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Map</title>
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
		.test_obj input[type="radio"] {
        display: none;
        }
 
    	.test_obj input[type="radio"] + span {
        display: inline-block;
        padding: 10px 5px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
        margin:3px;
    	}
 
    	.test_obj input[type="radio"]:checked + span {
      	background-color: #57d2ff;
      	color: #ffffff;
    	}
</style>
</head>
<body>
	<jsp:include page="/resources/include/header.jsp"/>
	<div id="body-wrapper">
		<div id="body-content">
			<div align="center">
			   
			   	<br><br>
	      		<h2 class="board_title_font">글 수정페이지</h2>
	   			<br><br>
			   
			   <hr color="#000000" width="1000" size="3">
			   
			   <form method="post" enctype="multipart/form-data"
			      action="<%=request.getContextPath() %>/gether_board_update_ok.do">
			   
			    <c:set var="dto" value="${modify }" />
			      
			    <input type="hidden" name="bno" value="${dto.getBno() }">
			    <input type="hidden" name="page" value="${page }">
			    <input type="hidden" name="bcode" value="${dto.getBcode() }"> 
				<input type="hidden" name="bupload" value="${dto.getBupload() }">
			      
			      <table border="1" cellspacing="0" width="1000">		
			      			
			      			<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
			      		
							<tr>
								<th class="th_margin">작성자</th>
								<td><input name="bwriter" value="${dto.getBwriter() }" class="form-control" readonly></td>
							</tr>
							
							<tr>
								<th class="th_margin">글제목</th>
								<td><input name="btitle" value="${dto.getBtitle() }" class="form-control"></td>
							</tr>
		
							<tr>
								<th>지역 선택</th>
								<td>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="전체" <c:if test="${dto.getBsecter() eq '전체'}">checked</c:if>>
		    								<span>마포구 전체</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="공덕동" <c:if test="${dto.getBsecter() eq '공덕동'}">checked</c:if>>
		    								<span>공덕동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="아현동" <c:if test="${dto.getBsecter() eq '아현동'}">checked</c:if>>
		    								<span>아현동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="도화동" <c:if test="${dto.getBsecter() eq '도화동'}">checked</c:if>>
		    								<span>도화동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="용강동" <c:if test="${dto.getBsecter() eq '용강동'}">checked</c:if>>
		    								<span>용강동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="대흥동" <c:if test="${dto.getBsecter() eq '대흥동'}">checked</c:if>>
		    								<span>대흥동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="염리동" <c:if test="${dto.getBsecter() eq '염리동'}">checked</c:if>>
		    								<span>염리동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="신수동" <c:if test="${dto.getBsecter() eq '신수동'}">checked</c:if>>
		    								<span>신수동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="서강동" <c:if test="${dto.getBsecter() eq '서강동'}">checked</c:if>>
		    								<span>서강동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="서교동" <c:if test="${dto.getBsecter() eq '서교동'}">checked</c:if>>
		    								<span>서교동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="합정동" <c:if test="${dto.getBsecter() eq '합정동'}">checked</c:if>>
		    								<span>합정동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="망원 1동" <c:if test="${dto.getBsecter() eq '망원 1동'}">checked</c:if>>
		    								<span>망원 1동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="망원 2동" <c:if test="${dto.getBsecter() eq '망원 2동'}">checked</c:if>>
		    								<span>망원 2동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="연남동" <c:if test="${dto.getBsecter() eq '연남동'}">checked</c:if>>
		    								<span>연남동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="성산 1동" <c:if test="${dto.getBsecter() eq '성산 1동'}">checked</c:if>>
		    								<span>성산 1동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="성산 2동" <c:if test="${dto.getBsecter() eq '성산 2동'}">checked</c:if>>
		    								<span>성산 2동</span>
										</label>
										<label class="test_obj">
										    <input type="radio" name="bsecter" value="상암동" <c:if test="${dto.getBsecter() eq '상암동'}">checked</c:if>>
		    								<span>상암동</span>
										</label>
									</td>
							</tr>
							
							<tr>
								<th>글내용</th>
								<td>
									<textarea rows="10" cols="30"
										name="bcont" class="form-control" id="exampleFormControlTextarea1">
										${dto.getBcont() }
									</textarea>
								</td>
							</tr>
							
							<tr>
								<th class="th_margin">첨부 파일</th>
								<td>
									<img src="resources/upload/${dto.getBcode() }"
									width="100%" height="auto" class="form-control form-control-sm" id="formFileSm" >
									<input type="file" name="file_new">							 
								</td>
							</tr>
							
							<tr>					
								<td colspan="2" align="center">
									<input type="submit" value="글쓰기" class="btn btn-outline-dark">&nbsp;&nbsp;
									<input type="reset" value="다시 작성" class="btn btn-outline-dark">
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