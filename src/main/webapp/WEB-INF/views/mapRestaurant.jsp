<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP</title>
	
	<%-- 여기는 모든 페이지 적용해야할 것 --%>
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

</head>
<body>
	<jsp:include page="/resources/include/header.jsp"/>
	<div id="wrap">
		<iframe src="<%=request.getContextPath() %>/resources/MaPloc.html"
			 width="100%" height="800px"></iframe>
	</div>
	<jsp:include page="/resources/include/footer.jsp"/>
</body>
</html>