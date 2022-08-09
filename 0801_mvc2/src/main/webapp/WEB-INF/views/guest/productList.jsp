<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
		table{
			margin-left: auto;
			margin-right: auto;

		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<hr>
	<h3>상품 조회</h3>
	<hr>
		<form action="${pageContext.request.contextPath}/product/list" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="prdt_name"
							<c:if test="${search_dto.searchOption == 'prdt_name'}">selected="selected"</c:if>
						> 1 </option>
						<option value="mid"
							<c:if test="${search_dto.searchOption == 'mid'}">selected="selected"</c:if>
						> 2 </option>
					</select>
				</div>
				<input type="text" class="form-control" id="searchWord" name="searchWord"
						value="${search_dto.searchWord}">
				<div class="input-group-append">
					<button type="submit" class="btn btn-primary"> 검 색 </button>
				</div>
			</div>
		</form>
		<hr>
		<div class="clearfix">
			<a href="${pageContext.request.contextPath}/product/form">
				<button class="btn btn-primary float-right"> 상품 등록 </button>
			</a>
		</div>
		<hr>
		
		
		<table>
			
			<tbody>	
				<a href="${pageContext.request.contextPath}/home">
					<tr>
						<td width="300px" >날짜 :  </td>
						<td width="100px" rowspan="3">
							<img src="${pageContext.request.contextPath}/resources/img/bg.jpeg" class="img-thumbnail ">
						</td>	
						<td width="100px" >조회수</td>
					</tr>
					<tr><td width="300px">상품이름 : </td><td>숫자</td></tr>
					<tr><td width="300px">가격 : </td></tr>
				</a>
				
			</tbody>
		</table>
		
		
		
		<hr>
		<%-- 페이징 --%>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/product/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active mx-auto">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item mx-auto">
							<a class="page-link"
								href="${pageContext.request.contextPath}/product/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/product/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>