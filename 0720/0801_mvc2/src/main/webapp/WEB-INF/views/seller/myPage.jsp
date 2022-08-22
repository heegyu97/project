<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 냥냥라이프 </title>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
		<style type="text/css">
			.btn-group{
				display: flex;
				margin-right: 10px;
				
			}
			
			
		
		</style>
	</head>
	
	<body>
		<%@ include file="/WEB-INF/views/header.jsp"%>
	<!-- main on 화면 소스코드 -->
				<h1 style ="text-align: center">S마이페이지</h1>			
				<table class="table table-hover">
					<tr>
						<th colspan="1" rowspan="4"  width = "170px"  align="left" >
						<img src="${pageContext.request.contextPath}/resources/img/logo.jpeg" style="width:170px; mx-auto" >
						</th>
					</tr>
					<tr>
						<th width="150px">회사명</th>
						<td align = "center" >
							<div class="input-group">
								<input type="text" id="m_h_name" name="m_h_name" maxlength="20" class="form-control" readonly value = "${login_info.m_h_name}">
							</div>
						</td>
					</tr>
					<tr>
					
						<th>회사전화번호</th>
						<td align = "center">
							<div class="input-group">
								<input type="text" id="m_h_tel" name="m_h_tel" maxlength="20" class="form-control" readonly value = "${login_info.m_h_tel}">
							</div>
						</td>
					</tr>
					<tr>
						<th>회사이메일</th>
						<td align = "center" >
							<div class="input-group">
								<input type="text" id="m_h_email" name="m_h_email" maxlength="45" class="form-control" readonly value = "${login_info.m_h_email}">
							</div>
						</td>
					</tr>
				</table>
				<br>
				<table class="table table-hover" >
					<tr>
						<th>이름</th>
						<td>
							<div class="input-group">
								<input type="text" id="m_name" name="m_name" maxlength="20"
									class="form-control" readonly value = "${login_info.m_name}">
							</div>
						</td>
					</tr>
					<tr>
						<th>전 화 번 호</th>
						<td>
							<div class="input-group">
								<input type="text" id="m_tel" name="m_tel" maxlength="11"
									class="form-control" readonly value = "${login_info.m_tel}"> 
							</div> 
						</td>
					</tr>
					<tr>
						<th>주 소</th>
						<td>
							<div class="input-group">
								<span class="input-group-text"> 우 편 번 호 </span> <input type="text"
									id="m_post" name="m_post" readonly value = "${login_info.m_post}"
									class="form-control">	
								<button id="addr_btn" class="btn btn-primary">주 소 검 색</button>
							</div>
							<div class="input-group">
								<span class="input-group-text"> 주 소 </span> <input type="text"
									id="m_addr1" name="m_addr1" readonly class="form-control" value = "${login_info.m_addr1}">
							</div>
							<div class="input-group">
								<span class="input-group-text"> 상 세 주 소 </span> 
								<input type="text" id="m_addr2" name="m_addr2" class="form-control" readonly value = "${login_info.m_addr2}">
							</div>
						</td>
					</tr>
					<tr>
						<th>마일리지</th>
						<td>${login_info.m_m}</td>
					</tr>
				</table>
				<br>
				<div style = "text-align: center">
					<a href= "${pageContext.request.contextPath}/seller/myPrivacy"> 
						<h3 style = "text-decoration: underline;">개인정보 수정/탈퇴</h3>
					</a>
					<a href="${pageContext.request.contextPath}/logout">
						<h3 style = "text-decoration: underline;">로그아웃</h3>
					</a>
				</div>
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#addr_btn").attr('disabled',true);
				$("input[name = 'btnsex']").attr('disabled',true);
				$("input[name = 'btnYN']").attr('disabled',true);
			});
			
		</script>
	</body>
</html>