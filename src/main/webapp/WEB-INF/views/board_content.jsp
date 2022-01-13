<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<style>
body {
	font-family: 'Do Hyeon', sans-serif;
	height:100%;
}

#body-content {
    position: relative;
    margin-left: 100px;
}

.img {
    width: 600px;
	height: 600px;
}
textarea {
  box-sizing: border-box;
  resize: both;
}
.wrapper {
	width: 800px; 
	text-align: center;/*중앙정렬*/
	margin-top : 20px;
	margin-bottom : 10px;
	margin-left : auto;
	margin-right : auto;
	padding:20px;
	float:left
}
.wrapperfortextarea {
	width: 100%; 
	text-align: center;/*중앙정렬*/
	clear: both;
}
.leftboard {
	width: 400px; 
	height:480px;
	text-align: center;/*중앙정렬*/
	margin-top : 160px;
	margin-bottom : 10px;
	margin-left : auto;
	margin-right : auto;
	padding:20px;
	float:left;
	border-radius:5px;
	border: 1px solid lightgrey;
}
.rightboard {
	width: 400px; 
	height:480px; 
	text-align: center;/*중앙정렬*/
	margin-top : 160px;
	margin-bottom : 10px;
	margin-left : auto;
	margin-right : auto;
	padding:20px;
	float:left;
	border-radius:5px;
	border: 1px solid lightgrey;
}
.width {
  text-align:left;
  margin-left:110px;
  margin-top: 10px;
  margin-bottom: 15px;
  width:800px;
  font-size: 25px;
}
#comment {
  margin-top:40px;
  padding:auto;
  text-align: center;/*중앙정렬*/
  margin-left: 550px;
}
.commentlist {
  text-align: left;
  margin-left:105px;
}
#icon {
  width:25px;
  height:25px;
  margin-right: 5px;
}
.like {
  width:25px;
  height:25px;
  margin-right: 5px;
  cursor: pointer;
}
button {
	background: url( "resources/img/bin.png" ) no-repeat;
    border: none;
    height: 32px;
    cursor: pointer;
}
#button {
  width:40px;
  height:40px;
}
.date {
  margin-left: 120px;
}
.date2 {
  margin-left: 280px;
}
.tag {
  width:20px; 
  height:20px;
  margin-right: 10px;
}
.title {
  margin-left:110px;
  margin-top: 20px;
  margin-bottom: 20px;
  font-size:25px;
  
}
.textarea {
    padding: 10px;
    width: 42%;
    max-height: 100%;
    line-height: 1.5;
    border-radius: 3px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
    font-family: 'Do Hyeon', sans-serif;
	font-size: 23px;
	margin-left: 492px;
}
.textarea2 {
    padding: 10px;
    width: 600px;
    height: 150px;
    border-radius: 3px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
    font-family: 'Do Hyeon', sans-serif;
	font-size: 23px;
	margin-left: auto;
	margin-right: auto;
}
.comtextarea {
    padding: 10px;
    width: 100%;
    border-radius: 3px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
    font-family: 'Do Hyeon', sans-serif;
	font-size: 23px;
	margin-left: 53px;
}
.comarea {
    padding: 10px;
    width: 450px;
    height: 100%;
    border-radius: 3px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
    font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}
.writerarea {
    padding: 10px;
    margin-left:20px;
    width: 80px;
    height: 100%;
    border-radius: 3px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
    font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}
.updatecomment {
  margin-top:40px;
  padding:auto;
  text-align: center;/*중앙정렬*/
  display:none;
}
.loginplz {
  margin-bottom: 20px;
}
.comments {
  margin-bottom:20px;
}
.cmtwrite {
  width: 50px;
  height: 50px;
  margin-bottom: 10px;
  margin-left: 20px;
}
#keyword {
  width:150px;
  height:30px;
  font-size:16px;
}
#keyworddiv {
  text-align:center;
  margin-top:20px;
}
#imgsmall {
  width: 400px; 
  height: 400px;
  opacity:0.5;
}
#imgsmall:hover { 
  opacity: 1.0; 
}


