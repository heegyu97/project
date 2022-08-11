<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- bootstrap to icon -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
	integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
	integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
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






