<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div id="aaa" class="col-lg-6 ">
			<iframe id="bbb" name="adver-frame"
				src="${pageContext.request.contextPath}/adver"></iframe>
		</div>


		<!-- 화면 나누기 :home 화면 오른쪽 : 관리자, 판매자용 -->
		<div id="ccc" class="col-lg-6 bg-warning ">
			<!-- footer col6 -->
			
			<main>
				<!-- 여백 -->
				<h3 style="margin-bottom: 60px"></h3>