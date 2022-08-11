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
				<h1 style ="text-align: center">개인정보</h1>			
				<table class="table table-hover">
					<tr>
						<th colspan="2"><h3>회원 정보 등록</h3></th>
					</tr>
					<tr>
						<th>아 이 디</th>
						<td>
							<div class="input-group">
								<input type="text" id="mid" name="mid" maxlength="20"
									class="form-control">
								<div class="input-group-append">
									<button id="id_btn" class="btn btn-primary" style ="z-index: 1">아 이 디 중 복 체크</button>
								</div>
							</div>
							<label for="mid" id="mid_label"></label>
						</td>
					</tr>
					<tr>
						<th>비 밀 번 호</th>
						<td><input type="password" id="mpwd" name="mpwd" maxlength="20"
							class="form-control"> <label for="mpwd" id="mpwd_label"></label>
						</td>
					</tr>
					<tr>
						<th>비 밀 번 호 확 인</th>
						<td><input type="password" id="rempwd" name="rempwd"
							maxlength="20" class="form-control"> <label for="rempwd"
							id="rempwd_label"></label></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<div class="input-group">
								<input type="text" id="mname" name="mname" maxlength="20"
									class="form-control">
						</td>
					</tr>
					<tr>
						<th>전 화 번 호</th>
						<td>
							<div class="input-group">
								<input type="text" id="tel1" name="tel1" maxlength="3"
									class="form-control" placeholder="010"> <input
									type="text" id="tel2" name="tel2" maxlength="4"
									class="form-control" placeholder="1234"> <input
									type="text" id="tel3" name="tel3" maxlength="4"
									class="form-control" placeholder="5678">
							</div> <label for="tel1" id="tel1_label"></label>
						</td>
					</tr>
					<tr>
						<th>이 메 일</th>
						<td>
							<div class="input-group">
								<input type="text" id="email1" name="email1" maxlength="25"
									class="form-control"> <span class="input-group-text">@</span>
								<input type="text" id="email2" name="email2" maxlength="25"
									class="form-control" placeholder="naver.com">
							</div> <label for="email1" id="email1_label"></label>
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
								<span class="input-group-text"> 상 세 주 소 </span> <input type="text"
									id="addr2" name="addr2" class="form-control">
							</div>
						</td>
					</tr>
					<tr>
						<th colspan = "2"><h3>회사 정보 등록</h3></th>
					</tr>
						<tr>
							<th>회사명</th>
							<td>
								<div class="input-group">
									<input type="text" id="mname" name="mname" maxlength="150"
										class="form-control">
								</div> <label for="mname" id="mname_label"></label>
							</td>
						</tr>
						<tr>
							<th>회사 전화번호</th>
							<td>
								<div class="input-group">
									<input type="text" id="tel1" name="tel1" maxlength="3"
										class="form-control" placeholder="010"> <input
										type="text" id="tel2" name="tel2" maxlength="4"
										class="form-control" placeholder="1234"> <input
										type="text" id="tel3" name="tel3" maxlength="4"
										class="form-control" placeholder="5678">
								</div> <label for="tel1" id="tel1_label"></label>
							</td>
						</tr>
						<tr>
							<th>회사 이메일</th>
							<td>
								<div class="input-group">
									<input type="text" id="email1" name="email1" maxlength="25"
									class="form-control"> <span class="input-group-text">@</span>
									<input type="text" id="email2" name="email2" maxlength="25"
									class="form-control" placeholder="naver.com">
								</div> <label for="email1" id="email1_label"></label>
							</td>
						</tr>
					</table>
					<table class="table table-hover">
					<tr>
						<th>SMS 수신동의</th>
						<td>
							<div class="input-group">
								<div class="input-group-text">
									<input type="checkbox" id="sms_agree" name="sms_agree"
										class="mr-1" checked="checked"> SMS 수신을 동의 합니다.
								</div>
							</div>
						</td>
						<th>EMAIL 수신동의</th>
						<td>
							<div class="input-group">
								<div class="input-group-text">
									<input type="checkbox" id="email_agree" name="email_agree"
										class="mr-1" checked="checked"> EMAIL 수신을 동의 합니다.
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div class="clearfix">
					<a href="${pageContext.request.contextPath}/seller/myPage">
						<button id="no_btn" type="button" class="btn btn-primary float-right mr-3">취소</button>
					</a>
					<a href="${pageContext.request.contextPath}/seller/myPage">
						<button id="ok_btn" type="button" class="btn btn-primary float-right mr-3">확인</button>
					</a>
				</div>
				<br>
				<div>
					<button id="delete_btn" type="button" class="btn btn-primary float-right mr-3" >정보 삭제</button>
				</div>	
				
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#delete_btn").click(function() {
					var result = confirm("정말로 삭제하실건가요?");
					if(result){
						/* sql- del 선언 - 사용자 아이디 삭제 */
					    alert("삭제하셨습니다.");
						/* 홈이로 이동 */
					    location.href = "${pageContext.request.contextPath}/home";
					}else{
					    alert("삭제를 취소헀습니다.");
					    /* 현재 페이지 */
					}
				});
			});
					
		
		
		</script>
	</body>
</html>