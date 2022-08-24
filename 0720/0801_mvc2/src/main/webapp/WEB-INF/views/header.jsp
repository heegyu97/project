
<%@page import="ch.qos.logback.core.net.LoginAuthenticator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
		<div id="aaa" class="col-lg-6 ">
			<div class="container" id = "bbb">
				<div style = "text-align : center">
						
				  		<!-- 로고 + 냥냥라이프 -->
				   		<img src="${pageContext.request.contextPath}/resources/img/ghostlogo.png" style="width:120px; height:120px; margin-top:10px; margin-right:20px;" > 
				   		<img src="${pageContext.request.contextPath}/resources/img/orangelogo.png" style="width:300px; height:120px; margin-top:10px; " > 
				  	 	
				  	 	<!-- 냥냥 라이프 쇼핑몰 소개 -->
				  	 	
				  	 	<a href="${pageContext.request.contextPath}/event">
				   			<img src="${pageContext.request.contextPath}/resources/img/gettipshere.png" style="width:370px; height:200px; margin-top : 10px;">
					    </a>
			
						<!-- iframe to adver  -->
						<iframe id="iframe" width="370" height="200" src="${pageContext.request.contextPath}/adver" style="margin-top:10px;"></iframe>
				   		<!-- 문의하기 : text -->
				   		<img src="${pageContext.request.contextPath}/resources/img/callcen.png" style="width:370px; height:200px; margin-top :10px ; margin-bottom:10px;">
				</div>
			</div>
		</div>


		<!-- 화면 나누기 :home 화면 오른쪽 : iframe to main -->
		<div id="ccc" class="col-lg-6">
			<!-- footer col6 -->
			<c:choose>
			<c:when test="${login_info.m_type eq 'manager' ||  login_info.m_type eq 'seller' }">
			</c:when>
			<c:otherwise>
				<div class="nav" >
				<!-- MENU -->
				<section class="servics">
	               <div class="icons">
	                  <div class="child icon1">
	                     <c:choose>
	                     	<c:when test="${login_info.m_type eq 'guest'}">
	                     		 <a class="nav-link" href="${pageContext.request.contextPath}/guest/myPage">
	                     	</c:when>
	                     	<c:otherwise>
	                     		<a class="nav-link" href="${pageContext.request.contextPath}/loginform">
	                     	</c:otherwise>
	                     </c:choose>
	                     	<img src = "${pageContext.request.contextPath}/resources/img/i_mypage.png" style="width:50px; height:50px;" >   
	                   	 </a>
	                   	 
	                  </div>
	                  <div class="child icon2">
	                     <a class="nav-link" href="${pageContext.request.contextPath}/tip/tip">
	                        <img src = "${pageContext.request.contextPath}/resources/img/i_knowhow.png" style="width:50px; height:50px;" >
	                     </a>
	                  </div>
	                  <div class="child icon3">
	                     <a class="nav-link" href="${pageContext.request.contextPath}/event">
	                        <img src = "${pageContext.request.contextPath}/resources/img/i_event.png" style="width:50px; height:50px;" >   
	                     </a>
	                  </div>
	                  <div class="child icon4">
	                     <a class="nav-link" href="${pageContext.request.contextPath}/notice/notice"> 
	                        <img src = "${pageContext.request.contextPath}/resources/img/i_noti.png" style="width:50px; height:50px;" >   
	                     </a>
	                  </div>
	               </div>
	            </section>
			</div>
			</c:otherwise>
			</c:choose>
			
			
			<main>
				<!-- 여백 -->
				<h3 style="margin-bottom: 60px"></h3>