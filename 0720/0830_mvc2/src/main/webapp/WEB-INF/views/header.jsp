<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".bgm_view").click(function() {
					bgm.src = "${pageContext.request.contextPath}/resources/"+ $(this).attr('value');
				});
				$(".bgm_play").click(function() {
					bgm.play();
				});
				$(".bgm_stop").click(function() {
					bgm.pause();
				});
			});//ready
			
		</script>
		
		<div class="container">
			<div class="text-right">
				<c:choose>
					<c:when test="${login_info != null && login_info.m_id != null}">
					${login_info.m_id}
						<div class="btn-group">
							<a href="${pageContext.request.contextPath}/logout">
								<button type="button" class="btn btn-link btn-sm">LOGOUT</button>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="btn-group">
							<a href="${pageContext.request.contextPath}/login/login_form">
								<button type="button" class="btn btn-link btn-sm">LOGIN</button>
							</a>
							<a href="${pageContext.request.contextPath}/login/sign">
								<button type="button" class="btn btn-link btn-sm">SIGN</button>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<!-- Brand -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/login/login_form">HOME</a>
				<ul class="navbar-nav">


					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							방 BGM 확인 선택
						</a>
						<div class="dropdown-menu">
							<a class = "bgm_play dropdown-item" >BGM 재생</a>
							<a class = "bgm_view dropdown-item" value = "Kalimba.mp3">축하 BGM</a>
							<a class = "bgm_view dropdown-item" value = "Kalimba.mp3">명절 BGM</a>
							<a class = "bgm_view dropdown-item" value = "Kalimba.mp3">기념일 BGM</a>
							<a class = "bgm_view dropdown-item" value = "Kalimba.mp3">롤링페이퍼 BGM</a>
							<a class = "bgm_stop dropdown-item" >BGM 일시정지</a>
						</div>
					</li>
					<audio id = "bgm" src="" controls="controls" autoplay="autoplay" loop="loop" hidden=""></audio>
				</ul>
			</nav>
			<main>
				

			
			
			