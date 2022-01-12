<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.btn_menu {
		background: none;
		border: 0;
	}
	
	table tr{
		height: 65px;
	}
</style>
</head>
<body>

	<%-- 헤더영역 include --%>
	<jsp:include page="/resources/include/header.jsp"/>
	
	<br><br>
	<div align="center">
		<c:set var="dto" value="${Cont }" />
		<table border="0" cellspacing="0" width="500">
			
			<c:if test="${!empty dto }">
				<tr>
					<th><img src="<%=request.getContextPath() %>/resources/img/icon_market.png" width="30" height="30"></th>
					<td>&nbsp;&nbsp;&nbsp;${dto.getBtitle() }</td>
					<th><img src="<%=request.getContextPath() %>/resources/img/icon_glasses.png" width="30" height="30"></th>
					<td width="100px">${dto.getBhit() }</td>
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
					<td colspan="3" align="center">
						<h3>검색된 글이 존재하지 않습니다.</h3>
					</td>
				</tr>
			</c:if>
		</table>
		<br> <br>
		
		<button type="button" class="btn_menu" 
			onclick="location.href='map_event_list.do?page=${page }'">
			<img src="<%=request.getContextPath() %>/resources/img/icon_menu.png" height="30" width="30">
		</button>
			
		<br> <br>
	</div>
	
	
	<%-- 푸터영역 include --%> 
	<jsp:include page="/resources/include/footer.jsp"/>
</body>
</html>