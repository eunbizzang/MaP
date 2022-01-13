<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
.wrapper {
	width: 600px; height:670px;
	text-align: center;/*중앙정렬*/
	margin-top : 50px;
	margin-bottom : 30px;
	margin-left : auto;
	margin-right : auto;
	padding:20px;
}
#iconb {
  margin-right: 5px;
  background: white;
  border: none;
  width: 32px;
  height: 32px;
  cursor: pointer;
}
#icon {
  width: 32px;
  height: 32px;
}
#bigicon {
  width:30px;
  height:30px;
  margin-right: 5px;
}
textarea {
  width: 80%;
  border-radius: 3px;
  border: 1px solid #ccc;
  box-shadow: 1px 1px 1px #999;
  font-family: 'Do Hyeon', sans-serif;
  font-size: 20px;
  margin-top:10px;
  margin-bottom:10px;
}
.img {
    width: 300px;
    height: 300px;
    margin: 0.2em -0.7em 0 0;
}
.thumb {
    width: 200px;
    margin: 0.2em -0.7em 0 0;
}
.input {
  border: solid 1px lightgrey;
  border-radius: 4px;
  width: 80%;
  height: 18px;
  padding:10px;
  margin-bottom:20px;
  margin-left: 10px; 
  font-family: 'Do Hyeon', sans-serif;
  font-size: 20px;
}
.iminput {
  width: 80%;
  height: 100%;
  padding:10px;
  margin-bottom:20px;
  margin-left: 10px; 
  font-family: 'Do Hyeon', sans-serif;
  font-size: 20px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/resources/include/header.jsp"/>
	
	<div class="wrapper">
		<c:set var="dto" value="${Cont }" />
			
	    <table border="1" cellspacing="0" width="600" style="margin-bottom:30px;">
	      	<tr>
	      		<td>
	      			
	      		</td>
	            <td align="right">
	            	<button id="iconb" onclick="window.location.reload()"><img id="icon" src="resources/img/flash.png"></button>
	            	<button id="iconb" onclick="location.href='board_content.do?no=${dto.getBno()}&page=${page }&keyword=${keyword }'">
					<img id="icon" src="resources/img/return.png"></button>
	            </td>
	         </tr>
	    </table>
	    <form action="<%=request.getContextPath() %>/board_edit_ok.do?page=${page }&keyword=${keyword }" method="post" enctype="multipart/form-data">
	    	<input class="input" type="hidden" name="bno" value="${dto.getBno() }">
	    	<input class="input" type="hidden" name="bfile_name" value="${dto.getBfile_name() }">
	    <table border="1" cellspacing="0" width="600">     
	         <tr>
	            <td>Writer</td>
	            <td> <input class="input" name="bwriter" value="${dto.getBwriter()}" readonly> </td>
	         </tr>
	         
	         <tr>
	            <td width="15%">Title</td>
	            <td> <input class="input" name="btitle" value="${dto.getBtitle() }" required> </td>
	         </tr>
	         
	         <tr>
	            <td width="15%">Content</td>
	            <td>
	            	<textarea name="bcontent" cols="30" rows="4" required>${dto.getBcontent() }</textarea>
	            </td>
	         </tr>
	        
	         <tr>
	            <td width="15%">Image</td>
	            <td>
					<input class="iminput" type="file" name="uploadFile"  id="file" accept="image/*">
				</td>
	         </tr>
	         <tr>
	         	<td width="15%">Image preview</td>
	         	<td>
	         		<div id="preview"><img class="img" src="resources/upload/${dto.getBfile_name()}"></div>
	         	</td>
	         </tr>
	         <tr>
	         	<td colspan="2">
	         	<input class="input" type="image" id="bigicon" src="resources/img/write.png" value="">
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