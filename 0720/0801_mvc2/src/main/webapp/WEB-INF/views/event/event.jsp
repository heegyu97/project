<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프_구매자</title>
<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
<style type="text/css">

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- main on 화면 소스코드 -->
	<div style = "text-align: center; align-content: center;">
		<h3>이벤트</h3>
		<c:if test = "${login_info.m_type == 'manager'}">
		<a href="${pageContext.request.contextPath}/event/event_form">
			<button id="event_page" type="button" class="btn btn-primary " style = "width : 570px; margin-bottom: 12px" >이벤트 등록</button>
		</a>
		</c:if>
		<c:forEach var="sevnt" items="${forwardEvnt}">
			<a href="${pageContext.request.contextPath}/event/eventdetail_sus?evnt_no=${sevnt.evnt_no}">
				<img src="${sevnt.evnt_thum_path}" style="width:370px; height:200px; margin-top : 10px; border:1px solid black;">
			</a>
			
		</c:forEach>
			
	</div>
	
	<!-- main off화면 소스코드 -->
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	
	
	
	
	

</body>



</html>






