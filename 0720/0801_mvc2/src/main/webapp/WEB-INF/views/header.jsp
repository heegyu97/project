<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div id="aaa" class="col-lg-6 ">
			<div class="container" id = "bbb">
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
		</div>


		<!-- 화면 나누기 :home 화면 오른쪽 : iframe to main -->
		<div id="ccc" class="col-lg-6">
			<!-- footer col6 -->
			<div class="nav" >
				<!-- MENU -->
				<section class="servics">
					<div class="icons">
						<div class="child icon1">
							<a class="nav-link" href="${pageContext.request.contextPath}/loginform">
								<i class="fa fa-user-circle" style="width:40px; height:40px; color: #C6E9DC" ></i>
							</a>
						</div>
						<div class="child icon2">
							<a class="nav-link" href="${pageContext.request.contextPath}/tip/tip">
								<i class="fa fa-lightbulb" style="width:40px; height:40px; color: #C6E9DC" ></i>
							</a>
						</div>
						<div class="child icon3">
							<a class="nav-link" href="${pageContext.request.contextPath}/ddd">
								<i class="fa fa-star" style="width:40px; height:40px; color: #C6E9DC" ></i>
							</a>
						</div>
						<div class="child icon4">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/notice/notice"> <i
								class="fa fa-bullhorn" style="width:40px; height:40px; color: #C6E9DC" ></i>
							</a>
						</div>
					</div>
				</section>

			</div>
			<main>
				<!-- 여백 -->
				<h3 style="margin-bottom: 60px"></h3>