</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/resources/include/header.jsp"/>
	<div id="body-wrapper">
	<div id="body-content">
		<c:set var="pnk" value="${pnk }" />
	<div class="leftboard">
		<c:set var="left" value="${leftboard }" />
		<c:if test="${left eq null }">
			<img id="icon" src="resources/img/close.png">
		</c:if>
		<c:if test="${left ne null}">
			<a href="<%=request.getContextPath() %>/board_content.do?no=${left.getBno() }&page=${pnk.getPage() }&keyword=${pnk.getKeyword() }">
			<img id="imgsmall" src="resources/upload/${left.getBfile_name()}"></a>
			<div class="writer">${i.getBwriter() }</div>
	        <div align="left"><span><img id="icon" src="resources/img/show.png">${left.getBhit() }&nbsp;
			    <input type="hidden" name="bno" value="${left.getBno() }"></span>
			    <span><img id="icon" src="resources/img/nolike.png">${left.getBlike()}</span>
		        <span><img  style="margin-left:5px;"id="icon" src="resources/img/comment.png">${left.getReply_count() }</span>
		    </div>
		    <div>
		        <table class="table">
		        	<tr>
		        		<td width="20%" class="grey">${left.getBwriter() }</td>
		        		<td>${left.getBtitle() }</td>
			           	<td width="35%" class="grey">${left.getBdate() }</td>
			        </tr>
		        </table>
		    </div>
		</c:if>
	</div>
	<div class="wrapper">
		<c:set var="dto" value="${Cont }" />
		<c:set var="rnum" value="${rnum }" />
		<c:if test="${id eq dto.getBwriter()}">
			<button onclick="location.href='board_edit.do?no=${dto.getBno()}&page=${pnk.getPage() }&keyword=${pnk.getKeyword() }'">
				<img id="icon" src="resources/img/edit.png"></button>
			<button onclick="if(confirm('정말로 게시글을 삭제하시겠습니까?')) {
				location.href='board_delete.do?no=${dto.getBno()}&page=${pnk.getPage() }'
				}else { return; }"><img id="icon" src="resources/img/bin.png"></button>
		</c:if>
			<button onclick="location.href='board_list.do?page=${pnk.getPage() }&keyword=${pnk.getKeyword() }'">
				<img id="icon" src="resources/img/return.png"></button>
			
			<div class="width">
				<span style="color: #4078c0;">${dto.getBwriter() }</span>
		        <span class="date2">${dto.getBdate() }</span>
		    </div>
            <p><img class="img" src="resources/upload/${dto.getBfile_name()}"></p>
            
            <div class="title">
            <table width="600px">
            	<tr>
            		<td style="text-align:left;"><span>${dto.getBtitle() }</span>
            		</td>
            		<td width="43%">
		            	<span>
		            	<img id="icon" src="resources/img/show.png">${dto.getBhit() }&nbsp;
			        	<c:if test="${!empty id}">
				        	<c:if test="${liked == '0'}">
					    		<img id="btn_like" class="like" src="resources/img/like.png">
					    	</c:if>
					    	<c:if test="${liked eq '1'}">
					    		<img id="btn_like" class="like"  src="resources/img/liked.png">
					    	</c:if>
					    	<span id="likecnt">${dto.getBlike()}</span>
				    	</c:if>
				    	<c:if test="${empty id }">
				    		<img id="icon" src="resources/img/nolike.png">${dto.getBlike() }
				    	</c:if>
				    	<img id="icon" style="margin-left:5px;" src="resources/img/comment.png">${dto.getReply_count() } 
			        	</span>
            		</td>
            	</tr>
            	<tr>
            		<td colspan="2" style="text-align:right;">
            			<span class="date">
		            	<c:if test="${!empty dto.getBredate() }">
							${dto.getBredate() } 수정됨
						</c:if>
		            	</span>
            		</td>
            	</tr>
            </table>
            </div>
       </div>     

	<div class="rightboard">
		<c:set var="right" value="${rightboard }" />
		<c:if test="${right eq null }">
			<img id="icon" src="resources/img/close.png">
		</c:if>
		<c:if test="${right ne null}">
			<a href="<%=request.getContextPath() %>/board_content.do?no=${right.getBno() }&page=${pnk.getPage() }&keyword=${pnk.getKeyword() }">
			<img id="imgsmall" src="resources/upload/${right.getBfile_name()}"></a>
			<div class="writer">${i.getBwriter() }</div>
	        <div align="left"><span><img id="icon" src="resources/img/show.png">${right.getBhit() }&nbsp;
			    <input type="hidden" name="bno" value="${right.getBno() }"></span>
			    <span><img id="icon" src="resources/img/nolike.png">${right.getBlike()}</span>
		        <span><img  style="margin-right:5px;"id="icon" src="resources/img/comment.png">${right.getReply_count() }</span>
		    </div>
		    <div>
		        <table class="table">
		        	<tr>
		        		<td width="20%" class="grey">${right.getBwriter() }</td>
		        		<td>${right.getBtitle() }</td>
			           	<td width="35%" class="grey">${right.getBdate() }</td>
			        </tr>
		        </table>
		    </div>
		</c:if>
	</div>
	</div>
	
	<div class="wrapperfortextarea">
		<textarea class="textarea2" readonly>${dto.getBcontent() }</textarea>
    </div>        
			<div id="comment">
				<div class="comments"><img id="icon" src="resources/img/comment.png"><span style="font-size:30px;margin-right: 50%;">Comments</span></div>
				
				<div class="loginplz">
					<c:if test="${empty id }">
							<a href="user_loginPage.do" class="btn sign-in">로그인</a>을 하시면 댓글을 등록할 수 있습니다.
					</c:if>
				</div>
				<div class="commentlist">
					<form method="post"
						action="<%=request.getContextPath() %>/comment_insert.do?page=${pnk.getPage() }&keyword=${pnk.getKeyword() }">
						<c:if test="${!empty id }">
						<table width="590">	
							<tr>
								<td width="80%">
									<input type="hidden" name="bno" value="${dto.getBno() }"/>
									<div style="float: left;" class="textareaPosition">
										<textarea class="comarea" name="content" placeholder="댓글을 입력하세요."></textarea>
									</div>
								</td>
								<td>
									<div style="float: left;">
										<input type="hidden" name="writer" value="${id}" />
										<button type="submit"><img class="cmtwrite" src="resources/img/icon_pencil.png"></button>
									</div>
								</td>
							</tr>
						</table>		
						</c:if>
            		</form>
				</div>
	
      			<c:set var="list" value="${rlist }" />
	      		<c:if test="${!empty list }">
	            <c:forEach items="${list }" var="i">
	            	<div class="commentlist">
			            <table width="650px">
				            <tr>
				            	<td width="80%" style="color: #4078c0; font-size:20px;"> ${i.getWriter() }</td>
				            	<td rowspan="3">
					               <c:if test="${id eq i.getWriter()}">
					               
					               		<button id="button"  class="updatecom" idx="${i.getNo()}" ><img id="icon" src="resources/img/option.png"></button>
					               		<button onclick="if(confirm('댓글을 삭제하시겠습니까?')) 
					               				{location.href='comment_delete.do?bno=${dto.getBno()}&no=${i.getNo()}&page=${pnk.getPage() }&keyword=${pnk.getKeyword() }'
					                  		   }else { return; }"><img id="icon" src="resources/img/bin.png"></button>
					               </c:if>
					            </td>
				            </tr>
				            <tr>   	
				               	<c:if test="${i.getRdate() == null}">
				               		<td style="font-size:16px;"> ${i.getWdate() }</td>
				               	</c:if>
				               	<c:if test="${i.getRdate() != null}">
				               		<td style="font-size:16px;"> ${i.getRdate() } [수정됨]</td>
				               	</c:if>
				            </tr>
				            <tr>   	
				               	<td style="font-size:22px;"> <div id="comment${i.getNo() }">${i.getContent() }</div></td>
				            </tr>
						</table>
					</div>
					<div class="commentlist">
						
						<div class="updatecomment" id="updatecomment${i.getNo() }">
							
							<form method="post"
								action="<%=request.getContextPath() %>/comment_update.do?bno=${dto.getBno()}&page=${pnk.getPage() }&keyword=${pnk.getKeyword() }"> 
								<table width="590">	
									<tr>
										<td width="80%">
											<input type="hidden" name="no" value="${i.getNo() }"/>
											<div style="float: left;">
												<textarea class="comarea" placeholder="수정할 내용을 입력하세요." name="content"></textarea>
											</div>
										</td>
										<td>
											<div style="float: left;">
												<input class="writerarea" name="writer" value="${id}" readonly>
											</div>
											<div style="clear: both;">
												<button id="button" class="commentok" type="submit"><img id="icon" src="resources/img/check.png"></button>
											<img id="icon" class="updatewrite" idx="${i.getNo()}"  src="resources/img/close.png">
											</div>
										</td>
		            				</tr>
		            			</table>	
		            		</form>
	            		</div>
	            	</div>
				</c:forEach>  
			</c:if>       
		</div>
	
	</div>
