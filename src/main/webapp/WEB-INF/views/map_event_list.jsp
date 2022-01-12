<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<style type="text/css">

.btn_write {
	background: none;
	border: 0;
	position: absolute;
	right: 30%;
}

.btn_write:hover {
	width: 50px;
	height: 50px;
}
</style>
</head>

<body>

	<%-- 헤더영역 include --%>
	<jsp:include page="/resources/include/header.jsp" />

	<div align="center">

		<br><br>

		<c:if test="${id == 'admin' }">
			<button type="button" class="btn_write" onclick="location.href='map_event_admin.do'">
				<img src="<%=request.getContextPath() %>/resources/img/icon_gear.png" height="30" width="30">
			</button>
		</c:if>

		<br><br>
		
		<div class="menu" align="center">
			<li><a href="<%=request.getContextPath() %>/map_event_list.do">진행중인 이벤트</a></li>
			<li><a href="<%=request.getContextPath() %>/end_event_list.do">종료된 이벤트</a></li>
		</div>
		
		<br> <br>

		<p class="event_text">
			<b>OPEN</b>
		</p>
		
		<br> <br>

		<table border="0" cellspacing="0" width="400">

			<c:set var="list" value="${List }" />
			<c:set var="dto" value="${Paging }" />

			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="i">
					<tr>
						<td align="center"><img
							src="<%=request.getContextPath() %>/resources/upload/${i.getBpath() }"
							height="200" width="180"><br> <a class="event_a"
							href="<%=request.getContextPath() %>/event_content.do?bno=${i.getBno() }&page=${dto.getPage() }">
								${i.getBtitle() }</a>
							<hr width="500" color="#D3D3D3"></td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr>
					<td colspan="1" align="center">
						<h3>이벤트가 존재하지 않습니다.</h3>
					</td>
				</tr>
			</c:if>
		</table>
		<br> <br>

		<!-- 페이징 처리 -->
		<c:if test="${dto.getPage() > dto.getBlock() }">
			<a class="page_a" href="map_event_list.do?page=1">◀◀</a>
			<a class="page_a"
				href="map_event_list.do?page=${dto.getStartBlock() - 1 }">◀</a>
		</c:if>

		<c:forEach begin="${dto.getStartBlock() }" end="${dto.getEndBlock() }"
			var="i">
			<c:if test="${i == dto.getPage() }">
				<b> <a class="page_a" href="map_event_list.do?page=${i }">[${i }]</a></b>
			</c:if>

			<c:if test="${i != dto.getPage() }">
				<a class="page_a" href="map_event_list.do?page=${i }">[${i }]</a>
			</c:if>
		</c:forEach>

		<c:if test="${dto.getEndBlock() < dto.getAllPage() }">
			<a class="page_a"
				href="map_event_list.do?page=${dto.getEndBlock() + 1}">▶</a>
			<a class="page_a" href="map_event_list.do?page=${dto.getAllPage() }">▶▶</a>
		</c:if>
	</div>

	<%-- 푸터영역 include --%>
	<jsp:include page="/resources/include/footer.jsp" />
	
</body>
</html>