<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프</title>
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
		
<!-- 		<table class="table table-bordered"> -->
		<table class="table table-borderless">
			<col class="w-25">
			
			<thead>
				<tr >
					<th colspan="2" class="text-center">
						<h3>글제목</h3>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><h5>작성자</h5></td>
				</tr>
				<tr>
					<td>
						날짜
					</td>
					<td>
						<h5 class="float-right">추천 조회수</h5>
					</td>
				</tr>
			</tbody>
		</table>
		
		<hr>
		
		<table>
			<tbody>
				<tr>
					<td>
						내용
					</td>
				</tr>
			</tbody>
		</table>
		
		<%-- 버튼 --%>
		
			<a class="float-right" href="#">
			<button class="btn btn-danger mr-2">글삭제</button>
			</a>
			
			<a class="float-right" href="${pageContext.request.contextPath}/tip/tipupdateform">
				<button class="btn btn-success mr-2">글수정</button>
			</a>
			
			<a class="float-right" href="${pageContext.request.contextPath}/tip/tip">
				<button type="button" class="btn btn-secondary mr-2">이전</button>
			</a>
		
		

		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>