<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 냥냥라이프 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- bootstrap to icon -->
		<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
		<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		
	</head>
	
	
	<body>
		<main>
			<div class="container" >
				<div style = "text-align : center">
						
				  		<!-- 로고 + 냥냥라이프 -->
				   		<img src="${pageContext.request.contextPath}/resources/img/logo.jpeg" style="width:150px; height:100px; margin-top:10px; margin-right:20px;" > 
				   		<img src="${pageContext.request.contextPath}/resources/img/logo.jpeg" style="width:200px; height:100px; margin-top:10px; " > 
				  	 	
				  	 	<!-- 냥냥 라이프 쇼핑몰 소개 -->
				   		<img src="${pageContext.request.contextPath}/resources/img/logo.jpeg" style="width:370px; height:200px; margin-top : 10px;">
					    
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
									<img src = "${pageContext.request.contextPath}/resources/img/bg.jpeg" width = "370px" height = "200px">
								</div>
								<div class = "carousel-item">
									<img src = "${pageContext.request.contextPath}/resources/img/logo.jpeg" width = "370px"' height = "200px">
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