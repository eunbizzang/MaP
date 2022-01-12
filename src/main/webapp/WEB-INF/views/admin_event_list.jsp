<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 이벤트</title>
<meta name="author" content="TEAM3">
<meta name="description" content="MaP is community for Map-gu people">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minomum-scale=1">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/event.css"/>

<%--기존 css 초기화(https://cdnjs.com/libraries/meyer-reset)--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">   	
    
<%--파비콘 이미지--%>
<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/resources/img/main/favicon.png">
    
<%--폰트 적용--%> 
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">	
   	
<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/header.css">
	
<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/footer.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">

.btn_write {
	background: none;
	border: 0;
	position: absolute;
	right: 21%;
}

.btn_write:hover {
	width: 50px;
	height: 50px;
}

table {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

tr th {
	text-align: center;
	background: #8bdeff;
	padding-top: 10px;
	padding-bottom: 10px;
}

.color:hover {
	border: solid 2px #B0C4DE;
}

div {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
	margin: 0 auto;
}

tr td {
	padding-top: 5px;
	padding-bottom: 5px;
}

.t_header {
	background: #f0f0f0;
	z-index: 3;
	border-bottom: 1px solid rgb(238, 238, 238);
}

.t_header .t_header_left button {
	border: none;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
	cursor: pointer;
}

.t_header .inner {
	height: 55px;
}

.t_header .t_header_right .sign-in {
	margin-right: 4px;
}

.t_header .t_header_right .user_name {
	color: #000;
	line-height: 1;
	margin-right: 10px;
}

.t_header .t_header_right .user_name span {
	font-weight: bold;
	color: #4078c0;
}

header .main-menu {
	display: flex;
}

header .main-menu li a:hover {
	color: #8bdeff;
}

header .inner {
	position: relative;
	padding: 0;
	transition: all .2s;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	align-items: center;
}

header .main-menu li a {
	font-family: 'Black Han Sans', sans-serif;
	margin-right: 15px;
	margin-left: 15px;
	display: block; /*a태그는 인라인 요소라서 */
	padding: 20px;
	color: #000;
	font-size: 30px;
}

header .t_header {
	background: #f0f0f0;
	z-index: 3;
	border-bottom: 1px solid rgb(238, 238, 238);
}

header .t_header .t_header_left button {
	border: none;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
	cursor: pointer;
}

header .t_header .inner {
	height: 55px;
}

header .t_header .t_header_right .sign-in {
	margin-right: 4px;
}

header .t_header .t_header_right .user_name {
	color: #000;
	line-height: 1;
	margin-right: 10px;
}

header .t_header .t_header_right .user_name span {
	font-weight: bold;
	color: #4078c0;
}

header .b_header {
	border-bottom: 1px solid rgb(238, 238, 238);
	text-align: center;
	margin-bottom: 70px;
}

header .b_header .inner {
	height: 140px;
}
</style>
</head>

<body>

	<div align="center">
		<header class="section">

			<div class="t_header">
				<div class="inner ">

					<div class="t_header_center">
						<a href="#" class="user_name">admin 이벤트 관리자 모드</a> 
						<a href="map_event_list.do" class="btn sign-up">(관리자 모드 종료)</a>
					</div>
					
				</div>
			</div>
			
			<div class="b_header">
				<div class="inner">

					<div class="b_header_center">
						<a href="main.do" class="logo"> 
							<img src="<%=request.getContextPath() %>/resources/img/header/logo13.png" height="57">
						</a>
					</div>

				</div>
			</div>

		</header>


		<hr width="50%" color="marmoon">
		<h3>전체 이벤트 리스트</h3>
		<hr width="50%" color="marmoon">
		<br> <br>

		<%-- <a href="<%=request.getContextPath() %>/map_event_list.do">[이벤트 게시판]</a>
		<br><br>
 --%>
		<button type="button" class="btn_write" onclick="location.href='event_write.do'">
			<img src="<%=request.getContextPath() %>/resources/img/icon_pencil.png" height="30" width="30">
		</button>

		<br> <br>
		<table border="1" cellspacing="0" width="1000">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>

			<c:set var="list" value="${allList }" />
			<c:set var="dto" value="${Paging }" />

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="i">
					<tr class="color">
						<td>${i.getBno() }</td>
						<td><a
							href="<%=request.getContextPath() %>/admin_event_content.do?bno=${i.getBno() }&page=${dto.getPage() }">
								${i.getBtitle() }</a></td>
						<td>${i.getBhit() }</td>
						<td>${i.getBdate().substring(0, 10) }</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="4" align="center">
						<h3>이벤트가 존재하지 않습니다.</h3>
					</td>
				</tr>
			</c:if>
		</table>
		<br> <br>

		<!-- 페이징 처리 -->
		<c:if test="${dto.getPage() > dto.getBlock() }">
			<a href="map_event_admin.do?page=1">◀◀</a>
			<a href="map_event_admin.do?page=${dto.getStartBlock() - 1 }">◀</a>
		</c:if>

		<c:forEach begin="${dto.getStartBlock() }" end="${dto.getEndBlock() }"
			var="i">
			<c:if test="${i == dto.getPage() }">
				<b> <a href="map_event_admin.do?page=${i }">[${i }]</a></b>
			</c:if>

			<c:if test="${i != dto.getPage() }">
				<a href="map_event_admin.do?page=${i }">[${i }]</a>
			</c:if>
		</c:forEach>

		<c:if test="${dto.getEndBlock() < dto.getAllPage() }">
			<a href="map_event_admin.do?page=${dto.getEndBlock() + 1}">▶</a>
			<a href="map_event_admin.do?page=${dto.getAllPage() }">▶▶</a>
		</c:if>
	</div>
</body>
</html>