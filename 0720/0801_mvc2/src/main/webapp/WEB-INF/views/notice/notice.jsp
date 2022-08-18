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
		.pagination{
			justify-content : center;
		}
		.pagination a {
		  color: black;
		  float: left;
		  text-decoration: none;
/*  	  background-color: #DACCBF;  *//*살짝진한갈색*/
/* 		  background-color: #e8e0d6; *//*배경색이랑 같음,연한갈색*/
		  background-color: none;
		}
		.pagination a.active {
		  background-color: #B1997D;
		  color: white;
		  border-radius: 5px;
		}
		
		.pagination a:hover:not(.active) {
		  background-color: #ddd;
		  border-radius: 5px;
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
						<h3> 공 지 사 항 </h3>
						<a href="${pageContext.request.contextPath}/notice/noticewriteform">
							<button  class="btn btn-secondary float-right mb-3">등 록</button>
						</a>
					</td>
					
				</tr>
			</tbody>
		</table>
		
		<form action="${pageContext.request.contextPath}/notice/notice" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="noti_title"
							<c:if test="${search_dto.searchOption == 'noti_title'}">selected="selected"</c:if>
						> 제 목 </option>
						<!--작성자 value바꿀예정  -->
						<option value="noti_no"
							<c:if test="${search_dto.searchOption == 'noti_no'}">selected="selected"</c:if>
						> 작성자 </option>
					</select>
				</div>
				<input type="text" class="form-control" id="searchWord" name="searchWord"
						value="${search_dto.searchWord}">
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary"> 검 색 </button>
				</div>
			</div>
		</form>
		
		<hr>
		
		<table class="table-hover" >
			<c:forEach items="${list}" var = "dto">
				<tr style="border-bottom: 1px solid black">
					<td>
						${dto.tip_date} <br><br>
						<a href="${pageContext.request.contextPath}/notice/noticedetail?noti_no=${dto.noti_no}">
							${dto.noti_title}
						</a>
					</td>
					<td>
						<img src= "${dto.noti_path}" alt="no search img" width="80" height="80">
					</td>
					<td class="float-right">
						조회수 : ${dto.noti_view_cnt}
					</td>
				</tr>
			</c:forEach>
		</table>
	
	
	
		
		<hr>
		<%-- 페이징 --%>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/notice/notice?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}
						">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item">
							<a class="page-link active">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link"
								href="${pageContext.request.contextPath}/notice/notice?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}
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
						href="${pageContext.request.contextPath}/notice/notice?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}
						">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		
		
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>