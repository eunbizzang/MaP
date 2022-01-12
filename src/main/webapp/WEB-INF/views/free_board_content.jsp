<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 자유 상세</title>

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
.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 600px;
	height: 750px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}

.modal_body::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}

.content {
	margin-top: 15px;
	resize: none;
	border: 0.5px solid lightgray;
	background-color: aliceblue;
	border-radius: 7px;
	padding-left: 7px;
	padding-top: 3px;
	font-size: 13px;
}

.content1 {
	margin-top: 15px;
	resize: none;
	border: 0.5px solid lightgray;
	background-color: aliceblue;
	border-radius: 7px;
	padding-left: 7px;
	padding-top: 3px;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

.content::-webkit-scrollbar {
	display: none;
}

.content1::-webkit-scrollbar {
	display: none;
}

textarea:focus {
	outline: none;
}

#formFileSm {
	width: 300px;
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
	width: 1000px;
	height: 30px;
	font-size: 25px;
	font-weight: bold;
	text-align: left;
	margin-top: 50px;
	margin-bottom: 20px;
}

.ccc {
	background-color:;
}

.cc {
	color: #F15F5F;
}

.c {
	font-size: 20px;
}

.board_title_font {
	font-size: 30px;
	font-weight: bold;
}

.center {
	margin: 0 auto;
	box-sizing: border-box;
	position: relative;
}

input {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
}

textarea {
	width: 100%;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}
</style>
</head>

<body>
 	<jsp:include page="/resources/include/header.jsp"/>

	<div id="body-wrapper">
	<div id="body-content" class="center">
 	<div align="center" >
		<br> <br>
         <h2 class="board_title_font">자유게시판 상세화면</h2>
      <br> <br>
   
      <table border="0" cellspacing="0" width="1110">
      <c:set var="dto" value="${Cont }" />
      
      <tr class="ccc">
             <td class="c">
               &nbsp;&nbsp;작성자 : ${dto.getBwriter() }             
            </td>
                    
             <td align="right">
           	 조회 : ${dto.getBhit() }&nbsp;&nbsp;&nbsp;
            </td>
            </tr>
      </table>
      <hr color="#000000" width="1110" size="3">
      <table border="0" cellspacing="0" width="1000">
         <c:set var="dto" value="${Cont }" />
         <c:if test="${!empty dto }">
            
            <tr height="70px">
                <td align="left" style="font-size: 20px"> ${dto.getBcode() } <br><br>
                  <h2 class="cc">&nbsp;&nbsp;&nbsp;${dto.getBtitle() }</h2></td>
            </tr>
            
           
            <tr>
            	<c:if test="${dto.getBuploadd() != null }">
				<td align="center" colspan="2"> <br><br> <img src="<%=request.getContextPath()%>/resources/upload/${dto.getBuploadd() }"
					width="950" height="450"></td>
				</c:if>
			</tr>
			
			<tr>
        
				<td colspan="2" align="center"> <br> <textarea rows="15" cols="120" style="border: 0" readonly>${dto.getBcont() } </textarea> </td>
			</tr>

            <tr>
               <c:if test="${!empty dto.getBredate() }">
                  <td align="right"> 수정 일자 : ${dto.getBredate() } </td>
               </c:if>
               
               <c:if test="${empty dto.getBredate() }">
                  <td align="right"> 작성 일자 : ${dto.getBdate() } </td>
               </c:if>
            </tr>
         </c:if>
         
         <c:if test="${empty dto }">
            <tr>
               <td colspan="2" align="center">
                  <h3>작성된 글이 없습니다.</h3>
               </td>
            </tr>
         </c:if>
                 
         <tr>
            <td colspan="2" align="right">
            <c:choose>
			<c:when test="${id != dto.getBwriter()}">
				<td></td>
			</c:when>
			<c:when test="${id == dto.getBwriter()}">
               <button type="button" class="btn"
                  onclick="location.href='free_board_update.do?no=${dto.getBno()}&page=${page }'">글수정</button>
               <button type="button" class="btn"
                  onclick="if(confirm('정말로 게시글을 삭제하시겠습니까?')) {
                	            location.href='free_board_delete.do?no=${dto.getBno()}&page=${page }'
                  		   }else { return; }">글삭제</button>
            </c:when>
            </c:choose>
             
            </td>
         </tr>
         
         		<tr>
					<td colspan="2"><hr width="1110" color="#000000"></td>
				</tr>
      </table>
      
        <!-- 댓글 -->
        <br><br><br><br>
    
    <div>
       <br>
	      <h2 class="board_title_font" style="color: lightgray">comment</h2>
	        <c:choose>
			<c:when test="${id == null}">
				<td></td>
			</c:when>
			<c:when test="${id != null}">
       <form method="post"
          action="free_reply_write.do?page=${page }&keyword=${keyword }">
          <table cellspacing="0" style="border-top: none" width="1110">
          <c:set var="i" value="${rlist }" />
          <c:set var="dto" value="${Cont}"/>
   
   

   	<input type="hidden" name="bno" value="${dto.getBno() }">
 
           <tr align="left">
	            <td><input name="rwriter" value="${id }"readonly> </td>
	       </tr>
         
         
         <tr align="left">
               <td> <textarea name="rcont" class="content1" placeholder="댓글을 남겨주세요" ></textarea></td>
               <td align = "right" colspan="3" align="center">
               <input type="submit" class="btn" value="등록">
              </td>
         </tr>
         
         <tr>
            <td style="width:600px" colspan="4">
               <hr>
            </td>
         </tr>
         
         
         
          </table>
       </form>

      </c:when>
</c:choose>
   </div>
   
    <table cellspacing="0" style="border-top: none" width="1110">
   <c:set var="rdto" value="${rlist }" />
   
   
   <c:forEach items="${rlist }" var="i">
   <input type="hidden" name="bno" value="${i.getBno() }">
   
   <tr align="left">
      <td> ${i.getRwriter()}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;${i.getRdate() }</td>
      
      <td colspan="3" align="right">
      	<c:choose>
			<c:when test="${id != i.getRwriter()}">
				<td></td>
			</c:when>
			<c:when test="${id == i.getRwriter()}">
      	<button type="button" class="btn "
            onclick="location.href='free_reply_update.do?no=${i.getNo()}&page=${page }'">수정</button>
         <button type="button" class="btn"
            onclick="if(confirm('삭제하시겠습니까?')) {
               location.href='free_reply_delete.do?bno=${dto.getBno()}&no=${i.getNo()}&page=${page }&keyword=${keyword }'
            }else { return; }">삭제</button>
            </c:when>
            </c:choose>
      </td>
   </tr>

   
   <tr align="left">
      <td> <textarea readonly class="content" >${i.getRcont() }</textarea></td>
   </tr>

   
   
   </c:forEach>
   </table>
   </div>
</div>
</div>
<jsp:include page="/resources/include/footer.jsp"/> 
</body>
</html>