<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<html>
<head>
<meta charset="UTF-8">
<title>냥냥라이프</title>
<%@ include  file ="/WEB-INF/views/style_link.jsp" %>
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
	<!-- 공백용  -->
	<h3>Type</h3>

	<!-- 라디오 + 버튼 혼합  : 구매자 판매자 .. -->
	<div class="btn-group" role="group"
		aria-label="Basic radio toggle button group">
		<input type="radio" class="btn-check" name="btnradio" id="btnradio1"
			value="guest" autocomplete="off" ${btnradioValue eq "guest"?'checked="checked"':''}> <label
			class="btn btn-outline-primary rounded-pill find-btn1"
			for="btnradio1">고객님</label> <input type="radio" class="btn-check"
			name="btnradio" id="btnradio2" value="seller" autocomplete="off" ${btnradioValue eq "seller"?'checked="checked"':''}>
		<label class="btn btn-outline-primary rounded-pill find-btn2"
			for="btnradio2">판매자</label> <input type="radio" class="btn-check"
			name="btnradio" id="btnradio3" value="manager" autocomplete="off" ${btnradioValue eq "manager"?'checked="checked"':''}>
		<label class="btn btn-outline-primary rounded-pill find-btn3"
			for="btnradio3">관리자</label>
	</div>
	
	<table class="table table-hover">
		<tbody>
			<tr>
				<th>아 이 디</th>
				<td><input type="text" id="mid" name="mid" maxlength="20"
					class="form-control"></td>
			</tr>
			<tr>
				<th>패 스 워 드</th>
				<td><input type="password" id="mpwd" name="mpwd" maxlength="20"
					class="form-control"></td>
			</tr>
		</tbody>
	</table>
	<!-- QvRj8WrRD8KDfZX6YYiy -->
	<%
//		네이버
//	    String clientId = "QvRj8WrRD8KDfZX6YYiy";//애플리케이션 클라이언트 아이디값";
	    String clientId = "QvRj8WrRD8KDfZX6YYiy";//애플리케이션 클라이언트 아이디값";
	    String redirectURI = URLEncoder.encode("http://localhost:8081/ictedu/callback", "UTF-8");
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString();
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	    apiURL += "&client_id=" + clientId;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&state=" + state;
	    session.setAttribute("state", state);
	%>
			<div style = "text-align: center; align-content: center;">
				<button id="login_btn" type="button"
					class="btn btn-primary " style = "width : 570px; margin-bottom: 12px" >로그인
				</button>
				<a href="${pageContext.request.contextPath}/signupform">
					<button id="signup_btn" type="button"
					class="btn btn-primary " style = "width : 570px; margin-bottom: 12px" >회원가입</button>
				</a>
				<a href="<%=apiURL%>"><img  width = "125px" height = "45px" style = "margin : 10px"  src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
				<a href="<%=apiURL%>"><img 	width = "125px" height = "45px" style = "margin : 10px"  src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
				<a href="<%=apiURL%>"><img  width = "125px" height = "45px" style = "margin : 10px"  src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
				<a href="<%=apiURL%>"><img  width = "125px" height = "45px" style = "margin : 10px"  src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>	
			</div>
		
 	
	
		
	<%@ include file="/WEB-INF/views/footer.jsp"%>
	
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		$(".btn-check").click(function() {
			location.href="${pageContext.request.contextPath}/loginform?btnradio="+$(this).val();
		});
		
		$("#login_btn").click(function() {

			$.post(
					"${pageContext.request.contextPath}/login"
					, {
						m_id : $("#mid").val()
						, m_pwd : $("#mpwd").val()
						, m_type : "${btnradioValue}"
					}
					, function(data, status) {
						if(data == 0){
							alert("아이디와 패스워드가 올바르지 않습니다.");
						} else if(data == 1){
							if("${btnradioValue}" == 'guest')
								location.href = "${pageContext.request.contextPath}/home";
							if("${btnradioValue}" == 'seller')
								location.href = "${pageContext.request.contextPath}/seller/sellerMain";
							if("${btnradioValue}" == 'manager')
								location.href = "${pageContext.request.contextPath}/manager/managerMain";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post
		});//click
		
		$("#mpwd").keyup(function() {
			if(event.keyCode == 13) {
				$("#login_btn").click();
			}
		});//click
	
	});//ready
	</script>

	
	 
</body>

</html>






