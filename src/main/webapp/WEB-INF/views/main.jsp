<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>MaP - 메인</title>

<meta name="author" content="TEAM3">
<meta name="description" content="MaP is community for Map-gu people">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minomum-scale=1">

<%-- 여기는 모든 페이지 적용해야할 것 --%>
<%--기존 css 초기화(https://cdnjs.com/libraries/meyer-reset)--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">

<%--파비콘 이미지--%>
<link rel="icon" type="image/png" href="<%=request.getContextPath()%>/resources/img/main/favicon.png">

<%--폰트 적용--%>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/header.css">

<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/footer.css">

<%-- 메인페이지 css import하기 --%>
<%-- import main.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/main.css">
</head>

<body>
	
	<%-- 헤더영역 include --%>
	<jsp:include page="/resources/include/header.jsp"/>
	
	<%-- 메인영역  --%>	
	<%-- visual --%>
	<section class="section section--visual">
    	<div class="inner">
        	<div class="summary">
            	<div class="summary__title">M.<span>a</span>.P</div>
                <div class="summary__description1">
                	<span>Mapogu People</span>의 줄임말
                </div>
                <div class="summary__description2">
                	<span>마포구</span>에 사는 <span>사람들</span>을 위한 <span>커뮤니티</span>
                </div>
        	</div>
    	</div>
    </section>        
        
    <section class="section section--intro">
    	<div class="inner">      
            <div class="img">
                <div class="img-ratio"></div>
            </div>
            
            <div class="summary">
                <div class="summary__title">우리 동네에 있는 사람들과  &nbsp;&nbsp;&nbsp;소통하고 싶다면</div>
                <div class="summary__description">동네 사람들을 찾나요</div>
            </div>
    	</div>         
	</section>
        
	<%-- feature--%>
    <section class="section section--feature">
    	<div class="summary">
        	<div class="summary__title">요즘 제일 인기있는 너튜브</div>
            <div class="summary__description">마포구를 키워드로한 요즘 제일 조회수가 많은 영상은</div>
		</div>

        <div class="video">
        	<div class="video-ratio">
                    <iframe width="1905" height="800" src="https://www.youtube.com/embed/Zn1nY1XHTc8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </div>
    </section> 
           
    <%-- where is --%>
    <section class="section section--where-is">
    	<div class="inner">
        	<div class="summary">
            	<div class="summary__title">요즘 많은 사람들이 다녀간 맛집</div>
                <div class="summary__description">2021년 한 해에 제일 많이 사랑 받았던 마포구 맛집</div>
            </div>

            <div id="map">
				<iframe src="<%=request.getContextPath() %>/resources/map_python.html" width="980" height="400"></iframe>
            </div>            
    	</div>
	</section>
    
    <%-- 푸터영역 include --%> 
	<jsp:include page="/resources/include/footer.jsp"/> 
        
        
</body>
</html>