<jsp:include page="/resources/include/footer.jsp"/>
<script type="text/javascript">

var bno = ${dto.getBno()};
var id = '<%=(String)session.getAttribute("id")%>';
 
var btn_like = document.getElementById("btn_like");
 btn_like.onclick = function(){ changeHeart(); }
 
/* 좋아요 버튼 눌렀을떄 */
function changeHeart(){ 
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
                        $("#btn_like").attr("src","resources/img/liked.png");
                        $("#likecnt").empty();
                        $("#likecnt").append(count);
                    }
                    else if (jdata.likecheck == -1){
                    	/* alert("좋아요 취소","error","확인",function(){}); */
                        $("#btn_like").attr("src","resources/img/like.png");
                        $("#likecnt").empty();
                        $("#likecnt").append(count);
                        
                    }
                }
            }
        });
 }
/* var btn_comment = document.getElementById("btn_comment");
btn_comment.onclick = function(){ commentShow(); }
 */
/* 댓글 수정 눌렀을떄 */
$(".updatecom").click(function() {
	
let no = $(this).attr('idx');
$("#updatecomment"+no).show();

})

/* 댓글 취소 버튼 눌렀을때 */
$(".updatewrite").click(function() {
		
let no = $(this).attr('idx');
$("#updatecomment"+no).hide();
})

/* 댓글 수정 submit 버튼 눌렸을때  */
/* $(".commentok").click(function() {
	
    $.ajax({
            type : "POST",  
            url : "comment_update.do",
            data : $("#commentupdate").serialize(),
            error : function(){
                alert("통신 에러","error","확인",function(){});
            },
            success : function(data) {
            	console.log(data);
                if(data.resultCode == -1){
                    alert("좋아요 오류","error","확인",function(){});
                }
                else{
                	let count = jdata.likecnt
                    if(data.likecheck == 1){
                    	/* alert("좋아요 했음","error","확인",function(){}); */
                        /* $("#btn_like").attr("src","resources/img/liked.png");
                        $("#likecnt").empty();
                        $("#likecnt").append(count);
                    } */
                    /* else if (data.likecheck == -1){ */
                    	/* alert("좋아요 취소","error","확인",function(){}); */
                        /* $("#btn_like").attr("src","resources/img/like.png");
                        $("#likecnt").empty();
                        $("#likecnt").append(count);
                        
                    }
                }
			},
			error : function() {
				alert('통신 오류입니다.');
			}
        });
 }); */
 
</script>
</body>
</html>