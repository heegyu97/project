<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<style type="text/css">

.btn-group {
	display: flex;
}

.find-btn1, .find-btn2 {
	margin-right: 5%;
}
</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<h3>로그인 유형 선택</h3>
	<!-- 라디오 + 버튼 혼합  : 구매자 판매자 .. -->
	
	<div class="btn-group" role="group"
		aria-label="Basic radio toggle button group">
		<input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="guest" autocomplete="off" ${btnradioValue2 eq "guest"?'checked="checked"':''}> 
		<label
			class="btn btn-outline-primary rounded-pill find-btn1"
			for="btnradio1">고객님
		</label> 
		<input type="radio" class="btn-check" name="btnradio" id="btnradio2" value="seller" autocomplete="off" ${btnradioValue2 eq "seller"?'checked="checked"':''}>
		<label class="btn btn-outline-primary rounded-pill find-btn2"
			for="btnradio2">판매자</label> 
		<input type="radio" class="btn-check" name="btnradio" id="btnradio3" value="manager" autocomplete="off" ${btnradioValue2 eq "manager"?'checked="checked"':''}>
		<label class="btn btn-outline-primary rounded-pill find-btn3"
			for="btnradio3">관리자</label>
	</div>
	<table class="table table-hover">
		<tbody>
    			<c:if test = "${btnradioValue2 ne '' and btnradioValue2 ne null}">
					<tr>
						<th colspan = "2"><h3>개인정보 등록</h3></th>
					</tr>
					<tr>
						<th>서 비 스 이 용 약 관 동 의</th>
						<td>
							<div class="input-group mb-1">
								<div class="input-group-text">
									<input type="checkbox" id="service_agree" name="service_agree"
										class="mr-1" checked="checked"> 서비스 이용 약관에 동의 합니다.
								</div>
							</div> <textarea class="form-control">서비스 이용 약관</textarea> <label
							for="service_agree" id="service_agree_label"></label>
						</td>
					</tr>
					<tr>
						<th>개 인 정 보 제 공 동 의</th>
						<td>
							<div class="input-group mb-1">
								<div class="input-group-text">
									<input type="checkbox" id="info_agree" name="info_agree"
										class="mr-1" checked="checked"> 개인 정보 제공에 동의 합니다.
								</div>
							</div> <textarea class="form-control">개인 정보 제공</textarea> <label
							for="info_agree" id="info_agree_label"></label>
						</td>
					</tr>
					<tr>
						<th>S M S 수 신 동 의</th>
						<td>
							<div class="input-group">
								<div class="input-group-text">
									<input type="checkbox" id="sms_agree" name="sms_agree"
										class="mr-1" checked="checked"> SMS 수신을 동의 합니다.
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>E M A I L 수 신 동 의</th>
						<td>
							<div class="input-group">
								<div class="input-group-text">
									<input type="checkbox" id="email_agree" name="email_agree"
										class="mr-1" checked="checked"> EMAIL 수신을 동의 합니다.
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							<div class="input-group">
								<input type="text" id="mname" name="mname" maxlength="50"
									class="form-control">
							</div> <label for="mname" id="mname_label"></label>
						</td>
					</tr>
					<tr>
						<th>아 이 디</th>
						<td>
							<div class="input-group">
								<input type="text" id="mid" name="mid" maxlength="20"
									class="form-control">
								<div class="input-group-append">
									<button id="id_btn" class="btn btn-primary"  style= "z-index: 1;">아 이 디 중 복 체
										크</button>
								</div>
							</div> <label for="mid" id="mid_label"></label>
						</td>
					</tr>
					<tr>
						<th>비 밀 번 호</th>
						<td><input type="password" id="mpwd" name="mpwd" maxlength="20"
							class="form-control"> 
								<label for="mpwd" id="mpwd_label"></label>
						</td>
					</tr>
					<tr>
						<th>비 밀 번 호 확 인</th>
						<td><input type="password" id="rempwd" name="rempwd"
							maxlength="20" class="form-control"> 
							<label for="rempwd"
							id="rempwd_label"></label></td>
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
							</div> 
							<label for="tel1" id="tel1_label"></label>
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
							</div> 
							<label for="email1" id="email1_label"></label>
						</td>
					</tr>
					<tr>
						<th>주 소</th>
						<td>
							<div class="input-group">
								<span class="input-group-text"> 우 편 번 호 </span> <input type="text"
									id="post_code" name="post_code" readonly="readonly"
									class="form-control" maxlength = "10">
								<button id="addr_btn" class="btn btn-primary">주 소 검 색</button>
							</div>
							<div class="input-group">
								<span class="input-group-text"> 주 소 </span> <input type="text"
									id="addr1" name="addr1" readonly="readonly" class="form-control" maxlength = "150">
									<label for="addr1" id="addr1_label"></label>
							</div>
							<div class="input-group">
								<span class="input-group-text"> 상 세 주 소 </span> 
								<input type="text" id="addr2" name="addr2" class="form-control" maxlength="150">
								<label for="addr2" id="addr2_label"></label>
							</div>
						</td>
					</tr>
					
				</c:if>
			<c:choose>
				<c:when test = "${btnradioValue2 eq 'guest'}">
					<tr>
						<th colspan = "2"><h3>구매자 고양이 등록</h3></th>
					</tr>
					
					<tr>
						<th>고양이 연령</th>
						<td>
							<div class="input-group">
								<input type="text" id="mcatage" name="mcatage" maxlength="20"
									class="form-control">
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
									value="true" autocomplete="off" > <label
									class="btn btn-outline-primary rounded-pill find-btn1"
									for="mcatsex1">수컷</label>
								<input type="radio" class="btn-check"
									name="mcatsex" id="mcatsex2" value="false" autocomplete="off">
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
									value="true" autocomplete="off">
								 <label
									class="btn btn-outline-primary rounded-pill find-btn1"
									for="mneutyn1">헀습니다</label> 
								<input type="radio" class="btn-check" name="mneutyn" id="mneutyn2" 
									value="false" autocomplete="off"> 
								<label
									class="btn btn-outline-primary rounded-pill find-btn2"
									for="mneutyn2">안헀습니다</label>
							</div>
						</td>
					</tr>
			</c:when>
			<c:when test = "${btnradioValue2 eq 'seller'}">
				<tr>
					<th colspan = "2"><h3>회사 정보 등록</h3></th>
				</tr>
				<tr>
					<th>회사명</th>
					<td>
						<div class="input-group">
							<input type="text" id="mhname" name="mhname" maxlength="50"
								class="form-control">
						</div> <label for="mhname" id="mhname_label"></label>
					</td>
				</tr>
				<tr>
					<th>회사 전화번호</th>
					<td>
						<div class="input-group">
							<input type="text" id="mhtel1" name="mhtel1" maxlength="3"
								class="form-control" placeholder="010"> 
							<input type="text" id="mhtel2" name="mhtel2" maxlength="4"
								class="form-control" placeholder="1234"> 
							<input type="text" id="mhtel3" name="mhtel3" maxlength="4"
								class="form-control" placeholder="5678">
						</div> <label for="tel1" id="tel1_label"></label>
					</td>
				</tr>
				<tr>
					<th>회사 이메일</th>
					<td>
						<div class="input-group">
							<input type="text" id="mhemail1" name="mhemail1" maxlength="25"
							class="form-control"> <span class="input-group-text">@</span>
							<input type="text" id="mhemail2" name="mhemail2" maxlength="25"
							class="form-control" placeholder="naver.com">
						</div> <label for="mhemail1" id="mhemail1_label"></label>
					</td>
				</tr>
				
			</c:when>
			<c:when test = "${btnradioValue2 eq 'manager'}">
				<tr>
					<th colspan = "2"><h3>관리자 정보 등록</h3></th>
				</tr>
				<tr>
					<th>관리자 고유키</th>
					<td>
						<div class="input-group">
							<input type="text" id="mconkey" name="mconkey" maxlength="10"
								class="form-control">
						</div> <label for="mconkey" id="mconkey_label"></label>
					</td>
				</tr>
			</c:when>
			</c:choose>
		</tbody>
	</table>
	<c:if test = "${btnradioValue2 ne '' and btnradioValue2 ne null}">
	<div class="clearfix">
		<a href="${pageContext.request.contextPath}/home">
			<button id="signup_btn" type="button"
				class="btn btn-primary float-right">취소</button>
		</a>

		<button id="join_btn" class="btn btn-primary float-right mr-4">
			회 원 가 입</button>
	</div>
	</c:if>



	<%@ include file="/WEB-INF/views/footer.jsp"%>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".btn-check").click(function() {
				if($(this).val() == "guest" || $(this).val() == "seller" || $(this).val() == "manager"){
					location.href="${pageContext.request.contextPath}/signupform?btnradio="+$(this).val();
				}
			});
			
		}); //click
		
		$(document).ready(function() {
			let checkedID = ""; 
			let checkedCODE = "E123"; 
			let onlyNum = /^[0-9]+$/;
			let engLowerAndNum = /^[a-z0-9]+$/;
			let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
			let onlyEmail = /^[a-zA-Z0-9.@]+$/;
			/* 아이디 중복 체크  */
			$("#id_btn").click(function() {

				if( $.trim( $("#mid").val() ) == "" ){
					return;
				}
				if( $("#mid").val().match(engLowerAndNum) == null ){//허용되지 않은 글자는 null.
					$("#mid_label").text("영문 소문자와 숫자만 허용됩니다..");
					return;
				} else { $("#mid_label").text(""); }
				
				$.get(
						"${pageContext.request.contextPath}/id_chk"
						, {
							mid : $("#mid").val()
						}
						, function(data, status) {//data는 joinController의 idCheck에서 isYN value를 받음
							if(data == 0 ){
								$("#mid_label").text("사용가능한 아이디 입니다.");
								$("#mid_label").css("color", "blue");
								checkedID = $("#mid").val();
							} else if( data >= 1){
								$("#mid_label").text("이미 사용중인 아이디 입니다.");
								$("#mid_label").css("color", "red");
							} else{
								alert("잠시 후 다시 시도해 주세요");
							}
						}//call back function
				);//get
			});
			
			
			$("#addr_btn").click(function() {
				
				 new daum.Postcode({
				 	oncomplete: function(data) {//data : 카카오에서 주는 결과 값
				        $("#post_code").val(data.zonecode);
				 		$("#addr1").val(data.address);
				 	}//call back function
				 }).open();
				
			});//click

			
			$("#join_btn").click(function() {
				if ($("#service_agree").prop("checked") == false) {
					$("#service_agree_label").text("필수 선택 사항 입니다.");
					$("#service_agree_label").css("color", "red");
					return;
					} else {
						$("#service_agree_label").text("");
					}
					if ($("#info_agree").prop("checked") == false) {
						$("#info_agree_label").text("필수 선택 사항 입니다.");
						$("#info_agree_label").css("color", "red");
						return;
					} else {
						$("#info_agree_label").text("");
					}
					if ($("#mname").val() == "") {
						$("#mname_label").text("이름을 입력해 주세요.");
						$("#mname_label").css("color", "red");
						return;
					} else {
						$("#mname_label").text("");
					}
					if ($("#mid").val() == "") {
						$("#mid_label").text("아이디를 입력해 주세요.");
						$("#mid_label").css("color", "red");
						return;
					}else{
						$("#mid_label").text("");
					}
					if (checkedID == ""|| checkedID != $("#mid").val()) {
						$("#mid_label").text("아이디 중복 체크를 해 주세요.");
						$("#mid_label").css("color", "red");
						return;
					} else {
						$("#mid_label").text("");
					}
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
					let tmpTel2 = $.trim($("#tel2").val());
					let tmpTel3 = $.trim($("#tel3").val());

					if ((tmpTel1 != "" && tmpTel1.match(onlyNum) == null) || (tmpTel2 != "" && tmpTel2.match(onlyNum) == null) || (tmpTel3 != "" && tmpTel3.match(onlyNum) == null)) {
						$("#tel1_label").text("숫자만 허용 됩니다.");
						$("#tel1_label").css("color", "red");
						return;
					} else {
						$("#tel1_label").text("");
					}
					let tmpEmail1 = $.trim($("#email1").val());
					let tmpEmail2 = $.trim($("#email2").val());
					if ((tmpEmail1 != "" && tmpEmail1.match(onlyEmail) == null) || (tmpEmail2 != "" && tmpEmail2.match(onlyEmail) == null)) {
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
					if( ${btnradioValue2 eq 'manager'} ) {
						if(  $("#mconkey").val() !=  checkedCODE ){
							$("#mconkey_label").text("관리자코드를  다시 확인해주세요");
							$("#mconkey_label").css("color", "red");
							return;
						}
					}
					
						$.post(
							"${pageContext.request.contextPath}/join", 
							{	
								m_type : "${btnradioValue2}"
								,m_service_agree : $("#service_agree").prop("checked")
								, m_info_agree : $("#info_agree").prop("checked")
								, m_name : $("#mname").val()
								, m_id : $("#mid").val()
								, m_pwd : $("#mpwd").val()
								, m_tel1 : $("#tel1").val()
								, m_tel2 : $("#tel2").val()
								, m_tel3 : $("#tel3").val()
								, m_email1 : $("#email1").val()
								, m_email2 : $("#email2").val()
								, m_sms_agree : $("#sms_agree").prop("checked")
								, m_email_agree : $("#email_agree").prop("checked")
								, m_post : $("#post_code").val()
								, m_addr1 : $("#addr1").val()
								, m_addr2 : $("#addr2").val()
								// 구매자-고양이
								, m_cat_age : $("#mcatage").val()
								, m_cat_sex : $("input[type=radio][name=mcatsex]:checked").val()
								, m_neut_yn : $("input[type=radio][name=mneutyn]:checked").val() 
								// 판매자 -회사
								, m_h_name : $("#mhname").val()
								, m_h_tel1 : $("#mhtel1").val()
								, m_h_tel2 : $("#mhtel2").val()
								, m_h_tel3 : $("#mhtel3").val()
								, m_h_email1 : $("#mhemail1").val()
								, m_h_email2 : $("#mhemail2").val()
								// 관리자-코드 
								, m_con_key : $("#mconkey").val()

							}
							, function(data, status) {
								if(data == 1){
									alert("회원 가입에 성공 하셨습니다. 로그인 해주세요.");
									location.href="${pageContext.request.contextPath}/loginform";
							} else {
								alert("잠시 후 다시 시도해 주세요.");
							}
						}//call back function
					);//post
					
				});//click
			});//ready
		</script>
	</body>
</html>






