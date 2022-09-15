<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<script type="text/javascript">
			$(document).ready(function() {
				let mp3;
				$(".bgm_view").click(function() {
					bgm.src = "${pageContext.request.contextPath}/resources/"+ $(this).attr('value');
					mp3 = $(this).text();
					$(".aa").text(mp3);
				});
				
				$(".bgm_play").click(function() {
					bgm.play();
					$(".aa").text(mp3);
				});
				$(".bgm_stop").click(function() {
					bgm.pause();
					$(".aa").text( mp3 + "일시정지");
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
			<div>
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="padding-left : 0px; padding-top: 0px; padding-bottom: 0px;">
				<!-- 상당 좌측 이미지 -->
				<img src="${pageContext.request.contextPath}/resources/img/LP.gif" 
					style= "height:90px; width:90px; margin-right: 20px;">
				
				<!-- Brand -->
				<c:choose>
					<c:when test="${login_info != null && login_info.m_id != null}">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/main/select">HOME</a>
					</c:when>
					<c:otherwise>
						<a class="navbar-brand" href="${pageContext.request.contextPath}/login/logi	n_form">HOME</a>
					</c:otherwise>
				</c:choose>
				
				<ul class="navbar-nav">
					
					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle aa" href="#" id="navbardrop" data-toggle="dropdown">
							<label style = "text-align: center; margin: 0; width: 150px">ROOM BGM CHECK</label>
						</a>
						<div class="dropdown-menu" style = "text-align: center;">
							<a class = "bgm_play dropdown-item" >BGM 재생</a>
							<a class = "bgm_view dropdown-item" value = "Kalimba.mp3">
								<label style = "text-align: center; margin: 0; width: 150px">축하 BGM</label>
								<img src="${pageContext.request.contextPath}/resources/img/btnG_naver.png" class = "tooltiptext" style = "width: 300px; height: 200px">
							</a>
							<a class = "bgm_view dropdown-item" value = "Kalimba.mp3">
								<label style = "text-align: center; margin: 0; width: 150px">명절 BGM</label>
								<img src="${pageContext.request.contextPath}/resources/img/btnG_naver.png" class = "tooltiptext" style = "width: 300px; height: 200px">
								</a>
							<a class = "bgm_view dropdown-item" value = "Kalimba.mp3">
								<label style = "text-align: center; margin: 0; width: 150px">기념일 BGM</label>
								<img src="${pageContext.request.contextPath}/resources/img/btnG_naver.png" class = "tooltiptext" style = "width: 300px; height: 200px">
							</a>
							<a class = "bgm_view dropdown-item" value = "Kalimba.mp3">
								<label style = "text-align: center; margin: 0; width: 150px">롤링페이퍼 BGM</label>
								<img src="${pageContext.request.contextPath}/resources/img/btnG_naver.png" class = "tooltiptext" style = "width: 300px; height: 200px">
							</a>
							<a class = "bgm_stop dropdown-item" >
								BGM 일시정지
							</a>
						</div>
					</li>
					<audio id = "bgm" src="" controls="controls" autoplay="autoplay" loop="loop" hidden=""></audio>
				</ul>
			</nav>
			</div>
			<main>
				

			
			
			