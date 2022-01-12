<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 이벤트(관리자)</title>

<%-- 여기는 모든 페이지 적용해야할 것 --%>
<%--기존 css 초기화(https://cdnjs.com/libraries/meyer-reset)--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">   	

<%--폰트 적용--%> 
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">	

<%--파비콘 이미지--%>
<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/resources/img/main/favicon.png">

<style type="text/css">
.btn_menu {
	background: none;
	border: 0;
}

table tr {
	height: 65px;
}

body {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

div {
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
	margin: 0 auto;
}

.sign-up {
	font-size: 16px;
	padding: 6px 12px;
}

a {
	text-decoration: none;
	color: black;
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
	color: #8bdeff
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
	                   	<a href="map_event_list.do" class="btn btn--primary sign-up">(관리자 모드 종료)</a>   
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
	
		<c:set var="dto" value="${adminCont }" />
		<table border="0" cellspacing="0" width="500">
			<c:if test="${!empty dto }">
				<tr>
					<th><img src="<%=request.getContextPath() %>/resources/img/icon_market.png" width="30" height="30"></th>
					<td>&nbsp;&nbsp;&nbsp;${dto.getBtitle() }</td>
					<th><img src="<%=request.getContextPath() %>/resources/img/icon_glasses.png" width="30" height="30"></th>
					<td>${dto.getBhit() }</td>
				</tr>
				
				<tr>
					<th><img src="<%=request.getContextPath() %>/resources/img/icon_calendar.png" width="30" height="30"></th>
					<td colspan="3">&nbsp;&nbsp;&nbsp;${dto.getBstart().substring(0, 10) } ~ ${dto.getBend().substring(0, 10) }</td>
				</tr>
				
				<hr width="60%" color="#D3D3D3">
				<tr>
					<th></th>
					<td colspan="3" align="center"><pre>${dto.getBcont() }</pre></td>
				</tr>
				
				<tr>
					<td colspan="4"><div>
					<br><br>
						<img src="<%=request.getContextPath()%>/resources/upload/${dto.getBpath() }"
						width="950" height="1000">
					</div></td>
				</tr>
			</c:if>
			
			<c:if test="${empty dto }">
				<tr>
					<td colspan="2" align="center">
						<h3>검색된 글이 존재하지 않습니다.</h3>
					</td>
				</tr>
			</c:if>
		</table>
		<br> <br>
		
		<button type="button" class="btn_menu" 
			onclick="location.href='admin_event_update.do?bno=${dto.getBno() }&page=${page }'">
			<img src="<%=request.getContextPath() %>/resources/img/icon_pencil.png" height="30" width="30">
		</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn_menu" 
			onclick="if(confirm('정말로 이벤트를 삭제하십니까?')){
			location.href='admin_event_delete.do?bno=${dto.getBno() }&page=${page }'
			}else{return; }">
			<img src="<%=request.getContextPath() %>/resources/img/icon_trash.png" height="30" width="30">
		</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn_menu" 
			onclick="location.href='map_event_admin.do?page=${page }'">
			<img src="<%=request.getContextPath() %>/resources/img/icon_menu.png" height="30" width="30">
		</button>
		<br> <br>
				
	</div>

</body>

</html>