<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>map사이트 푸터영역</title>
</head>

<body>

<footer class="section">
	<div class="inner ">
            
		<div class="company">
	    	<div class="company-list">
		    	<a href="#" >회사소개</a>
		        	<b >|</b>
		            <a href="#" >&nbsp;이용약관</a>
		            <b >|</b>
		            <a href="#" >&nbsp;운영정책</a>
		            <b >|</b>
		            <a href="#" >&nbsp;개인정보처리방침</a>
		            <b >|</b>
		            <a href="#" >&nbsp;광고운영정책</a>
		            <b >|</b>
		            <a href="#" >&nbsp;청소년보호정책</a>
		            <b >|</b>
		            <a href="#" >위치기반서비스 이용약관</a>
			</div>
		</div>
           
		<div class="customer">
            <ul>
            	<li class="customer-list-item">고객문의 <a href="#">cs@map.com</a></li>
              	<li class="customer-list-item">이벤트.광고문의 <a href="#">event@map.com</a></li>
        	</ul>
            <ul class="customer-list customer-list-light">
            	<li class="customer-list-item"><address>서울특별시 마포구 월드컵북로 21 풍성빌딩 1층</address></li>
                <b >|</b>
                <li class="customer-list-item">사업자 등록번호 : 777-77-77777</li>                	    
                <li class="customer-text">©Map Inc.</li>
            </ul>
		</div>                
                
		<div class="social">
			<ul class="social-list">
				<li class="social-list-item">
			        <a class="footer-social-link" href="#">
				    	<img src="<%=request.getContextPath() %>/resources/img/footer/facebook.svg">			
					</a>        
				</li>
			    <li class="social-list-item">
			    	<a class="footer-social-link" href="#">
				    	<img src="<%=request.getContextPath() %>/resources/img/footer/instagram.svg">				   
			    	</a>       
				</li>
			    <li class="social-list-item">
				     <a class="footer-social-link" href="#">
					     <img src="<%=request.getContextPath() %>/resources/img/footer/blog.svg">					   
				     </a>
			    </li>
			    <li class="global-links">
			    	<img src="<%=request.getContextPath() %>/resources/img/footer/global.png" width="24" height="24">
			        <select class="global-links-select">
				    	<option >한국어</option>
				        <option >영어</option>
				        <option >중국어</option>
				        <option >일본어</option>               	
			    	</select>	
			    </li>            
			</ul>          
        </div>
                
	</div> 
</footer>
</div>
</body>
</html>