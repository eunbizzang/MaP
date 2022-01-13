<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 함께해요</title>

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

<style type="text/css">
div.notice {
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
	vertical-align: middle;
}

.color:hover {
	border: solid 2px #B0C4DE;
}

tr {
	height: 60px;
	vertical-align: middle;
}

td {
	text-align: center;
	vertical-align: middle;
}

td a {
	text-decoration: none;
	color: black;
}

a {
	text-decoration: none;
	color: black;
}

.center {
	margin-bottom: 40px;
}

.ccc {
	text-align: left;
}

.cc {
	text-align: center;
}

input {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	height: 28px;
}

.board_font {
	font-size: 20px;
	height: 34px;
	font-family: 'Do Hyeon', sans-serif;
}

.board_title_font {
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
	
	<div align="center">
		<br><br>
		      <h2 class="board_title_font">함께해요</h2>
		<br>
		<div id="center">
			<div>
			<c:set var="dto" value="${Paging }" />
				<label class="test_obj">
					<input type="radio" name="bsecter" value="마포구 전체" 					
						<c:if test="${secter.equals('마포구 전체') }"> checked </c:if>>
    				<span><a href="gether_board_list.do">마포구 전체</a></span>
				</label>
				<label class="test_obj">
					<input type="radio" name="bsecter" value="전체" 					
						<c:if test="${secter.equals('전체') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=전체">전체</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="공덕동"				    
						<c:if test="${secter.equals('공덕동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=공덕동">공덕동</a></span>
				</label>
				<label class="test_obj">
					<input type="radio" name="bsecter" value="대흥동"				
						<c:if test="${secter.equals('대흥동') }"> checked </c:if>>
    					<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=대흥동">대흥동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="도화동"				    
						<c:if test="${secter.equals('도화동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=도화동">도화동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="망원 1동"				    
						<c:if test="${secter.equals('망원 1동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=망원 1동">망원 1동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="망원 2동"				    
						<c:if test="${secter.equals('망원 2동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=망원 2동">망원 2동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="상암동"				    	
				    	<c:if test="${secter.equals('상암동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=상암동">상암동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="서강동"				    
						<c:if test="${secter.equals('서강동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=서강동">서강동</a></span>
				</label>
				
				<br>
				
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="서교동"				    
						<c:if test="${secter.equals('서교동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=서교동">서교동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="성산 1동"				    
						<c:if test="${secter.equals('성산 1동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=성산 1동">성산 1동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="성산 2동"
				    	<c:if test="${secter.equals('성산 2동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=성산 2동">성산 2동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="신수동"				    
						<c:if test="${secter.equals('신수동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=신수동">신수동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="아현동"				    
						<c:if test="${secter.equals('아현동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=아현동">아현동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="연남동"				    
						<c:if test="${secter.equals('연남동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=연남동">연남동</a></span>
				</label>
				<label class="test_obj">
					<input type="radio" name="bsecter" value="염리동"					
						<c:if test="${secter.equals('염리동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=염리동">염리동</a></span>
				</label>
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="용강동"				    
						<c:if test="${secter.equals('용강동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=용강동">용강동</a></span>
				</label>				
				<label class="test_obj">
				    <input type="radio" name="bsecter" value="합정동"				    
						<c:if test="${secter.equals('합정동') }"> checked </c:if>>
    				<span><a href="gether_board_secter_list.do?page=${dto.getPage() }&secter=합정동">합정동</a></span>
				</label>
			</div>
		
		
			<c:if test="${!empty id }">
				<input type="button" value="글쓰기" class="btn btn-outline-dark"
							style="margin-left: 815px"
				            onclick="location.href='gether_board_write.do'">
			</c:if>
			<c:if test="${empty id }">
				
			</c:if>
		</div>
	<%-- 	<h3><a href="<%=request.getContextPath() %>/map.do">test</a></h3> --%>
		<br>
			<table cellspacing="0" border="1" width="1000">			
				<tr>
		        	<th>글 No.</th> 
		        	<th>지역</th>	         
		        	<th>글제목</th>
		        	<th>조회수</th> 
		        	<th>작성일자</th>
		    	</tr>
		      
		      <c:set var="list" value="${List }" />
		      <c:set var="dto" value="${Paging }" />
		      
		      <c:if test="${!empty list }">
		         <c:forEach items="${list }" var="i">
		            <tr>
		               <td> ${i.getBno() } </td>
		               <td> ${i.getBsecter() }</td>
		               <td> <a href="<%=request.getContextPath() %>/gether_board_content.do?bno=${i.getBno() }&page=${dto.getPage() }">
		               				${i.getBtitle() } </a></td>
		               <td> ${i.getBhit() } </td>
		               <td> ${i.getBdate().substring(0,10) } </td>
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
		   
		   <!-- list에서 오는지 search에서 오는 지 구분 -->
		   <c:set var="page" value="${page }" />
		   
		   <!-- list에서 받음 -->
		   <c:if test="${page==0 }">
			   <%-- 페이징처리 부분 --%>
			   <c:if test="${dto.getPage() > dto.getBlock() }">
			      <a href="gether_board_list.do?page=1">◀◀</a>
			      <a href="gether_board_list.do?page=${dto.getStartBlock() - 1 }">◀</a>
			   </c:if>
			   
			   <c:forEach begin="${dto.getStartBlock() }"
			                   end="${dto.getEndBlock() }" var="i">
			      <c:if test="${i == dto.getPage() }">
			         <b> <a href="gether_board_list.do?page=${i }">[${i }]</a></b>
			      </c:if>
			      
			      <c:if test="${i != dto.getPage() }">
			         <a href="gether_board_list.do?page=${i }">[${i }]</a>
			      </c:if>
			   </c:forEach>
			   
			   <c:if test="${dto.getEndBlock() < dto.getAllPage() }">
			       <a href="gether_board_list.do?page=${dto.getEndBlock() + 1}">▶</a>
			      <a href="gether_board_list.do?page=${dto.getAllPage() }">▶▶</a>
			   </c:if>
			   <br> <br>
		   </c:if>
		   
		   <!-- search 일 시 받음 -->
		   <c:if test="${page==1 }">
		   
		   		<c:set var="field" value="${field }" />
		   		<c:set var="keyword" value="${keyword }" />
		   		
			   <%-- 페이징처리 부분 --%>
			   <c:if test="${dto.getPage() > dto.getBlock() }">
			      <a href="gether_board_search.do?page=1&field=${field }&keyword=${keyword}">◀◀</a>
			      <a href="gether_board_search.do?page=${dto.getStartBlock() - 1 }&field=${field }&keyword=${keyword}">◀</a>
			   </c:if>
			   
			   <c:forEach begin="${dto.getStartBlock() }"
			                   end="${dto.getEndBlock() }" var="i">
			      <c:if test="${i == dto.getPage() }">
			         <b> <a href="gether_board_search.do?page=${i }&field=${field }&keyword=${keyword}">[${i }]</a></b>
			      </c:if>
			      
			      <c:if test="${i != dto.getPage() }">
			         <a href="gether_board_search.do?page=${i }&field=${field }&keyword=${keyword}">[${i }]</a>
			      </c:if>
			   </c:forEach>
			   
			   <c:if test="${dto.getEndBlock() < dto.getAllPage() }">
			       <a href="gether_board_search.do?page=${dto.getEndBlock() + 1}&field=${field }&keyword=${keyword}">▶</a>
			      <a href="gether_board_search.do?page=${dto.getAllPage() }&field=${field }&keyword=${keyword}">▶▶</a>
			   </c:if>
			   <br> <br>
		   </c:if>
		   
		   
		   
		   <form method="post"
		      action="<%=request.getContextPath() %>/gether_board_search.do">
		   
		      <input type="hidden" name="page" value="${dto.getPage() }">
		      <select name="field" class="board_font" >
		         <option value="title">제목</option>
		         <option value="cont">내용</option>
		         <option value="title_cont">제목+내용</option>
		         <option value="writer">작성자</option>
		      </select>
		      
		      <input name="keyword">&nbsp;&nbsp;
		      <input class="btn" type="submit" value="검색">
		   </form>		
	</div>
	
	<jsp:include page="/resources/include/footer.jsp"/> 
	
</body>
</html>