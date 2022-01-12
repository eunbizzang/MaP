<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%-- import header.css --%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/header.css">
<%--폰트 적용--%> 
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
	$(function() {
		$("#startDatepicker").datepicker({
			todayHighlight: true,
			dateFormat: "yy-mm-dd"
		});
		
		$("#endDatepicker").datepicker({
			todayHighlight: true,
			dateFormat: "yy-mm-dd"
		});
		
		$("#endDatepicker").datepicker("option", "minDate", $("startDatepicker").val());
		$("#endDatepicker").datepicker("option", "onClose", function(selectedDate){
			$("#startDatepicker").datepicker("option", "maxDate", selectedDate);
		});
		
		$("#startDatepicker").datepicker("option", "maxDate", $("endDatepicker").val());
		$("#startDatepicker").datepicker("option", "onClose", function(selectedDate){
			$("#endDatepicker").datepicker("option", "minDate", selectedDate);
		});
	});
</script>

<style type="text/css">

	table {
		text-align: center;
	}
	
	body {
		font-family: 'Do Hyeon', sans-serif;
    	font-size: 20px;
	}
</style>
</head>
<body>

	<div align="center">
		<h3>이벤트 수정 페이지</h3>
		<hr width="50%" color="#8bdeff">
		<br> <br>
		
		<form method="post" enctype="multipart/form-data" 
			action="<%=request.getContextPath() %>/admin_event_update_ok.do">
			<c:set var="dto" value="${modify }" />
			<input type="hidden" name="bno" value="${dto.getBno() }">
			<input type="hidden" name="page" value="${page }">
			<table border="0" cellspacing="0" width="570">
				<tr>
					<th>제목</th>
					<td> <input name="btitle" value="${dto.getBtitle() }" readonly size="51"> </td>
				</tr>
				
				<tr height="80">
					<th>이벤트 기간</th>
					<td> <input name="bstart" value="${dto.getBstart().substring(0, 10) }" id="startDatepicker"> 
						&nbsp;~&nbsp; <input name="bend" value="${dto.getBend().substring(0, 10) }" id="endDatepicker">
					</td>
				</tr>
				
				<tr height="80">
					<th>내용</th>
					<td>
						<textarea rows="10" cols="60" name="bcont">${dto.getBcont() }</textarea>
					</td>
				</tr>
				
				<tr height="80">
					<th>첨부파일</th>
					<td>
						<input type="file" name="file">
					</td>
				</tr>
			</table>
			<br> <br>
			
			<input class="btn" type="submit" value="수정완료">&nbsp;&nbsp;&nbsp;
			<input class="btn" type="reset" value="다시작성">
		</form>
	</div>
</body>
</html>