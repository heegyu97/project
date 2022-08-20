<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>냥냥라이프 상품조회 구매자</title>
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
			table, td, th {
			border : 1px solid black;
			border-collapse : col	
		}		
		label{
			text-align: center;
			vertical-align: middle;
		}
		.btn-group {
			width : 280px;
		}
		

		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	
		<hr>
		<h3>회원 상세사항</h3>
		<hr>
		<div>
				<div class="input-group mb-4">
					<label style = "width : 100px;align-content: center; ">회원번호</label>
					
						<input type="text" id="mid" name="mid" maxlength="20" class="form-control" readonly>
					<label style = "width : 100px;align-content: center; ">등록일 </label>
						<input type="text" id="mid" name="mid" maxlength="20" class="form-control" readonly>
					
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">아이디</label>
					<input type="text" id="mid" name="mid" maxlength="20" class="form-control" readonly>
					<label style = "width : 100px;align-content: center; ">가입유형</label>
					<input type="text" id="mtype" name="mtype" maxlength="20" class="form-control" readonly>
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">비밀번호 </label>
						<input type="password" id="mpwd" name="mpwd" maxlength="20" class="form-control" readonly>
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">회원이름</label>
						<input type="text" id="mname" name="mname" maxlength="20" class="form-control" readonly>
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">전화번호</label>
						<input type="text" id="mtel" name="mtel" maxlength="11" placeholder="01012345678" class="form-control" readonly>
						<label style = "width : 100px;align-content: center; ">이메일</label>
						<input type="text" id="memail" name="memail" maxlength="50" class="form-control" readonly>
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">우편 주소</label>
					<input type="text" id="post" name="post" maxlength="310" class="form-control" readonly>
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">길 주소</label>
					<input type="text" id="post" name="post" maxlength="310" class="form-control" readonly>
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">상세 주소</label>
					<input type="text" id="post" name="post" maxlength="310" class="form-control" readonly>
				</div>
				<div class = "input-group mb-4">
					<div class="input-group-text" style = "width:300px">
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" disabled> 서비스 이용 약관에 동의 합니다(*).
					</div>
					<div class="input-group-text" style = "width:300px">
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" disabled> 개인 정보 제공에 동의 합니다(*).
					</div>
				</div>
				<div class = "input-group mb-4">
					<div class="input-group-text" style = "width:300px" >
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" disabled> SMS 수신을 동의 합니다.
					</div>
					<div class="input-group-text" style = "width:300px">
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" disabled> EMAIL 수신을 동의 합니다.
					</div>
				</div>
				<table class="table table-hover table-borderless" >
				<tbody>
				<c:choose>
				<c:when test = "${member_dto.m_type eq 'guest'}">
					<tr>
						<th colspan = "2"><h3>구매자 고양이 등록</h3></th>
					</tr>
					
					<tr>
						<th>고양이 연령</th>
						<td>
							<div class="input-group">
								<input type="text" id="mcatage" name="mcatage" maxlength="20"
									class="form-control" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th>고양이 성별</th>
						<td>
							<div class="btn-group" role="group"
								aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" 
									name="mcatsex" id="mcatsex1"
									value="true" autocomplete="off" readonly> <label
									class="btn btn-outline-primary rounded-pill find-btn1"
									for="mcatsex1">수컷</label>
								<input type="radio" class="btn-check"
									name="mcatsex" id="mcatsex2" value="false" autocomplete="off" readonly>
								<label class="btn btn-outline-primary rounded-pill find-btn2"
									for="mcatsex2">암컷</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>고양이 중성화유무</th>
						<td>
							<div class="btn-group" role="group"
								aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="mneutyn" id="mneutyn1"
									value="true" autocomplete="off" readonly>
								 <label
									class="btn btn-outline-primary rounded-pill find-btn1"
									for="mneutyn1">O</label> 
								<input type="radio" class="btn-check" name="mneutyn" id="mneutyn2" 
									value="false" autocomplete="off" readonly> 
								<label
									class="btn btn-outline-primary rounded-pill find-btn2"
									for="mneutyn2">X</label>
							</div>
						</td>
					</tr>
			</c:when>
			<c:when test = "${member_dto.m_type eq 'seller'}">
				<tr>
					<th colspan = "2"><h3>회사 정보 등록</h3></th>
				</tr>
				<tr>
					<th>회사명</th>
					<td>
						<div class="input-group">
							<input type="text" id="mhname" name="mhname" maxlength="50"
								class="form-control" readonly>
						</div>
					</td>
				</tr>
				<tr>
					<th>회사 전화번호</th>
					<td>
						<div class="input-group">
							<input type="text" id="mhtel1" name="mhtel1" maxlength="3"
								class="form-control" placeholder="010" readonly> 
						</div>
					</td>
				</tr>
				<tr>
					<th>회사 이메일</th>
					<td>
						<div class="input-group">
							<input type="text" id="mhemail1" name="mhemail1" maxlength="25"
							class="form-control" readonly> 
						</div> 
					</td>
				</tr>
				
			</c:when>
			<c:when test = "${member_dto.m_type eq 'manager'}">
				<tr>
					<th colspan = "2"><h3>관리자 정보 등록</h3></th>
				</tr>
				<tr>
					<th>관리자 고유키</th>
					<td>
						<div class="input-group">
							<input type="text" id="mconkey" name="mconkey" maxlength="10"
								class="form-control" readonly>
						</div> 
					</td>
				</tr>
			
			</c:when>
			</c:choose>
			</tbody>
			</table>
				
				
		</div>
		<button id="del_btn" type="button"
				class="btn btn-danger " style = "width : 600px; height:80px;margin-bottom: 12px" >
				삭제</button>

		<a href="${pageContext.request.contextPath}/manager/membermanagement">
			<button id="signup_btn" type="button"
				class="btn btn-primary " style = "width : 600px; height:80px;margin-bottom: 12px" >
				이전</button>
		</a>
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		
		<script type="text/javascript">
			
			$(document).ready(function() {
				$("#del_btn").click(function() {
					
					
				});
			});
		
		</script>
		
		
	</body>
</html>