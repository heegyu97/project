<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 상품조회 -guest</title>
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
	<h3>카테고리 조회</h3>
	<hr>
		<form action="${pageContext.request.contextPath}/guest/KategorieList" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<!-- 대분류  -->
						<option value="pro_name"
							<c:if test="${search_dto.searchOption == 'pro_name'}">selected="selected"</c:if>
						> 상품이름 </option>
						<!-- 중분류 -->
					</select>
				</div>
				<div class="input-group-prepend">
					<select>
						<option value="pro_name"
							<c:if test="${search_dto.searchOption == 'pro_name'}">selected="selected"</c:if>
						> 상품이름 </option>
<!-- 						<option value="m_id" -->
<%-- 							<c:if test="${search_dto.searchOption == 'm_id'}">selected="selected"</c:if> --%>
<!-- 						> 2 </option> -->
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
		
		<table>
			
			<tbody>		
					<c:forEach var="dto" items="${list}">
						<tr onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${dto.pro_no}'" style="cursor: pointer">
							<td width="300px" > ${dto.pro_date}  </td>
							<td  width="100px" rowspan="3">
								<img src="${dto.pro_thum_path}" width="90px" height="90px" class="img-thumbnail ">
							</td>	
							<td width="100px" style="text-align: center">조회수</td>
						</tr>
						<tr onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${dto.pro_no}'" style="cursor: pointer">
							
							<td width="300px">
								<div class="pname">
									<h4>
										${dto.pro_name}
									</h4>
								</div>
							</td>			
							<td style="text-align: center"> 
								${dto.pro_view_cnt} 
							</td>
						</tr>
						<tr style="border-bottom: 1px solid black; cursor: pointer" onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${dto.pro_no}'">	
							<td width="300px" >가격 : ${dto.pro_price} </td>
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
						href="${pageContext.request.contextPath}/guest/productList?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
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
								href="${pageContext.request.contextPath}/guest/productList?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item mx-auto">
					<a class="page-link"
						href="${pageContext.request.contextPath}/guest/productList?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>