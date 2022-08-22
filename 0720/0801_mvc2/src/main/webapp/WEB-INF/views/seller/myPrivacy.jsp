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
									class="form-control" value = "${login_info.m_id}" readonly>
							</div>
							
						</td>
					</tr>
					<tr>
						<th>비 밀 번 호</th>
						<td><input type="password" id="mpwd" name="mpwd" maxlength="20"
							class="form-control" value = "${login_info.m_pwd}"> <label for="mpwd" id="mpwd_label"></label>
						</td><label for="mpwd" id="mpwd_label"></label>
					</tr>
					<tr>
						<th>비 밀 번 호 확 인</th>
						<td><input type="password" id="rempwd" name="rempwd"
							maxlength="20" class="form-control" > 
							<label for="rempwd"	id="rempwd_label"></label></td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<div class="input-group">
								<input type="text" id="mname" name="mname" maxlength="20"
									class="form-control" value = "${login_info.m_name}" readonly>
						</td>
					</tr>
					<tr>
						<th>전 화 번 호</th>
						<td>
							<div class="input-group">
								<input type="text" id="tel1" name="tel1" maxlength="11"
									class="form-control" value = "${login_info.m_tel}"> 
							</div> <label for="tel1" id="tel1_label"></label>
						</td>
					</tr>
					<tr>
						<th>이 메 일</th>
						<td>
							<div class="input-group">
								<input type="text" id="email1" name="email1" maxlength="50"
									class="form-control" value = "${login_info.m_email}" > 
							</div> <label for="email1" id="email1_label"></label>
						</td>
					</tr>
					<tr>
						<th>주 소</th>
						<td>
							<div class="input-group">
								<span class="input-group-text"> 우 편 번 호 </span> <input type="text"
									id="post_code" name="post_code" readonly="readonly"
									class="form-control" value = "${login_info.m_post}">
								<button id="addr_btn" class="btn btn-primary">주 소 검 색</button>
								
							</div>
							<div class="input-group">
								<span class="input-group-text"> 주 소 </span> <input type="text"
									id="addr1" name="addr1" readonly="readonly" class="form-control" maxlength = "150" value = "${login_info.m_addr1}">
									<label for="addr1" id="addr1_label"></label>
							</div>
							<div class="input-group">
								<span class="input-group-text"> 상 세 주 소 </span> 
								<input type="text" id="addr2" name="addr2" class="form-control" maxlength="150" value = "${login_info.m_addr2}">
								<label for="addr2" id="addr2_label"></label>
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
									<input type="text" id="m_h_name" name="m_h_name" maxlength="150"
										class="form-control" value = "${login_info.m_h_name}">
								</div> 
							</td>
						</tr>
						<tr>
							<th>회사 전화번호</th>
							<td>
								<div class="input-group">
									<input type="text" id="m_h_tel" name="m_h_tel" maxlength="150"
										class="form-control" value = "${login_info.m_h_tel}">
								</div>
							</td>
						</tr>
						<tr>
							<th>회사 이메일</th>
							<td>
								<div class="input-group">
									<input type="text" id="m_h_email" name="m_h_email" maxlength="150"
										class="form-control" value = "${login_info.m_h_email}">
								</div> 
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
										class="mr-1" ${login_info.m_sms_agree eq "true"?'checked="checked"':''}> SMS 수신을 동의 합니다.
								</div>
							</div>
						</td>
						<th>EMAIL 수신동의</th>
						<td>
							<div class="input-group">
								<div class="input-group-text">
									<input type="checkbox" id="email_agree" name="email_agree"
										class="mr-1" ${login_info.m_email_agree eq "true"?'checked="checked"':''}> EMAIL 수신을 동의 합니다.
								</div>
							</div>
						</td>
					</tr>
				</table>
				<div class="clearfix">
					<a href="${pageContext.request.contextPath}/seller/myPage">
						<button id="no_btn" type="button" class="btn btn-primary float-right mr-3">취소</button>
					</a>
					
					<button id="ok_btn" type="button" class="btn btn-primary float-right mr-3">확인</button>
			
				</div>
				<br>
				<div>
					<button id="delete_btn" type="button" class="btn btn-primary float-right mr-3" >정보 삭제</button>
				</div>	
				
		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function() {
				$("#ok_btn").click(function() {
					
					let onlyNum = /^[0-9]+$/;
					let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
					let onlyEmail = /^[a-zA-Z0-9.@]+$/;
					
					/* 필수입력값 확인 */
					
					if ($("#mpwd").val().match(onlyPwd) == null) {//허용되지 않은 글자는 null.
						$("#mpwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
						$("#mpwd_label").css("color", "red");
						return;
					} else {
						$("#mpwd_label").text("");
					}
					if ($("#mpwd").val() != $("#rempwd").val()) {
						$("#rempwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
						$("#rempwd_label").css("color", "red");
						return;
					} else {
						$("#rempwd_label").text("");
					}
					
					let tmpTel1 = $.trim($("#tel1").val());

					if ((tmpTel1 != "" && tmpTel1.match(onlyNum) == null)) {
						$("#tel1_label").text("숫자만 허용 됩니다.");
						$("#tel1_label").css("color", "red");
						return;
					} else {
						$("#tel1_label").text("");
					}
					
					let tmpEmail1 = $.trim($("#email1").val());
					if ((tmpEmail1 != "" && tmpEmail1.match(onlyEmail) == null)) {
						$("#email1_label").text("영문 대소문자와 숫자 . @만 허용 됩니다.");
						$("#email1_label").css("color", "red");
						return;
					} else {
						$("#email1_label").text("");
					}
					
					if(  $.trim($("#addr1").val()) == "" ||  $.trim($("#addr1").val()) == null ){
						$("#addr1_label").text("주소를 입력하세요");
						$("#addr1_label").css("color", "red");
						return;
					}else{
						$("#addr1_label").text("");
						
					}
					if(  $.trim($("#addr2").val()) == "" ||  $.trim($("#addr2").val()) == null ){
						$("#addr2_label").text("주소를 입력하세요");
						$("#addr2_label").css("color", "red");
						return;
					}else{
						$("#addr2_label").text("");
					}
					
					/* 기능검사 */
					
					$.post(
							"${pageContext.request.contextPath}/seller/updateid", 
							{	
								m_no : "${login_info.m_no}"
								, m_pwd : $("#mpwd").val()
								, m_tel: $("#tel1").val()
								, m_email : $("#email1").val()
								, m_sms_agree : $("#sms_agree").prop("checked")
								, m_email_agree : $("#email_agree").prop("checked")
								, m_post : $("#post_code").val()
								, m_addr1 : $("#addr1").val()
								, m_addr2 : $("#addr2").val()
								// 판매자-회사정보
								, m_h_name : $("#m_h_name").val()
								, m_h_tel : $("#m_h_tel").val()
								, m_h_email : $("#m_h_email").val() 

							}
							, function(data, status) {
								if(data == 1){
									alert("수정에 성공하셨습니다.");
									location.href="${pageContext.request.contextPath}/loginform";
							} else {
								alert("잠시 후 다시 시도해 주세요.");
							}
						}//call back function
					);//post
					
					
					
				});//click
				
				
				$("#addr_btn").click(function() {
					
					 new daum.Postcode({
					 	oncomplete: function(data) {//data : 카카오에서 주는 결과 값
					        $("#post_code").val(data.zonecode);
					 		$("#addr1").val(data.address);
					 	}//call back function
					 }).open();
					
				});//click
				$("#delete_btn").click(function() {
					var result = confirm("정말로 삭제하실건가요?");
					if(result){
						/* sql- del 선언 - 사용자 아이디 삭제 */
					    $.get(
					    		
								"${pageContext.request.contextPath}/guest/deleteid"
								, {
									m_no : ${login_info.m_no},
									m_pwd : ${login_info.m_pwd}
									
									}
								, function(data, status) {
									if( data >= 1 ){
										alert("게시글이 삭제 되었습니다.");
										location.href="${pageContext.request.contextPath}/logout";
										location.href="${pageContext.request.contextPath}/home";
									} else if( data <= 0 ) {
										alert("게시글 삭제를 실패 하였습니다.");
									} else {
										alert("잠시 후 다시 시도해 주세요.");
									}
								}//call back function
						);//get
					}else{
					    alert("삭제를 취소헀습니다.");
					    /* 현재 페이지 */
					}
					
				});
			});
		</script>
	</body>
</html>