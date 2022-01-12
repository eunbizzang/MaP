<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>map사이트 헤더영역</title>

    <%--파비콘 이미지--%>
    <link rel="icon" type="image/png" href="<%=request.getContextPath() %>/resources/img/main/favicon.png">
    
    <%--폰트 적용--%> 
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">	
    
</head>
<body>
	<div class="body__container">
    
    <%--헤더--%>
    <header class="section section_header">

	<div class="t_header">
	<div class="inner ">
		<div class="t_header_left">
			<button onclick="alert('현재 준비 중입니다.')" >
		    	<img src="<%=request.getContextPath() %>/resources/img/header/logo11.png" width="16" height="15" alt="앱다운로드버튼 이미지">
		                앱다운로드
		    </button>
		    
		    <button onclick="alert('Ctrl+D 키를 누르면 즐겨찾기에 추가하실 수 있습니다.')" >		        	
		    	<img src="<%=request.getContextPath() %>/resources/img/header/star.svg" width="16" height="15" alt="즐겨찾기버튼 이미지">
		       	 즐겨찾기
		    </button>
		    
		    <button onclick=location.href="<%=request.getContextPath() %>/map.do" >		        	
		    	<img src="<%=request.getContextPath() %>/resources/img/header/google.png" width="16" height="15" alt="즐겨찾기버튼 이미지">
		       	 맛집지도
		    </button>
		    
		</div>
		
		<div class="t_header_right">
            	<c:if test="${empty id }">
                	<a href="user_loginPage.do" class="btn sign-in">로그인</a>
                    <a href="user_signup.do" class="btn btn--primary sign-up">회원가입</a>
                </c:if>
                     
               	<c:if test="${!empty id}">
                	<a href="#" class="user_name"><span>${id }님</span> 환영합니다.</a>
                   	<a href="logout.do" class="btn btn--primary sign-up">로그아웃</a>
                   	<a href="modify.do?id=${id }" class="btn btn--primary sign-up">내정보</a>               	
                </c:if>   
		</div>
	</div>	
	</div>
	<div class="b_header">
	<div class="inner">
		<div class="b_header_left">
			<ul class="main-menu">
            	<li><a href="free_board_list.do">자유게시판</a></li>
                <li><a href="board_list.do">후기</a></li>                       
        	</ul>
		</div>
		<div class="b_header_center">
			<a href="main.do" class="logo">
            	<img src="<%=request.getContextPath() %>/resources/img/header/logo13.png"  height="57">
            </a>
		</div>
		<div class="b_header_right">
			<ul class="main-menu ">
            	<li><a href="gether_board_list.do">함께해요</a></li>
                <li><a href="map_event_list.do">이벤트</a></li>
         	</ul> 
		</div>
	</div>
	</div>
	
	</header>
		
		<%-- 메인 페이지 계속 --%>
     
</body>
</html>