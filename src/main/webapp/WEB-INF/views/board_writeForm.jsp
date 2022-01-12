<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MaP - 후기 글쓰기</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.thumb {
    width: 200px;
    margin: 0.2em -0.7em 0 0;
}

tr {
	height: 80px;
}

input {
	font-size: 20px;
	font-family: 'Do Hyeon', sans-serif;
	height: 34px;
}

textarea {
	width: 100%;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 20px;
}

.th_margin {
	margin-top: 20px;
	font-size: 20px;
}


.board_tilte {
	font-size: 30px;
	font-weight: bold;
}

.preview-de {
	color: #4078c0;
	display: inline;
	margin-right: 40px;
	
}

th {
    vertical-align: top;
    font-weight: bold;
        padding: 10px;
}

.input_width {
	    width: 100%;
}

</style>
</head>
<body>
<jsp:include page="/resources/include/header.jsp"/>
	
	<div align="center">
	   
	   <form action="${path }/map/board_writeForm" method="post" enctype="multipart/form-data">
	      
	      <table border="1" cellspacing="0" width="600" height="2px">
	      	<tr>
	            <td colspan="2" align="right">
	               <input class="btn" type="submit" value="저장">&nbsp;
	               <input class="btn" type="reset" value="다시작성">
	            </td>
	         </tr>
	         <tr>
	            <th class="th_margin">작성자</th>
	            <td> <input class="input_width" name="bwriter" value="${id}" readonly> </td>
	         </tr>
	         
	         <tr>
	            <th class="th_margin">글제목</th>
	            <td> <input class="input_width" name="btitle" required> </td>
	         </tr>
	         
	         <tr>
	            <th class="th_margin">글내용</th>
	            <td>
	               <textarea rows="7" cols="30" name="bcontent" required></textarea>
	            </td>
	         </tr>
	        
	         <tr>
	            <th class="th_margin" >첨부파일</th>
	            <td  style="padding: 10px;">
					<input type="file" name="uploadFile"  id="file" accept="image/*" required>
					<a href="#" class="preview-de">삭제</a>
					<div id="preview"></div>
				</td>
	         </tr>
	      </table>
	   </form>
	</div>
<jsp:include page="/resources/include/footer.jsp"/> 
  
	<script type="text/javascript">
	function handleFileSelect(event) {
	    var input = this;
	    console.log(input.files)
	    if (input.files && input.files.length) {
	        var reader = new FileReader();
	        this.enabled = false
	        reader.onload = (function (e) {
	        console.log(e)
	            $("#preview").html(['<img class="thumb" src="', e.target.result, '" title="', escape(e.name), '"/>'].join(''))
	        });
	        for(var i = 0; i < input.files.length; i++) {
	        	reader.readAsDataURL(input.files[i]);
	        	var reader = new FileReader();
	       		
	        }
	    }
	}
	$('#file').change(handleFileSelect);
	
	$('.preview-de').click( function() {
		$("#preview").empty()
	    $("#file").val("");
		} );


</script>
</body>
</html>