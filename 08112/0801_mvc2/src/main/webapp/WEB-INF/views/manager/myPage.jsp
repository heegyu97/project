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
				<h1 style ="text-align: center">마이페이지</h1>			
				<table class="table table-hover">
					<tr>
						<th colspan="1" rowspan="4"  width = "170px"  align="left" >
						<img src="${pageContext.request.contextPath}/resources/img/logo.jpeg" style="width:170px; mx-auto" >
						</th>
					</tr>
					<tr>
						<th width="150px">고유키</th>
						<td align = "center" >
							<div class="input-group">
								<input type="text" id="con_key" name="con_key" maxlength="20" class="form-control" readonly>
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
								<input type="text" id="mname" name="mname" maxlength="20"
									class="form-control" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th>전 화 번 호</th>
						<td>
							<div class="input-group">
								<input type="text" id="tel1" name="tel1" maxlength="3"
									class="form-control" placeholder="010" readonly> 
								<input
									type="text" id="tel2" name="tel2" maxlength="4"
									class="form-control" placeholder="1234" readonly> 
								<input
									type="text" id="tel3" name="tel3" maxlength="4"
									class="form-control" placeholder="5678" readonly>
							</div> <label for="tel1" id="tel1_label"></label>
						</td>
					</tr>
					<tr>
						<th>주 소</th>
						<td>
							<div class="input-group">
								<span class="input-group-text"> 우 편 번 호 </span> <input type="text"
									id="post_code" name="post_code" readonly="readonly"
									class="form-control">
								<button id="addr_btn" class="btn btn-primary">주 소 검 색</button>
							</div>
							<div class="input-group">
								<span class="input-group-text"> 주 소 </span> <input type="text"
									id="addr1" name="addr1" readonly="readonly" class="form-control">
							</div>
							<div class="input-group">
								<span class="input-group-text"> 상 세 주 소 </span> 
								<input type="text" id="addr2" name="addr2" class="form-control" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th>마일리지</th>
						<td>00000000000</td>
					</tr>
				</table>
				<br>
				<div style = "text-align: center">
					<a href= "${pageContext.request.contextPath}/manager/myPrivacy"> 
						<h3 style = "text-decoration: underline;">개인정보 수정/탈퇴</h3>
					</a>
					<a href= "">
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