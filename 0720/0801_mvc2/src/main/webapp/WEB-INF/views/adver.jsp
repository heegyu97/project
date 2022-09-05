<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 냥냥라이프 </title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
	</head>
	
	<body style = "border:none; background-image: url('http://localhost:8081/ictedu/resources/img/adverback.png');" >
					    <!-- 광고 : slide : 추후 참조 : 변경 - 주소값 일부 불러오기  ? 값 넘기기 -->
						<div id="test" class = "carousel slide" data-ride = "carousel" style = "width: 100% ; height: 100% ; margin-top: 0px">
							<ul class = "carousel-indicators">
								<!-- 데이터 순서 / 활성처음 -->
								<!-- for 첫번째 -->
								<c:forEach var="sevnt" items="${forwardEvnt}" varStatus = "status">
									<li data-target = "#test" data-slide-to="${status.index}" 
									<c:if test = "${status.index==0}"> class = "active"</c:if>
									></li>
								</c:forEach>
							</ul>
							<!-- 이미지 넣기 -->
							<div class = "carousel-inner " style = "margin-top : 0px;">
								<!-- for 2번째 -->
								
								<c:forEach var="sevnt" items="${forwardEvnt}" varStatus = "status">
								<div class = 
									<c:choose>
										<c:when test = "${status.index==0}">
											"carousel-item active"
										</c:when>
										<c:otherwise>
											"carousel-item"
										</c:otherwise>
									</c:choose>
								>
									<a href="${pageContext.request.contextPath}/event/eventdetail_sus?evnt_no=${sevnt.evnt_no}" target="_parent"" >
										<img src="${sevnt.evnt_thum_path}" style="width:370px; height:200px;">
									</a>
								</div>
								</c:forEach>
							</div>
	</body>
</html>