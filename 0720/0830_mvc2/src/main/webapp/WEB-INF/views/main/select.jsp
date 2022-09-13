<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>선택화면</title>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp"%>
		<hr>
		<h3>선택 화면</h3>
		<hr>
	<div class="clearfix">
		<a href="${pageContext.request.contextPath}/space/spaceform">
			<button type="button" class="btn float-right mr-4" style="color : D2B8DE;">
				방만들기</button>
		</a>
		<!-- for each문으로 리스트 나열하기 -->

		<c:forEach var="list" items="${list}" varStatus="status">
			<div
				class=<c:choose>
				<c:when test = "${status.index == 0}" >"card"</c:when>
				<c:otherwise>"card mx-auto"</c:otherwise>
			</c:choose>
			>
				<div class="card-body" onclick="location.href='${pageContext.request.contextPath}/space/spacelist?r_no=${list.r_no}';">
					<h5 class="card-title">방제 : ${list.r_title}</h5>
					<p class="card-text">개설 일 : ${list.r_sdate}</p>
					<a href="${pageContext.request.contextPath}/space/spacelist?r_no=${list.r_no}">
						<button class="rounded-pill mx-auto" style="width : 30px; height: 10px; color : D2B8DE;">주소 복사</button>
					</a>>
				</div>
			</div>
		</c:forEach>
	</div>


	<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>