<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div id="aaa" class="col-lg-6 ">
			<iframe id="bbb" name="adver-frame"
				src="${pageContext.request.contextPath}/adver"></iframe>
		</div>


		<!-- 화면 나누기 :home 화면 오른쪽 : iframe to main -->
		<div id="ccc" class="col-lg-6">
			<!-- footer col6 -->
			<div class="nav">
				<!-- MENU -->
				<section class="servics">
					<div class="icons">
						<div class="child icon1">
							<a class="nav-link" href="${pageContext.request.contextPath}/home">
								<i class="fa fa-user-circle" style="width:40px; height:40px; color: #C6E9DC" ></i>
							</a>
						</div>

						
						<div class="child icon2">
<<<<<<<< HEAD:0720/0801_mvc2/src/main/webapp/WEB-INF/views/header.jsp
							<a class="nav-link" href="${pageContext.request.contextPath}/tip/tip">

========
							<a class="nav-link" href="${pageContext.request.contextPath}/home">
>>>>>>>> 이준혁:0811/0801_mvc2/src/main/webapp/WEB-INF/views/header.jsp
								<i class="fa fa-lightbulb" style="width:40px; height:40px; color: #C6E9DC" ></i>
							</a>
						</div>
						<div class="child icon3">
<<<<<<<< HEAD:0720/0801_mvc2/src/main/webapp/WEB-INF/views/header.jsp

							<a class="nav-link" href="${pageContext.request.contextPath}/home">

========
							<a class="nav-link" href="${pageContext.request.contextPath}/home">
>>>>>>>> 이준혁:0811/0801_mvc2/src/main/webapp/WEB-INF/views/header.jsp
								<i class="fa fa-star" style="width:40px; height:40px; color: #C6E9DC" ></i>
							</a>
						</div>
						<div class="child icon4">
							<a class="nav-link"
								href="${pageContext.request.contextPath}/home"> <i
								class="fa fa-bullhorn" style="width:40px; height:40px; color: #C6E9DC" ></i>
							</a>
						</div>
					</div>
				</section>

			</div>
			<main>
				<!-- 여백 -->
				<h3 style="margin-bottom: 60px"></h3>