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
		</style>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
	<hr>
	<h3>카테고리 조회 :: ${search_dto.searchOption}  ::  ${search_dto.searchOption2}</h3>
	<hr>
		<form action="${pageContext.request.contextPath}/guest/KategorieList" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption" style = "width : 250px">
						<option value="">선택하세요</option>
						<c:forEach var="code_dto" items="${proBigList}">
							<option value="${code_dto.code_class}"
								<c:if test="${search_dto.searchOption == code_dto.code_class}">selected="selected"</c:if>>
								${code_dto.code_class}
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption2" name="searchOption2" style = "width : 250px">
						<c:forEach var="code_dto2" items="${proMidList}"> 
 							<!-- 질문 / param 사용법  -->
 							<!-- selected 실패 -->
 							<option value="${code_dto2.code_name}" 
 								<c:if test="${search_dto.searchOption2 == code_dto2.code_name}">selected="selected"</c:if>
 								>${code_dto2.code_name} </option> 
 						</c:forEach> 
					</select>
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
		<div>
		<ul class="pagination pagination-sm justify-content-center" >
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/guest/KategorieList?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchOption2=${search_dto.searchOption2}">
						Prev
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
								href="${pageContext.request.contextPath}/guest/KategorieList?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchOption2=${search_dto.searchOption2}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/guest/KategorieList?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchOption2=${search_dto.searchOption2}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		</div>
		<hr>
		
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<script type="text/javascript">
			$(document).ready(function() {
			
				if( $("#searchOption") != null || $("#searchOption") != ''){
					$.get(
							"${pageContext.request.contextPath}/guest/big"
							, {
								select_pro_big : $("#searchOption").val()
							}
							, function(data, status) {
								$("#searchOption2").empty();//이전 정보 지우기 : 초기화
								$("#searchOption2").append("<option value=''>"+ "선택하세요" +"</option>");
								$.each(JSON.parse(data), function(idx, dto) {
									$("#searchOption2").append("<option value='" + dto.code_name + "'>" + dto.code_name +"</option>");
								});
						}//call back function
					);//get
				}
		 		$("#searchOption").change(function() {
		 			$.get(
						"${pageContext.request.contextPath}/guest/big"
						, {
							select_pro_big : $("#searchOption").val()
						}
						, function(data, status) {
							$("#searchOption2").empty();//이전 정보 지우기 : 초기화
							$("#searchOption2").append("<option value=''>"+ "선택하세요" +"</option>");
							$.each(JSON.parse(data), function(idx, dto) {
								$("#searchOption2").append("<option value='" + dto.code_name +"'>"+ dto.code_name +"</option>");
							});
						}//call back function
					);//get
					//alert($("#pro_mid").val() + "");
		 		});//change
			
		 																																																																																												
		 		
		 		
		 		
	 		});//ready
		</script>
	</body>
</html>