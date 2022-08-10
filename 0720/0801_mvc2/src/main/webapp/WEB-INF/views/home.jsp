<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프</title>
<%@ include  file ="/WEB-INF/views/style_link.jsp" %>

<style type="text/css">

/* share all style */
<%@ include  file ="/WEB-INF/views/style_share.jsp" %>

/* guest [ header footer ] style  */ 
<%@ include  file ="/WEB-INF/views/style_hf.jsp" %> 

.btn-group {
	display: flex;
}

.find-btn1, .find-btn2, .find-btn3 {
	margin-right: 5%;
}

.card{
	width: 180px;
	height: 220px;
}

.card-body{
	height : 100px;
	padding-bottom : 20px;
}

.card-text{
	background-color : blue;
	height : 60px;
	overflow: hidden;
	
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- 화면 나누기 :home 화면 오른쪽 : iframe to main -->

	<!-- MENU -->

	<!-- post로 값 보내기 / 리턴 값 of 목록 / 기본선택은 첫번째 -->
	<!-- 버튼 4개 : 사료 .. -->
	<!-- post로 값 보내기 / 값 리턴 -->
	<!-- 라디오 + 버튼 혼합 -->
	<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		<input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="feed" autocomplete="off" checked> <label
			class="btn btn-outline-primary rounded-pill find-btn1" for="btnradio1">사료</label> <input type="radio" class="btn-check"
			name="btnradio" id="btnradio2" value="snack" autocomplete="off">
		<label class="btn btn-outline-primary rounded-pill find-btn2"
			for="btnradio2">간식</label> <input type="radio" class="btn-check"
			name="btnradio" id="btnradio3" value="supplies" autocomplete="off">
		<label class="btn btn-outline-primary rounded-pill find-btn3"
			for="btnradio3">용품</label> <input type="radio" class="btn-check"
			name="btnradio" id="btnradio4" value="nutrients" autocomplete="off">
		<label class="btn btn-outline-primary rounded-pill find-btn4"
			for="btnradio4">영양제</label>
	</div>


	<hr>
	<!-- post of 대분류 - 중분류 -->
	<hr>
	<!-- top3 -->

	<div>
		<!--  popularity / new / sale / high_price /low_price-->
		<!-- top3 : 목록 1 -->
		<div class="bg-dark">
			<ul class="clearfix">
				<li class="float-left">
					<h3 style="color: white;">인기순</h3>
				</li>
				<li class="float-right"><a
					href="${pageContext.request.contextPath}/adver">
						<button class="btn btn-primary rounded-pill mr-4">더보기..</button>
				</a></li>
			</ul>
		</div>
		<!-- 카드 레이아웃  -->
		<div class="row row-cols-1 row-cols-md-3 g-4 bg-dark m-0">
			<div class="col">
				<div class="card" onclick="location.href='${pageContext.request.contextPath}/home';">
					<img src="${pageContext.request.contextPath}/resources/img/adv1.jpg" class="card-img-top" alt="이미지 오류">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">bbbccccaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
						aaaaaaaaaaaaaaaaaaaaaaaaafsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" onclick="location.href='${pageContext.request.contextPath}/home';" >
					<img src="${pageContext.request.contextPath}/resources/img/adv1.jpg" class="card-img-top" alt="이미지 오류">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card" onclick="${pageContext.request.contextPath}/home';" >
					<img src="${pageContext.request.contextPath}/resources/img/adv1.jpg" class="card-img-top" alt="이미지 오류">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content.</p>
					</div>
				</div>
			</div>
		</div>
		<!-- top3 : 목록 1 끝-->
	</div>
		<%@ include file="/WEB-INF/views/footer.jsp"%>

		<script type="text/javascript">
			$(document).ready(function() {
				var btnradios = document.getElementsByName('btnradio');
				var value;
				$(".btn-check").click(function() {
					alert($(this).val());
				})
			});
		</script>
</body>

</html>






