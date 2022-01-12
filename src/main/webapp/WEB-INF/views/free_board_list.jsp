<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 자유게시판</title>

<meta name="author" content="TEAM3">
<meta name="description" content="MaP is community for Map-gu people">   
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minomum-scale=1">
	
<%-- 여기는 모든 페이지 적용해야할 것 --%>
<%--기존 css 초기화(https://cdnjs.com/libraries/meyer-reset)--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">
    
<%--파비콘 이미지--%>
<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/resources/img/main/favicon.png">
    
<%--폰트 적용 --%>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">	
   	
<%-- import header.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/header.css">
	
<%-- import footer.css --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/footer.css">		
	
<style type="text/css">	

div .notice {
	width: 1000px;
	height: 30px;
	font-size: 25px;
	font-weight: bold;
	text-align: left;
	margin-top: 50px;
	margin-bottom: 20px;
}

tr th {
	text-align: center;
	background: #8bdeff;
}
	
.color:hover {
    border: solid 2px #B0C4DE;
}

tr {
	height: 60px;
		
}
td,th {
	vertical-align: middle;
}	
	
h3 {
	text-align: center;
	left: 150px;
	top: 50px;
}
	
td a {
	text-decoration: none;
	color: black;
	}

.ccc{
	text-align: left;
}
.cc{
	text-align: center;
}
.c{
	text-align : right;
}

.board_font{
	font-size: 20px;
	height: 34px;
	font-family: 'Do Hyeon', sans-serif;
}

input {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	height:28px;
}

.board_title_font {
	font-size: 30px;
	font-weight: bold;
	}

.dd{
	margin-right : 50px;
	padding : 2px;
	font-weight: bold;
    color: #4078c0;
}

.center {
    max-width: 980px;
    margin: 0 auto;
    box-sizing: border-box;
    position: relative;
}

.write{
    margin-left: 811px;
}

</style>
</head>

<body>

	<jsp:include page="/resources/include/header.jsp"/>
	
	<div class="center" align="center">

		<br> <br>
	      <a class="board_title_font">자유게시판</a>
	         <c:choose>
			<c:when test="${id == null}">
				<h5 align ="right" class="dd">로그인을 해주세요!</h5>
			</c:when>
			<c:when test="${id != null}">
				<h5 align ="right" class="dd">${id}님</h5>
				 <div class="center">
	            <button type="button" style="margin-left: 815px" class="btn btn-outline-dark"
	                 onclick="location.href='<%=request.getContextPath() %>/free_board_write.do'">글작성</button>     
	     		</div>
			</c:when>
			</c:choose>
			

	<br>
	<br>  
	   <table border="0" cellspacing="0" width="1000">
	      <tr>
	         <th>글 No.</th> <th>글제목</th>
	         <th>작성자</th>
	         <th>조회수</th> <th>작성일자</th>
	      </tr>
	      
	      <c:set var="list" value="${LIST }" />
	      <c:set var="dto" value="${Paging }" />
	      
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="i">
	            <tr class="color">
	               <td class="cc"> ${i.getBno() } </td>
	               <td id="ccc">${i.getBcode() } <a href="<%=request.getContextPath() %>/free_board_content.do?no=${i.getBno() }&page=${dto.getPage() }">
	               				${i.getBtitle() } </a></td>
	               <td class="cc"> ${i.getBwriter() }</td>
	               <td class="cc"> ${i.getBhit() } </td>
	               <td class="cc"> ${i.getBdate().substring(0,10) } </td>
	            </tr>
	         </c:forEach>
	      </c:if>
	      
	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="5" align="center">
	               <h3>검색된 게시물이 없습니다.....</h3>
	            </td>
	         </tr>
	      </c:if>
	      
	   </table>

	   <br> <br>
	   
	   <%-- 페이징처리 부분 --%>
	   <c:if test="${dto.getPage() > dto.getBlock() }">
	      <a href="free_board_list.do?page=1">◀◀</a>
	      <a href="free_board_list.do?page=${dto.getStartBlock() - 1 }">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${dto.getStartBlock() }"
	                   end="${dto.getEndBlock() }" var="i">
	      <c:if test="${i == dto.getPage() }">
	         <b> <a href="free_board_list.do?page=${i }">[${i }]</a></b>
	      </c:if>
	      
	      <c:if test="${i != dto.getPage() }">
	         <a href="free_board_list.do?page=${i }">[${i }]</a>
	      </c:if>
	   </c:forEach>
	   
	   <c:if test="${dto.getEndBlock() < dto.getAllPage() }">
	       <a href="free_board_list.do?page=${dto.getEndBlock() + 1}">▶</a>
	      <a href="free_board_list.do?page=${dto.getAllPage() }">▶▶</a>
	   </c:if>
	   <br> <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/free_board_search.do">
	   
	      <input  class="board_font" type="hidden" name="page" value="${dto.getPage() }">
	      <select name="field" class="board_font">
	         <option value="title" class="board_font">제목</option>
	         <option value="cont" class="board_font">내용</option>
	         <option value="writer" class="board_font">작성자</option>
	      </select>

	      <input name="keyword">
	      <button class="btn">검색</button>
	     
	   </form>
	   
	</div>
	<jsp:include page="/resources/include/footer.jsp"/> 
</body>
</html>