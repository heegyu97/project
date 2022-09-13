<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>임시 list</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<h3>임시 list </h3>
		<a href="${pageContext.request.contextPath}/cnts/write_form">
			<button class="btn btn-primary"> 추가 </button>
		</a>
		<table class="table table-hover">
		 	<tbody>
		 		<tr>
		 		<th>번호 </th> <th>제목 </th><th>룸번호 </th>
		 		</tr>
		 		
		 		<c:forEach items="${list}" var="dto">
			 		<tr>
				 		<td>${dto.w_no}</td>
				 		<td>
				 		<a href="${pageContext.request.contextPath}/cnts/detail?w_no=${dto.w_no}">
				 			${dto.w_title}
				 		</a>
				 		</td>
				 		<td>${dto.r_no}</td>
			 		
			 		</tr>
		 		</c:forEach>
		 		
		 	</tbody>
		</table>
		
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>