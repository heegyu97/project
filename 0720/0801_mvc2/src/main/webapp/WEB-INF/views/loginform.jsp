<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프</title>
<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
<style type="text/css">
<%@ include  file ="/WEB-INF/views/style_share.jsp" %> 
<%@ include  file ="/WEB-INF/views/style_hf.jsp" %> 
.btn-group {
	display: flex;
}

.find-btn1, .find-btn2 {
	margin-right: 5%;
}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- 공백용  -->
	<h3>Type</h3>

	<!-- 라디오 + 버튼 혼합  : 구매자 판매자 .. -->
	<div class="btn-group" role="group"
		aria-label="Basic radio toggle button group">
		<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
			value="guest" autocomplete="off" checked> <label
			class="btn btn-outline-primary rounded-pill find-btn1"
			for="btnradio1">고객님</label> <input type="radio" class="btn-check"
			name="btnradio" id="btnradio2" value="seller" autocomplete="off">
		<label class="btn btn-outline-primary rounded-pill find-btn2"
			for="btnradio2">판매자</label> <input type="radio" class="btn-check"
			name="btnradio" id="btnradio3" value="manager" autocomplete="off">
		<label class="btn btn-outline-primary rounded-pill find-btn3"
			for="btnradio3">관리자</label>
	</div>
	<table class="table table-hover">
		<tbody>
			<tr>
				<th>아 이 디</th>
				<td><input type="text" id="mid" name="mid" maxlength="20"
					class="form-control"></td>
			</tr>
			<tr>
				<th>패 스 워 드</th>
				<td><input type="password" id="mpwd" name="mpwd" maxlength="20"
					class="form-control"></td>
			</tr>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath}/signupform">
		<button id="signup_btn" type="button"
			class="btn btn-primary float-right">회원가입</button>
	</a>
	<button id="login_btn" type="button"
		class="btn btn-primary float-right mr-4">로 그 인</button>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			var btnradios = document.getElementsByName('btnradio');
			var value;
			$(".btn-check").click(function() {
				alert($(this).val());
			});
		});
	</script>

</body>

</html>






