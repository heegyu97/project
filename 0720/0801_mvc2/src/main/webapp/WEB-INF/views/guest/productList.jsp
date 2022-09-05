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
	<h3>상품 조회 :${search_dto.searchOption3} : ${search_dto.searchWord} </h3>
	<hr>
		<form action="${pageContext.request.contextPath}/guest/productList" method="get" >
				<div class="input-group">
					<div class="input-group-prepend">
						<select class="form-control" id="searchOption3" name="searchOption3" style = "width : 250px" >
							<option value=""  <c:if test="${search_dto.searchOption3 == '' }">selected="selected"</c:if> >선택하세요</option>
							<option value="recency"  <c:if test="${search_dto.searchOption3 == 'recency' }">selected="selected"</c:if> >최신순</option>
							<option value="look" <c:if test="${search_dto.searchOption3 == 'look' }">selected="selected"</c:if>>조회순</option>
							<option value="hprice" <c:if test="${search_dto.searchOption3 == 'hprice' }">selected="selected"</c:if>>높은가격순</option>
							<option value="lprice" <c:if test="${search_dto.searchOption3 == 'lprice' }">selected="selected"</c:if>>낮은가격순</option>
							<option value="hdis" <c:if test="${search_dto.searchOption3 == 'hdis' }">selected="selected"</c:if>>할인율높은순</option>
							<option value="ldis" <c:if test="${search_dto.searchOption3 == 'ldis' }">selected="selected"</c:if>>할인율낮은순</option>
						</select>
					</div>
					<div class="input-group-prepend">
						<input type="text" class="form-control " id="searchWord" name="searchWord"
								value="${search_dto.searchWord}" style = "width : 250px">
					</div>
					
					<div class="input-group-append">
						<button type="submit" class="btn btn-primary" style = "z-index: 1; width : 100px"> 검 색 </button>
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
								<img src="${dto.pro_thum_path}" style="width :90px; max-height: 90px" class="img-thumbnail ">
							</td>	
							<td width="100px" style="text-align: center">조회수</td>
						</tr>
						<tr onclick="location.href='${pageContext.request.contextPath}/guest/detail?pro_no=${dto.pro_no}'" style="cursor: pointer; ">
							
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
							<td width="300px" >
								가격 :
								<del> 
								<fmt:formatNumber pattern="###,###,###원" >
									 ${dto.pro_price}
								</fmt:formatNumber> 
								</del>
								  할인가 :
								<fmt:formatNumber pattern="###,###,###원" >
									 ${dto.pro_price - dto.pro_price * dto.pro_dc /100}
								</fmt:formatNumber> 
							</td>
							
						</tr>
					</c:forEach>

			</tbody>
		</table>
		
		<hr>
		<%-- 페이징 --%>
		<ul class="pagination pagination-sm justify-content-center" >
			<c:if test="${startPageNum > 10}">
				<li class="page-item ">
					<a class="page-link"
						href="${pageContext.request.contextPath}/guest/productList?userWantPage=${startPageNum-1}&searchOption3=${search_dto.searchOption3}&searchWord=${search_dto.searchWord}">
						Prev
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active ">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item ">
							<a class="page-link"
								href="${pageContext.request.contextPath}/guest/productList?userWantPage=${page_no}&searchOption3=${search_dto.searchOption3}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item ">
					<a class="page-link"
						href="${pageContext.request.contextPath}/guest/productList?userWantPage=${endPageNum+1}&searchOption3=${search_dto.searchOption3}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>