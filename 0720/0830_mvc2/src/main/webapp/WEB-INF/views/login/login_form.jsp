<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 로그인 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<%@ page import="java.net.URLEncoder" %>
		<%@ page import="java.security.SecureRandom" %>
		<%@ page import="java.math.BigInteger" %>
		
		<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
		<style type="text/css">
			th{
				text-transform: lowercase;
				line-height: 40px;
				text-align: center;
			}
			
			td:hover {
			  -webkit-transform: scale(1.25, 1.25);
			  transform: scale(1.25, 1.25);
			}
			
		</style>
	</head>
	<body>
	
	<%@ include file="/WEB-INF/views/header.jsp" %>
				<table class="table table-borderless" style = "width : 400px ; margin : auto; ">
					<tbody>
						<tr>
							<th style = "width : 130px" class ="fontlee"> 아 이 디 </th>
							<td>
								<input type="text" id="m_id" name="m_id" class="form-control">
							</td>
						</tr>
						<tr>
							<th class ="fontlee"> 패스워드 </th>
							<td>
								<input type="password" id="m_pwd" name="m_pwd"  class="form-control">
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<button id = "login_btn" class = "btn btn-block"  
									style = "border-radius: 30px;height: 60px;padding-top:18px; background-color:4D4352;color: white;">
							<h4 class ="fontlee">로 그 인</h4></button>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<button id = "sign_btn" class = "btn btn-block" 
									style ="border-radius: 30px;height: 60px;padding-top:18px; background-color:B2A7B8;color: white;">
							<h4 class ="fontlee">계정 만들기</h4></button>
							</td>
						</tr>
						<!-- naver -->
						<tr>
							<%
							    String clientId = "QvRj8WrRD8KDfZX6YYiy";//NaverDevelopers에서 발급 받은 애플리케이션 클라이언트 아이디값";
							    String redirectURI = URLEncoder.encode("http://localhost:8081/ictedu/login/callback", "UTF-8");////NaverDevelopers에 설정해 놓은 CallBack URL";
							    SecureRandom random = new SecureRandom();
							    String state = new BigInteger(130, random).toString();
							    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							    apiURL += "&client_id=" + clientId;
							    apiURL += "&redirect_uri=" + redirectURI;
							    apiURL += "&state=" + state;
							    session.setAttribute("state", state);
							%>
							<td  colspan="2" style = "text-align: center">
								<a href="<%=apiURL%>">
									<img id="loginBtn" src= "${pageContext.request.contextPath}/resources/img/btnG_naver.png" style = "height :60px; width : 400px">
								</a>
							</td>
						</tr>
						<tr>
							<td colspan="2" style = "text-align: center">
								<!-- 카카오 api  :: account_email-->
								<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=dd28679d6212cc3cd8fee35317a2038a&redirect_uri=http://localhost:8081/ictedu/login/kakaoLogin&response_type=code">
									<img id="loginBtn2" src= "${pageContext.request.contextPath}/resources/img/btnG_kakao.png" style = "height :60px; width : 400px">
								</a>
							</td>
						</tr>
						
						<tr>
							<th> 테스트 ID</th>
							<td>
								<div class="input-group">
									<input type="radio" id="rdo1" name="test_id_selector" value="tea">
									<h3><label for="rdo1">tea</label></h3>
								</div>
								<div class="input-group">
									<input type="radio" id="rdo2" name="test_id_selector" value="teacher">
									<h3><label for="rdo2">teacher</label></h3>
								</div>
								<div class="input-group">
									<input type="radio" id="rdo3" name="test_id_selector" value="sellerfruit">
									<h3><label for="rdo3">sellerfruit</label></h3>
								</div>
						</td>
						</tr>
					</tbody>
				</table>
				<h1>1234</h1>
				<h1>1234</h1>
				<h1>1234</h1>
				<h1>1234</h1>
				<h1>1234</h1>
				<h1>1234</h1>
				<h1>1234</h1>
				<h1>1234</h1>
				<h1>1234</h1>
				<h1>1235</h1>
				
	<%@ include file="/WEB-INF/views/footer.jsp" %>


	<script type="text/javascript">
	$(document).ready(function() {//테스트용 스크립트 -> 테스트 후 삭제
		$("input[type='radio']").click(function() {
			$("#m_id").val( $(this).val() );
			$("#m_pwd").val("1111");
		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		
		
		
		$("#login_btn").click(function() {

			$.post(
					"${pageContext.request.contextPath}/login"
					, {
						m_id : $("#m_id").val()
						, m_pwd : $("#m_pwd").val()
					}
					, function(data, status) {
						if(data == 0){
							alert("아이디와 패스워드가 올바르지 않습니다.");
						} else if(data == 1){
							location.href = "${pageContext.request.contextPath}/main/select";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
		$("#sign_btn").click(function() {
			location.href = "${pageContext.request.contextPath}/login/sign";
		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#m_pwd").keyup(function() {

			if(event.keyCode == 13) {
				$("#login_btn").click();
			}

		});//click
	});//ready
	</script>

	</body>
</html>

