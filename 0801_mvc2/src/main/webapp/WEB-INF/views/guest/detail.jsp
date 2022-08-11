<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 상품 상세조회</title>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- bootstrap to icon -->
		<script defer
			src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
			integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
			crossorigin="anonymous"></script>
		<script defer
			src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
			integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
			crossorigin="anonymous"></script>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
			crossorigin="anonymous">
			<style type="text/css">
			<%@ include  file ="/WEB-INF/views/style_share.jsp" %> 
			<%@ include  file ="/WEB-INF/views/style_hf.jsp" %> 
			
			</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<hr>
	<h3>제품의 상세 조회</h3>
	<hr>
	<table>
		<tbody>
			<tr>
				<td>
					<div align="center">
						<img src="${pageContext.request.contextPath}/resources/img/bg.jpeg" height="400px" width="400px">
					</div>
				</td>
			</tr>
			<tr>
				<td style="font-size: 15px">상품항목</td>
			</tr>
			<tr>
				<td style="font-size: 20px">상품이름</td>
			</tr>
			
		</tbody>
	</table>
	
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>