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
				<div class="card">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card mr-0">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<img src="..." class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content.</p>
					</div>
				</div>
			</div>
		</div>
		<!-- top3 : 2 -->
		<div>
			<!--  popularity / new / sale / high_price /low_price-->
			<!-- top3 : 목록 1 -->
			<div class="bg-dark">
				<ul class="clearfix mt-3">
					<li class="float-left">
						<h3 style="color: white;">할인순2</h3>
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
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card mr-0">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- top3 : 3 -->
		<div>
			<!--  popularity / new / sale / high_price /low_price-->
			<!-- top3 : 목록 1 -->
			<div class="bg-dark">
				<ul class="clearfix mt-3">
					<li class="float-left">
						<h3 style="color: white;">할인순2</h3>
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
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card mr-0">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- top3 : 4 -->
		<div>
			<!--  popularity / new / sale / high_price /low_price-->
			<!-- top3 : 목록 1 -->
			<div class="bg-dark">
				<ul class="clearfix mt-3">
					<li class="float-left">
						<h3 style="color: white;">할인순2</h3>
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
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card mr-0">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- top3 : 4 -->
		<div>
			<!--  popularity / new / sale / high_price /low_price-->
			<!-- top3 : 목록 1 -->
			<div class="bg-dark">
				<ul class="clearfix mt-3">
					<li class="float-left">
						<h3 style="color: white;">할인순2</h3>
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
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card mr-0">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- top3 : 4 -->
		<div>
			<!--  popularity / new / sale / high_price /low_price-->
			<!-- top3 : 목록 1 -->
			<div class="bg-dark">
				<ul class="clearfix mt-3">
					<li class="float-left">
						<h3 style="color: white;">할인순2</h3>
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
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card mr-0">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content.</p>
						</div>
					</div>
				</div>
			</div>
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






