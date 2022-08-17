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
		
<!-- 		<table class="table table-bordered"> -->
		<table class="table table-borderless">
			<col class="w-25">
			
			<thead>
				<tr >
					<th colspan="2" class="text-center">
						<h3>${detail.tip_title}</h3>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><h5>글쓴이</h5></td>
				</tr>
				<tr>
					<td>
						${detail.tip_date}
					</td>
					<td>
						<h5 class="float-right">추천조회수들어가는자리${detail.tip_view_cnt}</h5>
					</td>
				</tr>
			</tbody>
		</table>
		
		<hr>
		
		<table>
			<tbody>
				<tr>
					<td>
						<img src="${detail.tip_prdt_path}" width="400" height="200">
					</td>
				</tr>
				<tr>
					<td>
					
						<textarea rows="10" cols="50" readonly="readonly" >
							${detail.tip_ctnts}
						</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		
		<%-- 버튼 --%>
		
			<a class="float-right" href="#">
			<button class="btn btn-danger mr-2">글삭제</button>
			</a>
			
			<a class="float-right" href="${pageContext.request.contextPath}/tip/tipupdateform?tip_no=${detail.tip_no}">
				<button class="btn btn-success mr-2">글수정</button>
			</a>
			
			<a class="float-right" href="${pageContext.request.contextPath}/tip/tip">
				<button type="button" class="btn btn-secondary mr-2">이전</button>
			</a>
		
		

		<%@ include file="/WEB-INF/views/footer.jsp"%>
	</body>
</html>