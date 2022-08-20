<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 상품조회 구매자</title>
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
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<div style = "text-align: center">
	<hr>
	<h3>판매내역목록</h3>
	<hr>
		<div>
			<form action="${pageContext.request.contextPath}/guest/productList" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="pro_name"
							<c:if test="${search_dto.searchOption == 'pro_name'}">selected="selected"</c:if>
						> 상품이름 </option>
					</select>
				</div>
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="pro_name"
							<c:if test="${search_dto.searchOption == 'pro_name'}">selected="selected"</c:if>
						> 상품이름 </option>
					</select>
				</div>
				<input type="text" class="form-control" id="searchWord" name="searchWord"
						value="${search_dto.searchWord}">
				<div class="input-group-append">
					<button type="submit" class="btn btn-primary"> 검 색 </button>
				</div>
			</div>
		</form>		
		</div>
		<table class = "table table-hover ">
			<thead style = "background-color: silver;">
				<th colspan ="3" style = "border-right: solid 1px;">주문</th> <th colspan ="2" style = "border-right: solid 1px;">상품</th> <th colspan ="2">판매자</th>
			</tr>
			<tr>
				<th>번호</th>
				<th>주문일</th>
				<th style = "border-right: solid 1px;">주문자</th>
				<th>번호</th>
				<th style = "border-right: solid 1px;">상품명</th>
				<th>판매자</th>
				<th>전화번호</th>
			</tr>
			</thead>
			<tbody>
				<!-- for each start  -->
				<tr onClick="location.href='${pageContext.request.contextPath}/manager/saleshistory_detail?'" style="cursor:pointer;">
					<td>1</td>
					<td>2</td>
					<td style = "border-right: solid 1px;">3</td>
					<td>4</td>
					<td style = "border-right: solid 1px;">5</td>
					<td>6</td>
					<td>7</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<%-- 페이징 : 경로 수정 해야한다? --%>
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
		</div>
		<hr>
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>