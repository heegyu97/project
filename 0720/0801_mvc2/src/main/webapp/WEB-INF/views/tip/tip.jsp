<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프</title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %> 
		<style type="text/css">
		table{
			margin-left: auto;
			margin-right: auto;
			table-layout: fixed;
		}
		div.pname{
			width: 300px;
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
	
	
	<hr>
		
		<table>
			<col class="w-25">
			<tbody >
				<tr> 
					<td class="text-center">
						<h3>노하우 게시판</h3>
						<a href="${pageContext.request.contextPath}/tip/tipwriteform">
							<button  class="btn btn-success float-right mb-3">등 록</button>
						</a>
					</td>
					
				</tr>
			</tbody>
		</table>
		
		<form action="${pageContext.request.contextPath}/tip/tip" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="tip_title"
							<c:if test="${search_dto.searchOption == 'tip_title'}">selected="selected"</c:if>
						> 제 목 </option>
						<option value="m_no"
							<c:if test="${search_dto.searchOption == 'm_no'}">selected="selected"</c:if>
						> 작성자 </option>
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
		
		<%--test --%>
		<table class="table table-hover">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
				</tr>
				<c:forEach items="${list}" var = "dto">
					<tr>
						<td>${dto.tip_no}</td>
						<td>
							<a href="${pageContext.request.contextPath}/tip/tipdetail?tip_no=${dto.tip_no}">
								${dto.tip_title}
							</a>
						</td>
						<td>${dto.tip_ctnts}</td>
					</tr>
				</c:forEach>
				
		</table>
	
	<%--test --%>
		
		<hr>
		<%-- 페이징 --%>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/tip/tip?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}
						">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link"
								href="${pageContext.request.contextPath}/tip/tip?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}
								">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/tip/tip?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}
						">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
		
		
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>