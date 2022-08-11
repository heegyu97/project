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
						<a href="${pageContext.request.contextPath}/tip/writeform">
							<button  class="btn btn-success float-right mb-3">등 록</button>
						</a>
					</td>
					
				</tr>
			</tbody>
		</table>
		
			
			
		
	
		
	
			
		
	
		<form action="${pageContext.request.contextPath}/product/list" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="prdt_name"
							<c:if test="${search_dto.searchOption == 'prdt_name'}">selected="selected"</c:if>
						> 선택1 </option>
						<option value="mid"
							<c:if test="${search_dto.searchOption == 'mid'}">selected="selected"</c:if>
						> 선택2 </option>
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
					<c:forEach  begin="1" end="3">
						<tr>
							<td width="300px" >날짜 :  </td>
							<td width="100px" rowspan="3">
								<a href="${pageContext.request.contextPath}/guest/detail">
								<img src="${pageContext.request.contextPath}/resources/img/bg.jpeg" class="img-thumbnail ">
								</a>
							</td>	
							<td width="100px" style="text-align: center">조회수</td>
						</tr>
						<tr>
							
							<td width="300px">
								<div class="pname">
								<a href="${pageContext.request.contextPath}/tip/tipdetail?tip_no=${dto.tip_no}">	
									tip 고양이1
								</a>	
								</div>
							</td>			
							<td style="text-align: center">숫자</td>
						</tr>
						<tr style="border-bottom: 1px solid black"><td width="300px" >가격 : </td></tr>
					</c:forEach>

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