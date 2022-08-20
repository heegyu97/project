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
	<h3>회원관리</h3>
	<hr>
		<table class = "table table-hover ">
			<thead>
			<tr>
				<th>회원 번호</th> <th>아이디</th> <th>회원 이름</th> <th>유형</th> <th>등록일</th>
			</tr>
			</thead>
		
			<tbody>
				<c:forEach var="m_dto" items="${list}">
					<tr onClick="location.href='${pageContext.request.contextPath}/manager/membermanagement_detail?m_no=${m_dto.m_no}&m_type=${m_dto.m_type}'" style="cursor:pointer;">
						<td> ${m_dto.m_no}</td>
						<td> ${m_dto.m_id}</td>
						<td> ${m_dto.m_name}</td>
						<td> ${m_dto.m_type}</td>
						<td> ${m_dto.m_date}</td>
					</tr>
				</c:forEach>
			
			<!-- for each start  -->
		
			</tbody>
		</table>
		<hr>
		<%-- 페이징 : 경로 수정 해야한다? --%>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/manager/membermanagement?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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
								href="${pageContext.request.contextPath}/manager/membermanagement?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/manager/membermanagement?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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