<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <meta name="author" content="TEAM3">
    <meta name="description" content="MaP is community for Map-gu people">   
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, maximum-scale=1, minomum-scale=1">
	<!--파비콘 이미지-->
    <link rel="icon" type="image/png" href="<%=request.getContextPath() %>/resources/img/main/favicon.png">

    <!--폰트 적용-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

    <!--기존 css 초기화(https://cdnjs.com/libraries/meyer-reset) 및 main.css 적용 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css">
    
    <%-- import main.css --%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css"/>
	
	<%-- import header.css --%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/header.css"/>
	
	<%-- import footer.css --%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/footer.css"/>	
	
<title>Insert title here</title>
<style>
.img {
    width: 500px;
	height: 500px;
	margin-bottom : 10px;
}
#icon {
  width:25px;
  height:25px;
  margin-right: 5px;
}
.wrapper {
	width: 1200px;
	text-align: center;/*중앙정렬*/
	margin-top : 10px;
	margin-bottom : 10px;
	margin-left : auto;
	margin-right : auto;
	padding:10px;
}
.List {
	width: 500px; height:640px;
	text-align: center;/*중앙정렬*/
	margin-top : 20px;
	margin-bottom : 10px;
	margin-left : auto;
	margin-right : auto;
	padding:30px;
	border-radius:5px;
	border: 1px solid lightgrey;
}
.search {
    border: solid 1px lightgrey;
    border-radius: 4px;
    width: 18px;
    height: 18px;
    cursor: pointer;
    padding:10px;
    margin-bottom:-13px;
    margin-left: 10px;
}
.table {
  width: 500px;
  text-align: left;
  margin-top: 10px;
  margin-bottom: 10px;
}
.write {
    border: solid 3px #87CEEB;
    border-radius: 4px;
    width: 16px;
    height: 16px;
    cursor: pointer;
    padding:10px;
    margin-right:0px;
}
.wcover {
	width: 500px;
	text-align: right;
	margin-left : auto;
	margin-right : auto;
}
input {
  width:150px;
  height:30px;
  font-size:16px;
}
.like {
  width:25px;
  height:25px;
  cursor: pointer;
}
.writer {
  text-align: left;
  color: #4078c0;
  font-size:25px;
  margin-bottom:10px;
  margin-left: 10px;
}
.grey {
  color:#888888;
  font-size: 20px;
}
.content {
   text-align:left; 
   margin-left:5px;
   margin-bottom:10px;
}
.nolist {
  margin-top:30px;
  margin-bottom:10px;
  font-size:25px;
}
</style>
</head>
<body>
<jsp:include page="/resources/include/header.jsp"/>
	<c:set var="list" value="${List }" />
	<c:set var="dto" value="${Paging }" />
	<div class="wrapper">
		<div class="wcover">
		   	
			<c:choose>
					<c:when test="${id == null}">
						<td></td>
					</c:when>
					<c:when test="${id != null}">
			            <img class="write" src="resources/img/write.png" onclick="location.href='${path }/map/board_writeForm'">
					</c:when>
			</c:choose>
			<form method="post"
		    	  action="<%=request.getContextPath() %>/board_list.do">
		      	<div>
		      	<input name="keyword" value="${dto.getKeyword() }">
		      	<input type="image" class="search" src="resources/img/search.png" value="">
		   		</div>
		   	</form>
		</div>
	    <c:if test="${!empty list }">
	        <c:forEach items="${list }" var="i">
	        	<div class="List">
	        		<div class="writer">${i.getBwriter() }</div>
	        		<div><a href="<%=request.getContextPath() %>/board_content.do?no=${i.getBno() }&page=${dto.getPage() }&keyword=${dto.getKeyword() }">
		        	<img class="img" src="resources/upload/${i.getBfile_name()}"></a></div>
	        		<div align="left"><span><img id="icon" src="resources/img/show.png">${i.getBhit() }&nbsp;
			               	<input type="hidden" name="bno" value="${i.getBno() }"></span>
			            	<span>
			            	<c:if test="${id == null}">
			            		<img id="icon" src="resources/img/nolike.png">
			            	</c:if>
			            	<c:if test="${id != null}">
		        				<c:choose>
										<c:when test="${i.getBchecklike() == 0}">
											<img class="like" idx=${i.getBno() } id="btn_like${i.getBno() }" src="resources/img/like.png">
										</c:when>
										<c:when test="${i.getBchecklike() == 1}">
								            <img class="like" idx=${i.getBno() } id="btn_like${i.getBno() }" src="resources/img/liked.png">
										</c:when>
								</c:choose>
		        			</c:if></span>
		        			<span id="likecnt${i.getBno() }">${i.getBlike()}</span>
		        			<span><img  style="margin-left:5px;"id="icon" src="resources/img/comment.png">${i.getReply_count() }</span></div>
		        	<div>
		        	<table class="table">
		        		<tr>
		        			<td width="20%" class="grey">${i.getBwriter() }</td>
		        			<td>${i.getBtitle() }</td>
			               	<td width="35%" class="grey">${i.getBdate() }</td>
			            </tr>
		        	</table></div>
		        	<div class="content">${fn:substring(i.getBcontent(),0,15) }
		        	<a href="<%=request.getContextPath() %>/board_content.do?no=${i.getBno() }&page=${dto.getPage() }&keyword=${dto.getKeyword() }"><img id="icon" src="resources/img/option.png"></a></div>
		        </div>  
			</c:forEach>
		</c:if>
		<div class="nolist">
		<c:if test="${dto.getKeyword() ne null}">
			<c:if test="${empty list }">
				<p>검색한 단어 "${dto.getKeyword() }"</p>
				게시물 목록 없음
			</c:if>
		</c:if>
		<c:if test="${dto.getKeyword() eq null}">
			<c:if test="${empty list }">
				<p>게시물 목록 없음</p>
			</c:if>
		</c:if>	
		</div>
	   <div class="paging">
	   <%-- 페이징처리 부분 --%>
	   <c:if test="${dto.getPage() > dto.getBlock() }">
	      <a href="board_list.do?page=1&keyword=${dto.getKeyword() }">◀◀</a>
	      <a href="board_list.do?page=${dto.getStartBlock() - 1 }&keyword=${dto.getKeyword() }">◀</a>
	   </c:if>
	   
	   <c:forEach begin="${dto.getStartBlock() }"
	                   end="${dto.getEndBlock() }" var="i">
	      <c:if test="${i == dto.getPage() }">
	         <b> <a href="board_list.do?page=${i }&keyword=${dto.getKeyword() }">[${i }]</a></b>
	      </c:if>
	      
	      <c:if test="${i != dto.getPage() }">
	         <a href="board_list.do?page=${i }&keyword=${dto.getKeyword() }">[${i }]</a>
	      </c:if>
	   </c:forEach>
	   
	   <c:if test="${dto.getEndBlock() < dto.getAllPage() }">
	       <a href="board_list.do?page=${dto.getEndBlock() + 1}&keyword=${dto.getKeyword() }">▶</a>
	      <a href="board_list.do?page=${dto.getAllPage() }&keyword=${dto.getKeyword() }">▶▶</a>
	   </c:if>
	   </div>
	</div>	
