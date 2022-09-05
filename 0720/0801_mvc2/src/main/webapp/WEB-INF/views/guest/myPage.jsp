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
				<h1 style ="text-align: center">G마이페이지</h1>			
				<table class="table table-hover">
					<tr>
						<th colspan="1" rowspan="4"  width = "170px"  align="left" >
						<img src="${pageContext.request.contextPath}/resources/img/logo.jpeg" style="width:170px; mx-auto" >
						</th>
					</tr>
					<tr>
						<th width="150px">고양이 연령</th>
						<td align = "center" >
							<div class="input-group">
								<input type="text" id="mname" name="mname" maxlength="20" class="form-control" value = "${login_info.m_cat_age}" readonly>
							</div>
						</td>
					</tr>
					<tr>
					
						<th>고양이 성별</th>
						<td align = "center">
							<div class="btn-group" role="group"	aria-label="Basic radio toggle button group" >
								<input type="radio" class="btn-check" name="btnsex" id="btnsex1" value="male" autocomplete="off" ${login_info.m_cat_sex eq "true"?'checked="checked"':''}> 
								<label class="btn btn-outline-primary rounded-pill find-btn1"  for="btnsex1">수컷</label> 
								<input type="radio" class="btn-check" name="btnsex" id="btnsex2" value="female" autocomplete="off" ${login_info.m_cat_sex eq "false"?'checked="checked"':''}>
								<label class="btn btn-outline-primary rounded-pill find-btn2" for="btnsex2">암컷</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>고양이 중성화유무</th>
						<td align = "center" >
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="btnYN" id="btnYN1" value="yes" autocomplete="off" ${login_info.m_neut_yn eq "true"?'checked="checked"':''}> 
								<label class="btn btn-outline-primary rounded-pill find-btn1" for="btnYN1">O</label> 
								<input type="radio" class="btn-check" name="btnYN" id="btnYN2" value="no" autocomplete="off" ${login_info.m_neut_yn eq "false"?'checked="checked"':''}>
								<label class="btn btn-outline-primary rounded-pill find-btn2" for="btnYN2">X</label>
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
									class="form-control" value = "${login_info.m_name}" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th>전 화 번 호</th>
						<td>
							<div class="input-group">
								<input type="text" id="tel1" name="tel1" maxlength="3"
									class="form-control" value = "${login_info.m_tel}" readonly> 
							</div>
						</td>
					</tr>
					<tr>
						<th>주 소</th>
						<td>
							<div class="input-group">
								<span class="input-group-text"> 우 편 번 호 </span> <input type="text"
									id="post_code" name="post_code" readonly="readonly" value = "${login_info.m_post}"
									class="form-control">
								<button id="addr_btn" class="btn btn-primary">주 소 검 색</button>
							</div>
							<div class="input-group">
								<span class="input-group-text"> 주 소 </span>
								<input type="text" id="addr1" name="addr1" class="form-control" readonly value = "${login_info.m_addr1}">
							</div>
							<div class="input-group">
								<span class="input-group-text"> 상 세 주 소 </span> 
								<input type="text" id="addr2" name="addr2" class="form-control" readonly value = "${login_info.m_addr2}">
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
					<a href= "${pageContext.request.contextPath}/guest/myPrivacy"> 
						<h3 style = "text-decoration: underline;">개인정보 수정/탈퇴</h3>
					</a>
					<a href= "${pageContext.request.contextPath}/guest/sellcom?m_no=${login_info.m_no}">
						<h3 style = "text-decoration: underline;">주문조회</h3>
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