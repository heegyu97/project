<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 상품 목록 -seller </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
		<style type="text/css">
		div.pname{
			width: 150px;
			white-space: nowrap;
		 	overflow: hidden;
 			text-overflow: ellipsis;
		}
		a{
			text-decoration : none;
			color: black;
			font-size: 25px;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 상품 관리 목록 </h3>
		<hr>
		<form action="${pageContext.request.contextPath}/seller/productList" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="pro_name"
							<c:if test="${search_dto.searchOption == 'pro_name'}">selected="selected"</c:if>
						> 상 품 이 름 </option>
						<option value="m_id"
							<c:if test="${search_dto.searchOption == 'pro_no'}">selected="selected"</c:if>
						> 상품 번호 </option>
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
			<a href="${pageContext.request.contextPath}/seller/form">
				<button class="btn btn-primary float-right"> 상품 등록 </button>
			</a>
		</div>
		<hr>
		<table class="table table-hover table-bordered table-info">
			<col class="col-1">
			<thead style="text-align: center;">
				<tr>
					<th>상품번호</th>	<th colspan="2">상품명</th>	
					<th>재고수량</th> <th>등록일</th> <th>할인기간</th> 
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr onclick="location.href='${pageContext.request.contextPath}/seller/detail?pro_no=${dto.pro_no}'" style="cursor: pointer">
						<td><%-- 상품번호 --%>
							${dto.pro_no}
						</td>
						<td ><%-- 썸네일 ${dto.pro_thum_path} --%>
								<img src="${dto.pro_thum_path}"
									width="50px" height="50px" class="img-thumbnail ">
							
						</td>
						<td>
							<div class="pname">
								${dto.pro_name}
							</div>
							
						</td>
						<td><%-- 재고 수량  --%>
							${dto.pro_stock}
						</td>
						<td><%-- 등록일 --%>
							${dto.pro_date}
						</td><%-- 할인기간  --%>
						<td>${dto.pro_dc_strt} ~ ${dto.pro_dc_end}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
 		<%-- 페이징 --%> 
		<ul class="pagination"> 
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/seller/productList?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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
								href="${pageContext.request.contextPath}/seller/productList?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/seller/productList?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>














