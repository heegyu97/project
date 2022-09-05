<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<div class="container">
			<div class="text-right">
				<c:choose>
					<c:when test="${login_info != null && login_info.mid != null}">
					${login_info.mid}
						<div class="btn-group">
							<a href="${pageContext.request.contextPath}/history/my_sell_list">
								<button type="button" class="btn btn-link btn-sm">판매내역</button>
							</a>
							<a href="${pageContext.request.contextPath}/history/my_order_list">
								<button type="button" class="btn btn-link btn-sm">구매내역</button>
							</a>
							<a href="${pageContext.request.contextPath}/mypage/list">
								<button type="button" class="btn btn-link btn-sm">마이페이지</button>
							</a>
							<a href="${pageContext.request.contextPath}/basket/list">
								<button type="button" class="btn btn-link btn-sm">장바구니</button>
							</a>
							<a href="${pageContext.request.contextPath}/logout">
								<button type="button" class="btn btn-link btn-sm">LOGOUT</button>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="btn-group">
							<a href="${pageContext.request.contextPath}/login_form">
								<button type="button" class="btn btn-link btn-sm">LOGIN</button>
							</a>
							<a href="${pageContext.request.contextPath}/join/form">
								<button type="button" class="btn btn-link btn-sm">JOIN</button>
							</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<!-- Brand -->
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">HOME</a>
				
				<!-- Links -->
				<ul class="navbar-nav">

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							게시판
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/ck/list">
								CK Editor 이미지 게시판 (로그인) </a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/member/list">
								멤버 게시판</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/final_list">
								자유 게시판 : Searching + Paging + List</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/list">
								list : only list</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/list2">
								list2 : only paging</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/list3">
								list3 : paging + link</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/list4">
								list4 : paging + link + list</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/board/free/search1">
								search1 : search + list</a>
						</div>
					</li>

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							실습 예제
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/test/dong_code">
								동 코드 조회 연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/test/dong_search">
								연관 검색어 조회 연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/file1/form">
								파일 업로드 연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/file2/form">
								AJAX 파일 업로드 연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/gmail/send">
								임시 비밀번호 Google Mail 발송 연습</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/map/kakao/step1">
								Kakao Map Step 1</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/map/kakao/step2">
								Kakao Map Step 2</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/map/kakao/step3">
								Kakao Map Step 3</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/jsoup/step1">
								JSOUP - step1</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/jsoup/step2">
								JSOUP - step2</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/jsoup/step3">
								JSOUP - step3</a>
						</div>
					</li>

					<!-- Dropdown -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							REST API
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/rest1/step1">
								step1 : @ResponseBody</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/rest2/step2">
								step2 : @RestController</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/rest2/step3">
								step3 : rest service로부터 dto 1개 받기</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/rest2/step4">
								step4 : rest service로부터 dto list 받기</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/restview/step5view">
								step5 : @PathVariabe</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/restview/step7view">
								step7 : @RequestBody</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/restmbrbrdview/list_page">
								rest3view list_page</a>
						</div>
					</li>

					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/product/list">
							상품 목록</a>
					</li>

				</ul>
			</nav>
			<main>
