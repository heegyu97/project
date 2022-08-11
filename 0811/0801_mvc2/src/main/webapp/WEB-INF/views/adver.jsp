<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 냥냥라이프 </title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
	</head>
	
	<body>
		<main>
			<div class="container" >
				<div style = "text-align : center">
						
				  		<!-- 로고 + 냥냥라이프 -->
				   		<img src="${pageContext.request.contextPath}/resources/img/logo.jpeg" style="width:120px; height:120px; margin-top:10px; margin-right:20px;" > 
				   		<img src="${pageContext.request.contextPath}/resources/img/newlogo.png" style="width:300px; height:220px; margin-top:10px; " > 
				  	 	
				  	 	<!-- 냥냥 라이프 쇼핑몰 소개 -->
				   		<img src="${pageContext.request.contextPath}/resources/img/knowhow.png" style="width:370px; height:200px; margin-top : 10px;">
					    
					    <!-- 광고 : slide : 추후 참조 : 변경 - 주소값 일부 불러오기  ? 값 넘기기 -->
						<div id="test" class = "carousel slide" data-ride = "carousel">
							<ul class = "carousel-indicators">
								<!-- for 첫번째 -->
								<li data-target = "#test" data-slide-to="0" class = "active"></li>
								<li data-target = "#test" data-slide-to="1"></li>
							</ul>
							<div class = "carousel-inner " style = "margin-top : 10px;">
								<!-- for 2번째 -->
								<div class = "carousel-item active">
									<img src = "${pageContext.request.contextPath}/resources/img/sus1.png" width = "370px" height = "200px">
								</div>
								<div class = "carousel-item">
									<img src = "${pageContext.request.contextPath}/resources/img/logo.jpeg" width = "360px"' height = "200px">
								</div>
							</div>
							
							<!-- controls : 화면 이동 버튼 -->
							<a class = "carousel-control-prev" href = "#test" data-slide = "prev">
								<span class ="carousel-control-prev-icon"></span>
							</a>
							<a class = "carousel-control-next" href = "#test" data-slide = "next">
								<span class ="carousel-control-next-icon"></span>
							</a>
							
						</div>
						
				   		<!-- 문의하기 : text -->
				   		<img src="${pageContext.request.contextPath}/resources/img/logo.jpeg" style="width:370px; height:200px; margin-top :10px ; margin-bottom:10px;">
				</div>
			</div>
		</main>
	
	</body>
</html>