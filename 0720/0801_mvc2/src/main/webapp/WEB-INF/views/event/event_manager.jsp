<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프_판매자</title>
<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- main on 화면 소스코드 -->
	<div style = "text-align: center; align-content: center;">
		<h3>이벤트</h3>
		<a href="${pageContext.request.contextPath}/event/event_form">
			<button id="event_page" type="button"
			class="btn btn-primary " style = "width : 570px; margin-bottom: 12px" >이벤트 등록</button>
		</a>
		<!--3scrn strt-->
		<a href="${pageContext.request.contextPath}/event/eventdetail_tip">
			<img src="${pageContext.request.contextPath}/resources/img/gettipshere.png" style="width:370px; margin-top : 10px;">
		</a>
		<a href="${pageContext.request.contextPath}/event/eventdetail_sus">
			<img src="${pageContext.request.contextPath}/resources/img/susevent.png" style="width:370px; height:200px; margin-top : 10px; border:1px solid black;">
		</a>
		<a href="${pageContext.request.contextPath}/event/eventdetail_point">
			<img src="${pageContext.request.contextPath}/resources/img/knowhowpoint.png" style="width:370px; height:200px; margin-top : 10px; border:1px solid black; ">
		</a>
		<!--3scrn end-->	
	</div>
	
	<!-- main off화면 소스코드 -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	
	
	
	
	

</body>



</html>