<jsp:include page="/resources/include/footer.jsp"/> 
<script type="text/javascript">

//로그인 후 하트 클릭 했을 때
$(".like").click(function() {
	
	// 게시물 번호확인
	let bno = $(this).attr('idx');
	let id = '<%=(String)session.getAttribute("id")%>';
	 
    $.ajax({
            type : "POST",  
            url : "board_reviewlike.do",
            dataType : "json",
            data : "bno="+bno+"&id="+id,
            error : function(){
                alert("통신 에러","error","확인",function(){});
            },
            success : function(jdata) {
            	console.log(jdata);
                if(jdata.resultCode == -1){
                    alert("좋아요 오류","error","확인",function(){});
                }
                else{
                	let count = jdata.likecnt
                    if(jdata.likecheck == 1){
                    	/* alert("좋아요 했음","error","확인",function(){}); */
                        $("#btn_like"+bno).attr("src","resources/img/liked.png");
                        $("#likecnt"+bno).empty();
                        $("#likecnt"+bno).append(count);
                    }
                    else if (jdata.likecheck == -1){
                    	/* alert("좋아요 취소","error","확인",function(){}); */
                        $("#btn_like"+bno).attr("src","resources/img/like.png");
                        $("#likecnt"+bno).empty();
                        $("#likecnt"+bno).append(count);
                        
                    }
                }
            }
        });
 });
</script>        
</body>
</html>