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
			border-collapse : collapse;
		}		
		label{
			text-align: center;
			vertical-align: middle;
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
					
						<input type="text" id="mid" name="mid" maxlength="20" class="form-control">
					<label style = "width : 100px;align-content: center; ">등록일 </label>
						<input type="text" id="mid" name="mid" maxlength="20" class="form-control">
					
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">아이디</label>
					<input type="text" id="mid" name="mid" maxlength="20" class="form-control">
					<label style = "width : 100px;align-content: center; ">가입유형</label>
					<input type="text" id="mtype" name="mtype" maxlength="20" class="form-control">
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">비밀번호 </label>
						<input type="password" id="mpwd" name="mpwd" maxlength="20" class="form-control">
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">회원이름</label>
						<input type="text" id="mname" name="mname" maxlength="20" class="form-control">
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">전화번호</label>
						<input type="text" id="mtel" name="mtel" maxlength="11" placeholder="01012345678" class="form-control">
						<label style = "width : 100px;align-content: center; ">이메일</label>
						<input type="text" id="memail" name="memail" maxlength="50" class="form-control">
				</div>
				<div class = "input-group mb-4">
					<label style = "width : 100px;align-content: center; ">주소</label>
					<input type="text" id="post" name="post" maxlength="310" class="form-control">
				</div>
				<div class = "input-group mb-4">
					<div class="input-group-text" style = "width:300px">
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" checked="checked"> 서비스 이용 약관에 동의 합니다(*).
					</div>
					<div class="input-group-text" style = "width:300px">
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" checked="checked"> 개인 정보 제공에 동의 합니다(*).
					</div>
				</div>
				<div class = "input-group mb-4">
					<div class="input-group-text" style = "width:300px" >
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" checked="checked"> SMS 수신을 동의 합니다.
					</div>
					<div class="input-group-text" style = "width:300px">
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" checked="checked"> EMAIL 수신을 동의 합니다.
					</div>
				</div>
		</div>
		
		<button id="updateok_btn" type="button"
			class="btn btn-primary " style = "width : 600px;height:80px; margin-bottom: 12px" >
			수정 완료</button>

		<a href="${pageContext.request.contextPath}/manager/membermanagement_detail">
			<button id="signup_btn" type="button"
				class="btn btn-warning" style = "width : 600px; height:80px;margin-bottom: 12px" >
				취소</button>
		</a>
		
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#updateok_btn").click(function() {
					alert("뺶");
				});
			});
		
		</script>
	</body>
</html>