<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 계정 만들기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
		<style type="text/css">
			th{
				text-transform: lowercase;
				line-height: 40px;
			}
			td:hover {
			  -webkit-transform: scale(1.25, 1.25);
			  transform: scale(1.25, 1.25);
			}
			
		</style>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<table class="table table-borderless" style = "width : 530px ; margin : auto; ">
			<tbody>
				<tr>
					<th style = "width : 130px; text-align: center;" class = "fontlee" > 아 이 디 </th>
					
					<td style = "width : 270px">
						<div class="input-group">
							<input type="text" id="m_id" name="m_id" class="form-control fontlee"><br>
						</div>
							<label for="m_id" id="m_id_label" class = "fontlee"></label>
					</td>
					<td style = "width : 130px">
						<button id="id_btn" class="btn btn-primary" style = "width: 100px">
							<font class = "fontlee">ID-확인</font>
						</button>
					</td>
				</tr>
				<tr>
					<th style = "text-align: center;" class = "fontlee"> 패스워드 </th>
					<td>
						<input type="password" id="m_pwd" name="m_pwd"  class="form-control">
						<label for="m_pwd" id="m_pwd_label" class = "fontlee"></label>
					</td>
				</tr>
				<tr>
					<th style = "text-align: center;" class = "fontlee"> 패스워드 확인</th>
					<td>
						<input type="password" id="r_pwd" name="r_pwd" class="form-control">
						<label for="r_pwd" id="r_pwd_label" class = "fontlee"></label></td>
					</td>
				</tr>
				<tr>
					<th style = "text-align: center;" class = "fontlee"> E-Mail</th>
					<td>
						<input type="text" id="m_email" name="m_email" class="form-control fontlee" value = "${email_save}">
						<label for="m_email" id="m_email_label" class = "fontlee"></label></td>
					</td>
					<td>
						<button id="email_btn" class="btn btn-primary" style = "width: 100px">
							<font class = "fontlee">E-전송</font>
						</button>
					</td>
				</tr>
				<tr>
					<th style = "text-align: center;" class = "fontlee"> 인증코드 </th>
					<td>
						<div class="input-group">
							<input type="text" id="m_con_key" name="m_con_key" class="form-control fontlee">
						</div>
						<label for="m_email" id="m_con_key_label"></label>
					</td>
				</tr>
				<tr>
					<td colspan="3">
					<button id = "join_btn" class = "btn btn-primary btn-block"  style = "border-radius: 30px;padding-top: 10px" ><font class = "fontlee">회원가입</font></button>
					</td>
				</tr>
				<tr>
					<td colspan="3">
					 <button id = "cancle_btn" class = "btn btn-danger btn-block"  style = "border-radius: 30px;padding-top: 10px" ><font class = "fontlee">취소</font></button>
					</td>
				</tr>
				
			</tbody>
		</table>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			let checkedID = "";
			let code = "";
			let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
			let engLowerAndNum = /^[a-z0-9]+$/;
			$("#id_btn").click(function() {

				if( $.trim( $("#m_id").val() ) == "" ){
					$("#m_id_label").text("아이디를 입력해 주세요.");
					$("#m_id_label").css("color", "red");
					return;
				}
				if( $("#m_id").val().match(engLowerAndNum) == null ){//허용되지 않은 글자는 null.
					$("#m_id_label").text("영문 소문자와 숫자만 허용됩니다.");
					$("#m_id_label").css("color", "red");
					return;
				} else { $("#m_id_label").text(""); }
				
				
				
				
				
				
				$.get(
						"${pageContext.request.contextPath}/id_chk"
						, {
							m_id : $("#m_id").val()
						}
						, function(data, status) {//data는 joinController의 idCheck에서 isYN value를 받음
							if(data == 0 ){
								$("#m_id_label").text("사용가능한 아이디 입니다.");
								$("#m_id_label").css("color", "blue");
								checkedID = $("#m_id").val();
							} else if( data >= 1){
								$("#m_id_label").text("이미 사용중인 아이디 입니다.");
								$("#m_id_label").css("color", "red");
							} else{
								alert("잠시 후 다시 시도해 주세요");
							}
						
						}//call back function
				);//get
			});
			
			
			$("#email_btn").click(function() {//인증코드 이메일 전송
				$.get(
						"${pageContext.request.contextPath}/gmail/send",
						{
							m_email : $("#m_email").val()
						}
						, function(data, status) {
							//data는 joinController의 idCheck에서 isYN value를 받음
							if(data == "" || data == null ){
								$("#m_email_label").text("인증코드 보내기 오류");
								$("#m_email_label").css("color", "red");
							} else if( data != "" && data != null){
								$("#m_email_label").text("");
								code = data;
								alert("이메일을 확인해주세요.");
							} else{
								alert("잠시 후 다시 시도해 주세요");
							}
						
						}//call back function
				);//get
				
			});//click
			
			$("#join_btn").click(function() {
					if ($("#m_id").val() == "") {
						$("#m_id_label").text("아이디를 입력해 주세요.");
						$("#m_id_label").css("color", "red");
						return;
					}else{
						$("#m_id_label").text("");
					}
					
					if (checkedID == ""|| checkedID != $("#m_id").val()) {
						$("#m_id_label").text("아이디 중복 체크를 해 주세요.");
						$("#m_id_label").css("color", "red");
						return;
					} else {
						$("#mid_label").text("");
					}
					
					if ($("#m_pwd").val().match(onlyPwd) == null) {//허용되지 않은 글자는 null.
						$("#m_pwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
						$("#m_pwd_label").css("color", "red");
						return;
					} else {
						$("#m_pwd_label").text("");
					}
					
					if ($("#m_pwd").val() != $("#r_pwd").val()) {
						$("#r_pwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
						$("#r_pwd_label").css("color", "red");
						return;
					} else {
						$("#r_pwd_label").text("");
					}
					if (code == "" || code == null) {
						$("#m_email_label").text("인증코드가 존재하지 않습니다.");
						$("#m_email_label").css("color", "red");
						return;
					} else {
						$("#m_email_label").text("");
					}
					if (code != $("#m_con_key").val()) {
						$("#m_con_key_label").text("인증코드를 확인해 주세요");
						$("#m_con_key_label").css("color", "red");
						return;
					} else {
						$("#m_con_key_label").text("");
					}
						$.post(
							"${pageContext.request.contextPath}/join", 
							{	
								m_id : $("#m_id").val()
								, m_pwd : $("#m_pwd").val()
								, m_email : $("#m_email").val()
							}
								, function(data, status) {
								if(data == 1){
									alert("회원 가입에 성공 하셨습니다. 로그인 해주세요.");
									location.href="${pageContext.request.contextPath}/login/login_form";
								} else {
									alert("잠시 후 다시 시도해 주세요.");
								}
							}//call back function
						);//post
					
				});//click
				$("#cancle_btn").click(function() {
					location.href="${pageContext.request.contextPath}/login/login_form";
				});//click
		});//ready
	
	</script>
</body>
</html>