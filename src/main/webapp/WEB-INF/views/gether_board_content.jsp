<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Map</title>

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
			<div align="center">
				<br> <br>
       			<h2 class="board_title_font">함께해요</h2>
      			<br> <br>
      			<table border="0" cellspacing="0" width="1110">
      				<c:set var="dto" value="${dto }" />
      					<c:if test="${!empty dto }">
	      					<tr class="ccc">
	           					<td class="c">
	          					     &nbsp;&nbsp;작성자 : ${dto.getBwriter() }             
	            				</td>
		                    	<td align="right">
		           					 조회 : ${dto.getBhit() }&nbsp;&nbsp;&nbsp;
		            			</td>
	            			</tr>
	            			<tr>
	            				<td class="c">
	            					&nbsp;&nbsp;지      역 : ${dto.getBsecter() }
	            				</td>
	            			</tr>
            			</c:if>
            			<c:if test="${empty dto }">
				            <tr>
				               <td colspan="2" align="center">
				                  <h3>검색된 게시글이 없습니다.....</h3>
				               </td>
				            </tr>
				         </c:if>
     			 </table>
     			 <hr color="#000000" width="1110" size="3">
      				<table border="0" cellspacing="0" width="1000">
         				<c:if test="${!empty dto }">
	            
				            <tr height="70px">
	                			<h2 class="cc">&nbsp;&nbsp;&nbsp;${dto.getBtitle() }</h2></td>
	            			</tr>
	                      
	            			<tr>								
			            		<c:if test="${dto.getBcode()!=null }">
			            			<td align="center" colspan="2"> <br><br>
			            				<img src="resources/upload/${dto.getBcode() }" 
		    		        				alt="이미지 형식이 아니거나 호환되지 않는 파일입니다." max-width="100%" length="auto">
		    		        		</td>
		            			</c:if>
							</tr>
				
							<tr>        
								<td colspan="2" align="center"> 
									<br> 
									<textarea rows="15" cols="120" style="border: 0" readonly>
										${dto.getBcont() } 
									</textarea> 
								</td>
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
							<td colspan="2">
								<hr width="1000" color="#000000">
							</td>
						</tr>
         
         
         		        <tr>
		            		<td colspan="2" align="center">
		            			<c:if test="${id.equals(dto.getBwriter()) }">
			               			<input type="button" value="글수정" class="btn btn-outline-dark"
			                  			onclick="location.href='gether_board_update.do?bno=${dto.getBno()}&page=${page }'">
			               			<input type="button" value="글삭제" class="btn btn-outline-dark"
			                  			onclick="if(confirm('정말로 게시글을 삭제하시겠습니까?')) {
			                	            location.href='gether_board_delete.do?bno=${dto.getBno()}&page=${page }'
			                  		   		}else { return; }">
			                  	</c:if>
		            			<c:if test="${! id.equals(dto.getBwriter()) }">
			               			
			                  	</c:if>
					               <input type="button" value="전체목록" class="btn btn-outline-dark"
						                  onclick="location.href='gether_board_list.do?page=${page }'">
		            		</td>
		         		</tr>         
         
      				</table>
     			 
		  
		     <br> <br> <br> <br>
		     
		    <!-- 댓글 부분 -->
		    <c:set value="${reply }" var="reply" />  
			<div>
       			<h3 style="color: lightgray">comment</h3>
       			<br>
       			<c:if test="${empty id }">
       				<tr>
			     		<td colspan="3">			 
			     			<h4>댓글을 작성하시려면 로그인을 먼저 해주세요!</h4>
			     		</td>
			     	</tr>
			    </c:if>
			    <c:if test="${!empty id }">			    
	       			<form method="post"
	          			action="<%=request.getContextPath() %>/gether_reply_insert.do?page=${page}">
	          			<table cellspacing="0" style="border-top: none" width="1110">
	          
	   					   	<input type="hidden" name="smno" value="${dto.getBno() }">
	 
	           				<tr align="left">
			            		<td>
			            			<input name="rwriter" value="${id }"readonly> </td>
		       				</tr>
	                 
					         <tr align="left">
					               <td> <textarea name="rcont" class="content1" placeholder="댓글을 남겨주세요" ></textarea></td>
					               <td align = "right" colspan="3" align="center">
					               <input type="submit" class="btn btn--primary">
					              </td>
					         </tr>
	         
					         <tr>
					            <td style="width:600px" colspan="4">
					               <hr>
					            </td>
					         </tr>
	         		         
				          </table>
					</form>
				</c:if>   
   			</div>
		     
		    
		    <table cellspacing="0" style="border-top: none" width="1110">
   				<c:if test="${!empty reply }">
			     	<c:forEach items="${reply }" var="i">
   					
   					<input type="hidden" name="mno" value="${i.getMno() }">
   
	   					<tr align="left">
	      					<td> ${i.getRwriter()}&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
	      						<c:if test="${!empty i.getRredate() }">
	      							${i.getRredate() }
	      						</c:if>
	      						<c:if test="${empty i.getRredate() }">
	      							${i.getRdate() }
	      						</c:if>      						
	      					</td>
	      
	      					<td colspan="3" align="right">
	      						<c:choose>
									<c:when test="${id != i.getRwriter()}">
										<td></td>
									</c:when>
									<c:when test="${id == i.getRwriter()}">
		      							<button type="button" class="btn "
		            						onclick="location.href='gether_reply_update.do?rno=${i.getRno()}&page=${page }'">수정</button>
		         						<button type="button" class="btn"
		            						onclick="if(confirm('삭제하시겠습니까?')) {
		               						location.href='gether_reply_delete.do?rno=${i.getRno()}&mno=${dto.getBno() }&page=${page }'
		            						}else { return; }">삭제</button>
		            				</c:when>
	            				</c:choose>
	      					</td>
	   					</tr>
	   
						<tr align="left">
							<td> <textarea readonly class="content" >${i.getRcont() }</textarea></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty reply }">
				   	<tr>
				   		<td colspan="3">등록된 댓글이 없습니다.</td>
				   	</tr>	
				</c:if>
  	 		</table>
  	 	</div>
  	 </div>
  </div>
   <jsp:include page="/resources/include/footer.jsp"/> 	
</body>
</html>