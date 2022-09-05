<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Home </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> Home </h3>
		<hr>

		<h6><a href="${pageContext.request.contextPath}/board/free/final_list">
			자유 게시판 : Searching + Paging + List</a></h6>
		<h6><a href="${pageContext.request.contextPath}/board/free/list">
			list : only list</a></h6>
		<h6><a href="${pageContext.request.contextPath}/board/free/list2">
			list2 : only paging</a></h6>
		<h6><a href="${pageContext.request.contextPath}/board/free/list3">
			list3 : paging + link</a></h6>
		<h6><a href="${pageContext.request.contextPath}/board/free/list4">
			list4 : paging + link + list</a></h6>
		<h6><a href="${pageContext.request.contextPath}/board/free/search1">
			search1 : search + list</a></h6>

		<hr>

		<h6><a href="${pageContext.request.contextPath}/board/ck/list">
			CK Editor 이미지 게시판</a></h6>
		<h6><a href="${pageContext.request.contextPath}/board/member/list">
			멤버 게시판</a></h6>

		<hr>

		<h6><a href="${pageContext.request.contextPath}/test/dong_code">
			동 코드 조회 연습</a></h6>
		<h6><a href="${pageContext.request.contextPath}/test/dong_search">
			연관 검색어 조회 연습</a></h6>
		<h6><a href="${pageContext.request.contextPath}/file1/form">
			파일 업로드 연습</a></h6>
		<h6><a href="${pageContext.request.contextPath}/file2/form">
			AJAX 파일 업로드 연습</a></h6>
		<h6><a href="${pageContext.request.contextPath}/gmail/send">
			임시 비밀번호 Google Mail 발송 연습</a></h6>
		<h6><a href="${pageContext.request.contextPath}/map/kakao/step1">
			Kakao Map Step 1</a></h6>
		<h6><a href="${pageContext.request.contextPath}/map/kakao/step2">
			Kakao Map Step 2</a></h6>
		<h6><a href="${pageContext.request.contextPath}/map/kakao/step3">
			Kakao Map Step 3</a></h6>
		<h6><a href="${pageContext.request.contextPath}/jsoup/step1">
			JSOUP - step1</a></h6>
		<h6><a href="${pageContext.request.contextPath}/jsoup/step2">
			JSOUP - step2</a></h6>
		<h6><a href="${pageContext.request.contextPath}/jsoup/step3">
			JSOUP - step3</a></h6>

		<hr>

		<h4>Rest API : REpresentational State Transfer API</h4>
		<h6><a href="${pageContext.request.contextPath}/rest1/step1">
			rest1 step1 : @ResponseBody</a></h6>
		<h6><a href="${pageContext.request.contextPath}/rest2/step2">
			rest2 step2 : @RestController</a></h6>
		<h6><a href="${pageContext.request.contextPath}/rest2/step3">
			rest2 step3 : rest service로부터 dto 1개 받기</a></h6>
		<h6><a href="${pageContext.request.contextPath}/rest2/step4">
			rest2 step4 : rest service로부터 dto list 받기</a></h6>
		<h6><a href="${pageContext.request.contextPath}/restview/step5view">
			rest2 step5 /step6 : @PathVariabe</a></h6>
		<h6><a href="${pageContext.request.contextPath}/restview/step7view">
			rest2 step7 : @RequestBody</a></h6>
		<h6><a href="${pageContext.request.contextPath}/restmbrbrdview/list_page">
			rest3view list_page</a></h6>

	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>












